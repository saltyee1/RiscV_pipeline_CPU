//`include "define.v"
module Branch_Taken_Unit (
    input [4:0] opcode,
    input alu_out0,
    output reg branch_taken
);
always@(*) begin
    branch_taken = ((alu_out0 && opcode == `BRANCH) || opcode == `JALR || opcode == `JAL) ? 1'b1 : 1'b0;
end
endmodule
