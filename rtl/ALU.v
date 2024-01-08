//`include "define.v"
module ALU(
    input [4:0]     opcode,
    input [2:0]     func3,
    input [1:0]     func7,
    input [31:0]    alu_src1,
    input [31:0]    alu_src2,
    output reg [31:0]   alu_out
);
//wire [63:0]mul_result_s = $signed(alu_src1) * $signed(alu_src2);
//wire [63:0]mul_result_u = alu_src1 * alu_src2;
wire [63:0]mul_result;
wire sign = (func3[1]) ? 1'b0 : 1'b1;
Wallace_multiplier_64 wm(alu_src1, alu_src2, mul_result, sign);
always @(*) begin
    case(opcode)
        `R_R : begin 
                case(func3) 
                    3'b000  : alu_out = (func7[0]) ? mul_result[31:0] : ((func7[1]) ? ($signed(alu_src1) - $signed(alu_src2)) : ($signed(alu_src1) + $signed(alu_src2))); //func7 1:sub 0:add
                    3'b001  : alu_out = (func7[0]) ? mul_result[63:32] : (alu_src1 <<  alu_src2);   //SLL
                    3'b010  : alu_out = ($signed(alu_src1) < $signed(alu_src2)) ? 32'b1 : 32'b0;   //SLT
                    3'b011  : alu_out = (func7[0]) ? mul_result[63:32] : ((alu_src1 < alu_src2) ? 32'b1 : 32'b0);   //SLTU
                    3'b100  : alu_out = alu_src1 ^ alu_src2; //XOR
                    3'b101  : alu_out = (func7[1]) ? (alu_src1 >>>  alu_src2) : (alu_src1 >>  alu_src2);   //fun7 1:SRA, 0:SRL
                    3'b110  : alu_out = alu_src1 | alu_src2; //OR
                    default : alu_out = alu_src1 & alu_src2; //AND
                endcase
        end
        `R_I : begin
                case(func3)
                    3'b000  : alu_out = ($signed(alu_src1) + $signed(alu_src2)); //ADDI
                    3'b001  : alu_out = alu_src1 <<  alu_src2[4:0];   //SLLI
                    3'b010  : alu_out = ($signed(alu_src1) < $signed(alu_src2)) ? 32'b1 : 32'b0;   //SLTI
                    3'b011  : alu_out = (alu_src1 < alu_src2) ? 32'b1 : 32'b0;   //SLTUI
                    3'b100  : alu_out = alu_src1 ^ alu_src2; //XORI
                    3'b101  : alu_out = (func7[1]) ? (alu_src1 >>>  alu_src2[4:0]) : (alu_src1 >>  alu_src2[4:0]);   //fun7 1:SRAI, 0:SRLI
                    3'b110  : alu_out = alu_src1 | alu_src2; //ORI
                    default : alu_out = alu_src1 & alu_src2; //ANDI
                endcase
        end
        `LUI    : alu_out = (alu_src2);
        `AUIPC  : alu_out = alu_src2 + alu_src1;
        `LOAD   : alu_out = alu_src1 + alu_src2; 
        `STORE  : alu_out = alu_src1 + alu_src2;
        `JAL    : alu_out = alu_src1 + 32'd4;
        `JALR   : alu_out = alu_src1 + 32'd4;
        `BRANCH : begin
            case (func3)
                3'b000  : alu_out = (alu_src1 == alu_src2) ? 32'b1 : 32'b0;    //BEQ
                3'b001  : alu_out = (alu_src1 != alu_src2) ? 32'b1 : 32'b0;    //BNE
                3'b100  : alu_out = ($signed(alu_src1) <  $signed(alu_src2)) ? 32'b1 : 32'b0;    //BLT
                3'b101  : alu_out = ($signed(alu_src1) >= $signed(alu_src2)) ? 32'b1 : 32'b0;    //BGE   
                3'b110  : alu_out = (alu_src1 < alu_src2) ? 32'b1 : 32'b0;    //BLTU
                default : alu_out = (alu_src1 >= alu_src2) ? 32'b1 : 32'b0;    //BGEU
                //default: alu_out = 32'h0000_0000;
            endcase
        end
        default alu_out = 32'b0;
    endcase
end

endmodule
