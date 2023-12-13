module E_M_Reg (
	input clk,
	input reset,
	input [31:0]alu_out,
	input [31:0]rs2_data,
	input [4:0]rd_index,
	input [31:0]jb_addr,
	input branch_taken,
	/*control signal*/
	input [3:0] dm_w_en,
	input halt,
	input wb_sel,
	input wb_en,
	input [2:0] func3,
	output reg[31:0]alu_out_reg,
	output reg[31:0]rs2_data_reg,
	output reg[4:0]rd_index_reg,
	output reg[31:0]jb_addr_reg,
	output reg branch_taken_reg,
	/*control signal*/
	output reg[3:0] dm_w_en_reg,
	output reg halt_reg,
	output reg wb_sel_reg,
	output reg wb_en_reg,
	output reg[2:0] func3_reg,
);

always@(posedge clk or negedge rst) begin
	if(rst)
		
	end
end

endmodule
