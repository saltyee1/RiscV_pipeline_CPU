//`include "adder.v"
module Wallace_multiplier_64(src1, src2, result, sign);
    input [31:0] src1;
    input [31:0] src2;
    input sign;
    output [63:0] result;
    wire [31:0] mcand, mult;
    wire [63:0] product;
    assign mcand = (sign == 1'b1 && src1[31] == 1'b1) ? (~src1 + 32'b1) : src1;
    assign mult = (sign == 1'b1 && src2[31] == 1'b1) ? (~src2 + 32'b1) : src2;
    assign result = (sign == 1'b1 && src1[31]^src2[31]) ? (~product + 32'b1) : product;
    wire [7:0] am1, am2, am3, am4, am5, am6, am7, am8;
    wire [63:0] man1, man2, man3, man4, man5, man6,  man7, man8;
    wire [63:0] l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16;
    wire [15:0] li1, li2, li3, li4, li5, li6, li7, li8, li9, li10, li11, li12, li13, li14, li15, li16;
    wire [63:0] w1, w2, w3, w4, w5, w6;
    assign am1[7:0] = mcand[7:0];
    assign am2[7:0] = mcand[15:8];
    assign am3[7:0] = mcand[23:16];
    assign am4[7:0] = mcand[31:24];

    assign am5[7:0] = mult[7:0];
    assign am6[7:0] = mult[15:8];
    assign am7[7:0] = mult[23:16];
    assign am8[7:0] = mult[31:24];

    wallace bc1(.src1(am1), .src2(am5), .result(li1));
    wallace bc2(.src1(am1), .src2(am6), .result(li2));
    wallace bc3(.src1(am1), .src2(am7), .result(li3));
    wallace bc4(.src1(am1), .src2(am8), .result(li4));
    wallace bc5(.src1(am2), .src2(am5), .result(li5));
    wallace bc6(.src1(am2), .src2(am6), .result(li6));
    wallace bc7(.src1(am2), .src2(am7), .result(li7));
    wallace bc8(.src1(am2), .src2(am8), .result(li8));
    wallace bc9(.src1(am3), .src2(am5), .result(li9));
    wallace bc10(.src1(am3), .src2(am6), .result(li10));
    wallace bc11(.src1(am3), .src2(am7), .result(li11));
    wallace bc12(.src1(am3), .src2(am8), .result(li12));
    wallace bc13(.src1(am4), .src2(am5), .result(li13));
    wallace bc14(.src1(am4), .src2(am6), .result(li14));
    wallace bc15(.src1(am4), .src2(am7), .result(li15));
    wallace bc16(.src1(am4), .src2(am8), .result(li16));

    assign l1 = {48'b0, li1[15:0]};
    assign l2 = {40'b0, li2[15:0], 8'b0};
    assign l5 = {40'b0, li5[15:0], 8'b0};
    assign l6 = {32'b0, li6[15:0], 16'b0};
    assign l9 = {32'b0, li9[15:0], 16'b0};
    assign l3 = {32'b0, li3[15:0], 16'b0};
    assign l4 = {24'b0, li4[15:0], 24'b0};
    assign l7 = {24'b0, li7[15:0], 24'b0};
    assign l10 = {24'b0, li10[15:0], 24'b0};
    assign l13 = {24'b0, li13[15:0], 24'b0};
    assign l11 = {16'b0, li11[15:0], 32'b0};
    assign l14 = {16'b0, li14[15:0], 32'b0};
    assign l8 =  {16'b0, li8[15:0], 32'b0};
    assign l12 = {8'b0, li12[15:0], 40'b0};
    assign l15 = {8'b0, li15[15:0], 40'b0};
    assign l16 = {li16[15:0], 48'b0};

    adder_64 mc1(.src1(l1), .src2(l2), .sum(man1));
    adder_64 mc2(.src1(l3), .src2(l4), .sum(man2));
    adder_64 mc3(.src1(l5), .src2(l6), .sum(man3));
    adder_64 mc4(.src1(l7), .src2(l8), .sum(man4));
    adder_64 mc5(.src1(l9), .src2(l10), .sum(man5));
    adder_64 mc6(.src1(l11), .src2(l12), .sum(man6));
    adder_64 mc7(.src1(l13), .src2(l14), .sum(man7));
    adder_64 mc8(.src1(l15), .src2(l16), .sum(man8));
    adder_64 mc9(.src1(man1), .src2(man2), .sum(w1));
    adder_64 mc10(.src1(man3), .src2(man4), .sum(w2));
    adder_64 mc11(.src1(man5), .src2(man6), .sum(w3));
    adder_64 mc12(.src1(man7), .src2(man8), .sum(w4));
    adder_64 mc13(.src1(w1), .src2(w2), .sum(w5));
    adder_64 mc14(.src1(w3), .src2(w4), .sum(w6));
    adder_64 mc15(.src1(w5), .src2(w6), .sum(product));

endmodule
