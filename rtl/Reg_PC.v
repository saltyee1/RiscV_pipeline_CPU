module Reg_PC (
input clk,
input rst,
input stall,
input [15:0] next_pc,
output reg [15:0] current_pc
);
always @(posedge clk or posedge rst) begin
    if(rst)
        current_pc <= 16'd0;
    else if (stall)
        current_pc <= current_pc;
    else
        current_pc <= next_pc;
end
endmodule
