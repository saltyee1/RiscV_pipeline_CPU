
module adder_64(src1, src2, sum, cout);
input [63:0] src1; 
input [63:0] src2;
output [63:0] sum;
output cout;

wire t1,t2, t3,t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50, t51, t52, t53, t54, t55, t56, t57, t58, t59, t60, t61, t62, t63, t64; 
halfadder f1(src1[0], src2[0], sum[0], t1);
fulladder f2(src1[1], src2[1], t1, sum[1], t2);
fulladder f3(src1[2], src2[2], t2, sum[2], t3);
fulladder f4(src1[3], src2[3], t3, sum[3], t4);
fulladder f5(src1[4], src2[4], t4, sum[4], t5);
fulladder f6(src1[5], src2[5], t5, sum[5], t6);
fulladder f7(src1[6], src2[6], t6, sum[6], t7);
fulladder f8(src1[7], src2[7], t7, sum[7], t8);
fulladder f9(src1[8], src2[8], t8, sum[8], t9);
fulladder f10(src1[9], src2[9], t9, sum[9], t10);
fulladder f11(src1[10], src2[10], t10, sum[10], t11);
fulladder f12(src1[11], src2[11], t11, sum[11], t12);
fulladder f13(src1[12], src2[12], t12, sum[12], t13);
fulladder f14(src1[13], src2[13], t13, sum[13], t14);
fulladder f15(src1[14], src2[14], t14, sum[14], t15);
fulladder f16(src1[15], src2[15], t15, sum[15], t16);
fulladder f21(src1[16], src2[16], t16, sum[16], t17);
fulladder f22(src1[17], src2[17], t17, sum[17], t18);
fulladder f23(src1[18], src2[18], t18, sum[18], t19);
fulladder f24(src1[19], src2[19], t19, sum[19], t20);
fulladder f25(src1[20], src2[20], t20, sum[20], t21);
fulladder f26(src1[21], src2[21], t21, sum[21], t22);
fulladder f27(src1[22], src2[22], t22, sum[22], t23);
fulladder f28(src1[23], src2[23], t23, sum[23], t24);
fulladder f119(src1[24], src2[24], t24, sum[24], t25);
fulladder f29(src1[25], src2[25], t25, sum[25], t26);
fulladder f30(src1[26], src2[26], t26, sum[26], t27);
fulladder f31(src1[27], src2[27], t27, sum[27], t28);
fulladder f32(src1[28], src2[28], t28, sum[28], t29);
fulladder f33(src1[29], src2[29], t29, sum[29], t30);
fulladder f34(src1[30], src2[30], t30, sum[30], t31);
fulladder f35(src1[31], src2[31], t31, sum[31], t32);
fulladder f36(src1[32], src2[32], t32, sum[32], t33);
fulladder f37(src1[33], src2[33], t33, sum[33], t34);
fulladder f38(src1[34], src2[34], t34, sum[34], t35);
fulladder f55(src1[35], src2[35], t35, sum[35], t36);
fulladder f56(src1[36], src2[36], t36, sum[36], t37);
fulladder f455(src1[37], src2[37], t37, sum[37], t38);
fulladder f56434(src1[38], src2[38], t38, sum[38], t39);
fulladder f45641(src1[39], src2[39], t39, sum[39], t40);
fulladder f145(src1[40], src2[40], t40, sum[40], t41);
fulladder f472(src1[41], src2[41], t41, sum[41], t42);
fulladder f42(src1[42], src2[42], t42, sum[42], t43);
fulladder f45(src1[43], src2[43], t43, sum[43], t44);
fulladder f542(src1[44], src2[44], t44, sum[44], t45);
fulladder f53(src1[45], src2[45], t45, sum[45], t46);
fulladder f94(src1[46], src2[46], t46, sum[46], t47);
fulladder f244(src1[47], src2[47], t47, sum[47], t48);
fulladder f412(src1[48], src2[48], t48, sum[48], t49);
fulladder f152(src1[49], src2[49], t49, sum[49], t50);
fulladder f2114(src1[50], src2[50], t50, sum[50], t51);
fulladder f174(src1[51], src2[51], t51, sum[51], t52);
fulladder f172(src1[52], src2[52], t52, sum[52], t53);
fulladder f54(src1[53], src2[53], t53, sum[53], t54);
fulladder f564(src1[54], src2[54], t54, sum[54], t55);
fulladder f456(src1[55], src2[55], t55, sum[55], t56);
fulladder f345(src1[56], src2[56], t56, sum[56], t57);
fulladder f435(src1[57], src2[57], t57, sum[57], t58);
fulladder f451(src1[58], src2[58], t58, sum[58], t59);
fulladder fd4(src1[59], src2[59], t59, sum[59], t60);
fulladder fdsf(src1[60], src2[60], t60, sum[60], t61);
fulladder fd412(src1[61], src2[61], t61, sum[61], t62);
fulladder fds(src1[62], src2[62], t62, sum[62], t63);
fulladder fdf(src1[63], src2[63], t63, sum[63], cout);

endmodule








 