//`include "Wall.v"
module adder_64(src1, src2, sum);
    input [63:0] src1;
    input [63:0] src2;
    output [63:0] sum;

    wire t1,t2, t3,t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32,
    t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50, t51, t52, t53, t54, t55, t56, t57, t58, t59, t60, t61, t62, t63, t64; 
    wire cout;
    halfadder f1(.a(src1[0]), .b(src2[0]), .sum(sum[0]), .carry(t1));
    fulladder f2(.a(src1[1]), .b(src2[1]), .cin(t1), .sum(sum[1]), .carry(t2));
    fulladder f3(.a(src1[2]), .b(src2[2]), .cin(t2), .sum(sum[2]), .carry(t3));
    fulladder f4(.a(src1[3]), .b(src2[3]), .cin(t3), .sum(sum[3]), .carry(t4));
    fulladder f5(.a(src1[4]), .b(src2[4]), .cin(t4), .sum(sum[4]), .carry(t5));
    fulladder f6(.a(src1[5]), .b(src2[5]), .cin(t5), .sum(sum[5]), .carry(t6));
    fulladder f7(.a(src1[6]), .b(src2[6]), .cin(t6), .sum(sum[6]), .carry(t7));
    fulladder f8(.a(src1[7]), .b(src2[7]), .cin(t7), .sum(sum[7]), .carry(t8));
    fulladder f9(.a(src1[8]), .b(src2[8]), .cin(t8), .sum(sum[8]), .carry(t9));
    fulladder f10(.a(src1[9]),  .b(src2[9]),  .cin(t9),  .sum(sum[9]),  .carry(t10));
    fulladder f11(.a(src1[10]), .b(src2[10]), .cin(t10), .sum(sum[10]), .carry(t11));
    fulladder f12(.a(src1[11]), .b(src2[11]), .cin(t11), .sum(sum[11]), .carry(t12));
    fulladder f13(.a(src1[12]), .b(src2[12]), .cin(t12), .sum(sum[12]), .carry(t13));
    fulladder f14(.a(src1[13]), .b(src2[13]), .cin(t13), .sum(sum[13]), .carry(t14));
    fulladder f15(.a(src1[14]), .b(src2[14]), .cin(t14), .sum(sum[14]), .carry(t15));
    fulladder f16(.a(src1[15]), .b(src2[15]), .cin(t15), .sum(sum[15]), .carry(t16));
    fulladder f21(.a(src1[16]), .b(src2[16]), .cin(t16), .sum(sum[16]), .carry(t17));
    fulladder f22(.a(src1[17]), .b(src2[17]), .cin(t17), .sum(sum[17]), .carry(t18));
    fulladder f23(.a(src1[18]), .b(src2[18]), .cin(t18), .sum(sum[18]), .carry(t19));
    fulladder f24(.a(src1[19]), .b(src2[19]), .cin(t19), .sum(sum[19]), .carry(t20));
    fulladder f25(.a(src1[20]), .b(src2[20]), .cin(t20), .sum(sum[20]), .carry(t21));
    fulladder f26(.a(src1[21]), .b(src2[21]), .cin(t21), .sum(sum[21]), .carry(t22));
    fulladder f27(.a(src1[22]), .b(src2[22]), .cin(t22), .sum(sum[22]), .carry(t23));
    fulladder f28(.a(src1[23]), .b(src2[23]), .cin(t23), .sum(sum[23]), .carry(t24));
    fulladder f119(.a(src1[24]), .b(src2[24]), .cin(t24), .sum(sum[24]), .carry(t25));
    fulladder f29(.a(src1[25]), .b(src2[25]), .cin(t25), .sum(sum[25]), .carry(t26));
    fulladder f30(.a(src1[26]), .b(src2[26]), .cin(t26), .sum(sum[26]), .carry(t27));
    fulladder f31(.a(src1[27]), .b(src2[27]), .cin(t27), .sum(sum[27]), .carry(t28));
    fulladder f32(.a(src1[28]), .b(src2[28]), .cin(t28), .sum(sum[28]), .carry(t29));
    fulladder f33(.a(src1[29]), .b(src2[29]), .cin(t29), .sum(sum[29]), .carry(t30));
    fulladder f34(.a(src1[30]), .b(src2[30]), .cin(t30), .sum(sum[30]), .carry(t31));
    fulladder f35(.a(src1[31]), .b(src2[31]), .cin(t31), .sum(sum[31]), .carry(t32));
    fulladder f36(.a(src1[32]), .b(src2[32]), .cin(t32), .sum(sum[32]), .carry(t33));
    fulladder f37(.a(src1[33]), .b(src2[33]), .cin(t33), .sum(sum[33]), .carry(t34));
    fulladder f38(.a(src1[34]), .b(src2[34]), .cin(t34), .sum(sum[34]), .carry(t35));
    fulladder f55(.a(src1[35]), .b(src2[35]), .cin(t35), .sum(sum[35]), .carry(t36));
    fulladder f56(.a(src1[36]), .b(src2[36]), .cin(t36), .sum(sum[36]), .carry(t37));
    fulladder f455(.a(src1[37]), .b(src2[37]), .cin(t37), .sum(sum[37]), .carry(t38));
    fulladder f56434(.a(src1[38]), .b(src2[38]), .cin(t38), .sum(sum[38]), .carry(t39));
    fulladder f45641(.a(src1[39]), .b(src2[39]), .cin(t39), .sum(sum[39]), .carry(t40));
    fulladder f145(.a(src1[40]), .b(src2[40]), .cin(t40), .sum(sum[40]), .carry(t41));
    fulladder f472(.a(src1[41]), .b(src2[41]), .cin(t41), .sum(sum[41]), .carry(t42));
    fulladder f42(.a(src1[42]), .b(src2[42]), .cin(t42), .sum(sum[42]), .carry(t43));
    fulladder f45(.a(src1[43]), .b(src2[43]), .cin(t43), .sum(sum[43]), .carry(t44));
    fulladder f542(.a(src1[44]), .b(src2[44]), .cin(t44), .sum(sum[44]), .carry(t45));
    fulladder f53(.a(src1[45]), .b(src2[45]), .cin(t45), .sum(sum[45]), .carry(t46));
    fulladder f94(.a(src1[46]), .b(src2[46]), .cin(t46), .sum(sum[46]), .carry(t47));
    fulladder f244(.a(src1[47]), .b(src2[47]), .cin(t47), .sum(sum[47]), .carry(t48));
    fulladder f412(.a(src1[48]), .b(src2[48]), .cin(t48), .sum(sum[48]), .carry(t49));
    fulladder f152(.a(src1[49]), .b(src2[49]), .cin(t49), .sum(sum[49]), .carry(t50));
    fulladder f2114(.a(src1[50]), .b(src2[50]), .cin(t50), .sum(sum[50]), .carry(t51));
    fulladder f174(.a(src1[51]), .b(src2[51]), .cin(t51), .sum(sum[51]), .carry(t52));
    fulladder f172(.a(src1[52]), .b(src2[52]), .cin(t52), .sum(sum[52]), .carry(t53));
    fulladder f54(.a(src1[53]), .b(src2[53]), .cin(t53), .sum(sum[53]), .carry(t54));
    fulladder f564(.a(src1[54]), .b(src2[54]), .cin(t54), .sum(sum[54]), .carry(t55));
    fulladder f456(.a(src1[55]), .b(src2[55]), .cin(t55), .sum(sum[55]), .carry(t56));
    fulladder f345(.a(src1[56]), .b(src2[56]), .cin(t56), .sum(sum[56]), .carry(t57));
    fulladder f435(.a(src1[57]), .b(src2[57]), .cin(t57), .sum(sum[57]), .carry(t58));
    fulladder f451(.a(src1[58]), .b(src2[58]), .cin(t58), .sum(sum[58]), .carry(t59));
    fulladder fd4(.a(src1[59]), .b(src2[59]), .cin(t59), .sum(sum[59]), .carry(t60));
    fulladder fdsf(.a(src1[60]), .b(src2[60]), .cin(t60), .sum(sum[60]), .carry(t61));
    fulladder fd412(.a(src1[61]), .b(src2[61]), .cin(t61), .sum(sum[61]), .carry(t62));
    fulladder fds(.a(src1[62]), .b(src2[62]), .cin(t62), .sum(sum[62]), .carry(t63));
    fulladder fdf(.a(src1[63]), .b(src2[63]), .cin(t63), .sum(sum[63]), .carry(cout));

endmodule








 
