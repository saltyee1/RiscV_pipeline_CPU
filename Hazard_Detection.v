module Hazard_Detection (
	input [4:0] F_D_rs1_index,
	input [4:0] F_D_rs2_index,
	input D_E_wb_en,
	input [4:0] D_E_rd_index,
	input E_M_branch_taken,
	output reg F_D_flush,
	output reg D_E_flush,
	output reg E_M_flush,
	output reg PC_stall,
	output reg F_D_stall
);

reg load_used_DH_flag;
always@(*) begin
	if((F_D_rs1_index == D_E_rd_index) || (F_D_rs2_index == D_E_rd_index))
		if(D_E_wb_en != 1'b0)
			load_used_DH_flag = 1'b1;
		else
			load_used_DH_flag = 1'b0;
	else
		load_used_DH_flag = 1'b0;
end  

always@(*)begin
	F_D_flush = (E_M_branch_taken) ? 1'b1 : 1'b0;	//F_D_reg only flush when branch or jump 
	D_E_flush = (E_M_branch_taken | load_used_DH_flag) ? 1'b1 : 1'b0;	//D_E_reg flush when branch or jump or load used DH
	E_M_flush = (E_M_branch_taken) ? 1'b1 : 1'b0;	//E_M_reg only flush when branch or jump 
	PC_stall = (load_used_DH_flag) ? 1'b1 : 1'b0;	//PC_reg stall only when branch or jump
	F_D_stall = (load_used_DH_flag) ? 1'b1 : 1'b0;	//F_D_reg stall only when branch or jump
end
endmodule
