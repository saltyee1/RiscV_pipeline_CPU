module M_W_Reg (
	input clk,
	input rst,
	input [31:0] dm_out,
	input [31:0] alu_out,
	input [4:0] rd_index,
	/*control signal*/
	input ecall_sig,
	input wb_sel,
	input wb_en,
	input [2:0]func3,
	output reg[31:0] dm_out_reg,
	output reg[31:0] alu_out_reg,
	output reg[4:0] rd_index_reg,
	/*control signal*/
	output reg ecall_sig_reg,
	output reg wb_sel_reg,
	output reg wb_en_reg,
	output reg [2:0]func3_reg
);
always @(negedge clk or negedge rst) begin
	if(!rst) begin
		dm_out_reg <= 32'b0;
		alu_out_reg <= 32'b0;
		rd_index_reg <= 5'b0;
		ecall_sig_reg <= 1'b0;
		wb_sel_reg <= 1'b0;
		wb_en_reg <= 1'b0;
		func3_reg <= 3'b0;
	end
	else begin
		dm_out_reg <= dm_out;
		alu_out_reg <= alu_out;
		rd_index_reg <= rd_index;
		ecall_sig_reg <= ecall_sig;
		wb_sel_reg <= wb_sel;
		wb_en_reg <= wb_en;
		func3_reg <= func3;
	end
end
endmodule
