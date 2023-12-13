module D_E_Reg (
	input clk,
	input reset,
	input [4:0] rs1_index,
	input [4:0] rs2_index,
	input [4:0] rd_index,
	input [31:0] rs1_data,
	input [31:0] rs2_data,
	input [31:0] imm_out,
	input [31:0] pc,
	/*control signal*/
	input alu_op1_sel,
	input alu_op2_sel,
	input jb_op1_sel,
	input [4:0] opcode,
	input [2:0] func3,
	input func7,
	input [3:0] dm_w_en,
	input halt,
	input wb_sel,
	input wb_en,
	
	output reg[4:0] rs1_index_reg,
	output reg[4:0] rs2_index_reg,
	output reg[4:0] rd_index_reg,
	output reg[31:0] rs1_data_reg,
	output reg[31:0] rs2_data_reg,
	output reg[31:0] imm_out_reg,
	output reg[31:0] pc_reg,
	/*control signal*/
	output reg alu_op1_sel_reg,
	output reg alu_op2_sel_reg,
	output reg jb_op1_sel_reg,
	output reg [4:0] opcode_reg,
	output reg [2:0] func3_reg,
	output reg func7_reg,
	output reg [3:0] dm_w_en_reg,
	output reg halt_reg,
	output reg wb_sel_reg,
	output reg wb_en_reg,			
);

always@(posedge clk or negedge rst) begin
	if(!rst) begin
		rs1_index_reg <= 5'b0;
		rs2_index_reg <= 5'b0;
		rd_index_reg <= 32'b0;
		rs1_data_reg <= 32'b0;
		rs2_data_reg <= 32'b0;
		imm_out_reg <= 32'b0;
		pc_reg <= 32'b0;
	/*control signal*/
		alu_op1_sel_reg <= 1'b0;
		alu_op2_sel_reg <= 1'b0;
		jb_op1_sel_reg <= 1'b0;
		opcode_reg <= 5'b0;
		func3_reg <= 3'b0;
		func7_reg <= 1'b0;
		dm_w_en_reg <= 4'b0;
		halt_reg <= 1'b0;
		wb_sel_reg <= 1'b0;
		wb_en_reg <= 1'b0;
	end	
	else begin
		rs1_index_reg <= rs1_index;
		rs2_index_reg <= rs2_index;
		rd_index_reg <= rd_index;
		rs1_data_reg <= rs1_data;
		rs2_data_reg <= rs2_data;
		imm_out_reg <= imm_out;
		pc_reg <= pc_reg;
	/*control signal*/
		alu_op1_sel_reg <= alu_op1_sel;
		alu_op2_sel_reg <= alu_op2_sel;
		jb_op1_sel_reg <= jb_op1_sel;
		opcode_reg <= opcode;
		func3_reg <= func3;
		func7_reg <= func7;
		dm_w_en_reg <= dm_w_en;
		halt_reg <= halt;
		wb_sel_reg <= wb_sel;
		wb_en_reg <= wb_en;
	end				
end
endmodule
