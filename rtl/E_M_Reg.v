module E_M_Reg (
	input clk,
	input rst,
	input flush,
	input [31:0]alu_out,
	input [31:0]rs2_data,
	input [4:0]rd_index,
	input [31:0]jb_addr,
	input branch_taken,
	input is_branch,
	input is_jalr,
	input guess,
	input [1:0]inst_type,
	/*control signal*/
	input [3:0] dm_w_en,
	input ecall_sig,
	input wb_sel,
	input wb_en,
	input [2:0] func3,
	input [31:0] pc,

	output reg[31:0]alu_out_reg,
	output reg[31:0]rs2_data_reg,
	output reg[4:0]rd_index_reg,
	output reg[31:0]jb_addr_reg,
	output reg branch_taken_reg,
	output reg is_branch_reg,
	output reg is_jalr_reg,
	output reg guess_reg,
	output reg [1:0]inst_type_reg,
	output reg pc_reg,
	/*control signal*/
	output reg[3:0] dm_w_en_reg,
	output reg ecall_sig_reg,
	output reg wb_sel_reg,
	output reg wb_en_reg,
	output reg[2:0] func3_reg
);

always@(negedge clk or negedge rst) begin
	if(!rst) begin
		alu_out_reg <= 32'b0;
		rs2_data_reg <= 32'b0;
		rd_index_reg <= 5'b0;
		jb_addr_reg <= 32'b0;
		guess_reg <= 1'b0;
		pc_reg <= 32'b0;
		/*control signal*/
		branch_taken_reg <= 1'b0;
		is_branch_reg <= 1'b0;
		is_jalr_reg <= 1'b0;
		inst_type_reg <= 2'b0;
		dm_w_en_reg <= 4'b0;
	 	ecall_sig_reg <= 1'b0;
		wb_sel_reg <= 1'b0;
		wb_en_reg <= 1'b0;
		func3_reg <= 3'b0;
	end
	else begin
		alu_out_reg <= alu_out;
		rs2_data_reg <= rs2_data;
		rd_index_reg <= rd_index;
		jb_addr_reg <= jb_addr;
		guess_reg <= guess;
		pc_reg <= pc;
		if(flush) begin
			branch_taken_reg <= 1'b0;
			is_jalr_reg <= 1'b0;
			is_branch_reg <= 1'b0;
			inst_type_reg <= 2'b0;
			dm_w_en_reg <= 4'b0;
		 	ecall_sig_reg <= 1'b0;
			wb_sel_reg <= 1'b0;
			wb_en_reg <= 1'b0;
			func3_reg <= 3'b0;
		end
		else begin
			branch_taken_reg <= branch_taken;
			is_jalr_reg <= is_jalr;
			is_branch_reg <= is_branch;
			inst_type_reg <= inst_type;
			dm_w_en_reg <= dm_w_en;
		 	ecall_sig_reg <= ecall_sig;
			wb_sel_reg <= wb_sel;
			wb_en_reg <= wb_en;
			func3_reg <= func3;
		end
	end
end

endmodule
