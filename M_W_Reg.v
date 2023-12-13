module M_W_Reg (
	input clk,
	input rst,
	input [31:0] dm_out,
	input [31:0] alu_out,
	input [4:0] rd_index,
	/*control signal*/
	input halt,
	input wb_sel,
	input wb_en,
	input [2:0]func3,
	output reg[31:0] dm_out_reg,
	output reg[31:0] alu_out_reg,
	output reg[4:0] rd_index_reg,
	/*control signal*/
	output reg halt_reg,
	output reg wb_sel_reg,
	output reg wb_en_reg,
	output reg [2:0]func3_reg,
);
endmodule
