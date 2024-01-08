module Mux4_1(
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input [1:0] sel,
    output reg [31:0] result
);

always @(*) begin
    case (sel)
        2'h1 : result = in1;
        2'h2 : result = in2;
        default : result = in0;
        //2'h3 : result = in3;
    endcase
end

endmodule
