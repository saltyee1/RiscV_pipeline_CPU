module F_D_Reg (
	input clk,
	input rst,
	input stall,			//update or not
	input flush,
	input [31:0] inst,
	input [31:0] pc,
	input guess,
	output reg[31:0] inst_reg,
	output reg[31:0] pc_reg,
	output reg guess_reg, 
);

always@(negedge clk or negedge rst) begin
	if(!rst) begin
		inst_reg <= 32'hffffffff;
		pc_reg <= 32'b0;
		guess_reg <= 1'b0;
	end
	else if (flush) begin
		inst_reg <= 32'hffffffff;
		pc_reg <= 32'b0;
		guess_reg <= 1'b0;
	end
	else if (stall) begin
		inst_reg <= inst_reg;
		pc_reg <= pc_reg;
		guess_reg <= guess_reg;
	end
	else begin
		inst_reg <= inst;
		pc_reg <= pc;
		guess_reg <= guess;
	end
end
endmodule
