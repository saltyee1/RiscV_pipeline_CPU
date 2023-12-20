module Next_Pc_Calculator (
    input [31:0] current_pc,
    input [31:0] e_m_pc,
    input [31:0] inst,
    input e_m_is_jalr,
    input e_m_hit,
    input branch_predict,
    input e_m_branch_taken,
    input [31:0] e_m_baddr,          
    output[31:0] next_pc
);
parameter jump  = 1'b1;
parameter notjp = 1'b0;
wire [31:0] e_m_pc4 = e_m_pc + 32'd4;
wire [31:0] branch_taken_choice_out;
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

wire jal_sig = (inst[6:2] == `JAL) ? 1'b1: 1'b0;
wire [31:0] current_baddr = imm_ext_bp_out + current_pc; 

wire predict_out = ((branch_predict == jump) && (inst[6:0] == `BRANCH)) ? (current_baddr) : (current_pc + 32'd4); //current baddr or current pc +4
                        // FSM predict                  jump       or not jump 
jp_br_mux jb_mux(
    jal_sig (jal_sig),
    e_m_hit_choice_out (e_m_hit),
    current_baddr (current_baddr),
    jump_taken (e_m_is_jalr),
    e_m_baddr (e_m_baddr),
    jp_br_mux_out (next_pc)
);

Mux branch_taken_choice(
    .true_choice (e_m_pc4),
    .false_choice(e_m_baddr),
    .sel   (e_m_branch_taken),
    .result(branch_taken_choice_out)
);

Mux EM_hit_choice(
    .true_choice (predict_out),
    .false_choice(branch_taken_choice_out),
    .sel   (e_m_hit_result),  // module haven't write
    .result(e_m_hit_choice_out)
);

endmodule