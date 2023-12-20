module jp_br_mux (
    input jal_sig,
    input [31:0] em_hit_choice_out,
    input [31:0] current_baddr,
    input jump_taken,
    input [31:0] embaddr,
    output reg [31:0] jp_br_mux_out
);
    always @(*) begin
        if(jump_taken == 1'b1) 
            jp_br_mux_out = em_baddr;
        else if(jal_sig == 1'b1)
            jp_br_mux_out = current_baddr;
        else
            jp_br_mux_out = em_hit_choice_out;
    end

endmodule