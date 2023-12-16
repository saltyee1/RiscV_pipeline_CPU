module F_D_Reg (
	input clk,
	input rst,
	input stall,			//update or not
	input flush,
	input [31:0] inst,
	input [31:0] pc,
	output reg[31:0] inst_reg,
	output reg[31:0] pc_reg 
);

always@(negedge clk or negedge rst) begin
	if(!rst) begin
		inst_reg <= 32'hffffffff;
		pc_reg <= 32'b0;
	end
	else if (flush) begin
		inst_reg <= 32'hffffffff;
		pc_reg <= 32'b0;
	end
	else if (stall) begin
		inst_reg <= inst_reg;
		pc_reg <= pc_reg;
	end
	else begin
		inst_reg <= inst;
		pc_reg <= pc;
	end
end
endmodule
