`include "../rtl/define.v"
module Branch_Taken_Unit (
    input [4:0] opcode,
    input alu_out0,
    output reg branch_taken,
    output is_branch,
    output [1:0]inst_type,
    output is_jalr
);

assign is_branch = (opcode == `BRANCH) ? 1'b1 : 1'b0;
assign is_jalr = (opcode == `JALR) ? 1'b1 : 1'b0;

assign inst_type = {is_branch, is_jalr};

always@(*) begin
    branch_taken = (alu_out0 && is_branch) ? 1'b1 : 1'b0;
end
endmodule
