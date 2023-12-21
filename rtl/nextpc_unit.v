module nextpc_unit (
    input [31:0] inst, 
    input [31:0] current_pc,
    input [31:0] em_pc,
    input [31:0] em_baddr,
    input c_guess, // Branch_Predictor port  .Guess_result()
    input em_guess,
    input hit,
    input [1:0] em_type,
    output reg [31:0] nextpc
);
    
    
reg [31:0] imm_ext_bp_out;
    /*imm_ext*/
    always@(*) begin
        case(inst[6:2])
            `JALR   : imm_ext_bp_out = {{20{inst[31]}}, inst[31:20]};  //I_Type
            `BRANCH : imm_ext_bp_out = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8] , 1'b0};    //B_Type
            `JAL    : imm_ext_bp_out = {{12{inst[31]}}, inst[19:12] , inst[20] , inst[30:21] , 1'b0};   //J_Type
            default : imm_ext_bp_out = 32'b0;
        endcase 
    end    

    // current address choose jump 
    parameter jump = 1'b1;
    wire [31:0] current_baddr = imm_ext_bp_out + current_pc;
    wire [31:0] current_pc4   = current_pc + 32'd4; 
                        // JAL --> always jump
                        // Branch and predict jump --> jump
                        // other --> pc + 4 
    wire [31:0] current_out = (inst[6:2] == `JAL) ? (current_baddr): 
                       (((c_guess == jump) && (inst[6:2] == `BRANCH)) ? (current_baddr) : (current_pc4)); 

    // em hit check and mux part 
    wire [31:0] hit_mux_out;
    wire [31:0] em_pc4   = em_pc + 32'd4;
    wire [31:0] em_guess_out = (!em_guess) ? (em_pc4) : (em_baddr);
    Mux hit_mux_unit(
        .true_choice (current_out ),
        .false_choice(em_guess_out),
        .sel (hit),
        .result (hit_mux_out)
    );
    // last output part
    parameter jalr      = 2'd1;
    parameter hit_mux   = 2'd2;
    parameter other_ins = 2'd0;
    always @(*) begin
        case (em_type)
            jalr     : nextpc = em_baddr;
            hit_mux  : nextpc = hit_mux_out;
            other_ins: nextpc = current_out;
            default: nextpc = 32'bXXXX_XXXX_XXXX_XXXX_XXXX_XXXX_XXXX_XXXX;
        endcase
    end

endmodule