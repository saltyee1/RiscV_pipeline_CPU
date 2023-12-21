module Forwarding_Unit(
	input E_M_wb_en,
	input M_W_wb_en,
	input [4:0] D_E_rs1_index,
	input [4:0] D_E_rs2_index,
	input [4:0] E_M_rd_index,
	input [4:0] M_W_rd_index,
	output reg [1:0]rs1_sel,
	output reg [1:0]rs2_sel
);
parameter not_forward = 2'd0;
parameter forward_M = 2'd1;
parameter forward_W = 2'd2;
always@(*) begin
	if (D_E_rs1_index == E_M_rd_index && E_M_wb_en && (E_M_rd_index != 5'b0))
		rs1_sel = forward_M;
	else if (D_E_rs1_index == M_W_rd_index && M_W_wb_en && (M_W_rd_index != 5'b0))
		rs1_sel = forward_W;
	else 
		rs1_sel = not_forward;
end

always@(*) begin
	if (D_E_rs2_index == E_M_rd_index && E_M_wb_en && (E_M_rd_index != 5'b0))
		rs2_sel = forward_M;
	else if (D_E_rs2_index == M_W_rd_index && M_W_wb_en && (M_W_rd_index != 5'b0))
		rs2_sel = forward_W;
	else 
		rs2_sel = not_forward;
end

endmodule
