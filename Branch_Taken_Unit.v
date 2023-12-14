module Branch_Taken_Unit (
    input [4:0] opcode,
    input alu_out0,
    output branch_taken
);
wire branch_taken = ((alu_out0 && opcode == `BRANCH)|| opcode == `JALR || opcode == `JAL) ? 1'b1 : 1'b0;
endmodule