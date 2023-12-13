module Hazard_Detection (
	input [4:0] F_D_rs1_index,
	input [4:0] F_D_rs2_index,
	input [3:0] D_E_dm_w_en,
	input [4:0] D_E_rd_index,
	input E_M_branch_taken,
	output F_D_flush,
	output D_E_flush,
	output E_M_flush,
	output PC_stall,
	output F_D_stall
);

reg load_used_DH_flag;
always@(*) begin
	if((F_D_rs1_index == D_E_rd_index) || (F_D_rs2_index == D_E_rd_index))
		if(D_E_dm_w_en != 4'b0)
			load_used_DH_flag = 1'b1;
		else
			load_used_DH_flag = 1'b0;
	else
		load_used_DH_flag = 1'b0;
end  

wire F_D_flush = (E_M_branch_taken) ? 1'b1 : 1'b0;	//F_D_reg only flush when branch or jump 
wire D_E_flush = (E_M_branch_taken | load_used_DH_flag) ? 1'b1 : 1'b0;	//D_E_reg flush when branch or jump or load used DH
wire E_M_flush = (E_M_branch_taken) ? 1'b1 : 1'b0;	//E_M_reg only flush when branch or jump 
wire PC_stall = (load_used_DH_flag) ? 1'b1 : 1'b0;	//PC_reg stall only when branch or jump
wire F_D_stall = (load_used_DH_flag) ? 1'b1 : 1'b0;	//F_D_reg stall only when branch or jump
endmodule
