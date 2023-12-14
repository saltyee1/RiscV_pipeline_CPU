/*`include "define.sv"
`include "ALU.sv"
`include "Controller.sv"
`include "Decoder.sv"
`include "Imme_Ext.sv"
`include "JB_Unit.sv"
`include "LD_Filter.sv"
`include "Mux.sv"
`include "Reg_PC.sv"
`include "RegFile.sv"
`include "SRAM.sv"*/
module Top (
    input clk,
    input rst,
    output halt
);
wire [4:0]  opcode;
wire [2:0]  func3;
wire        func7;
wire [31:0] alu_src1, alu_src2, alu_out;
wire [31:0] imm_ext_out;
wire [31:0] inst,inst_reg;

wire [4:0]  rs1_index;
wire [4:0]  rs2_index;
wire [4:0]  rd_index;

wire [31:0] JB_src1, JB_out;
wire [31:0] ld_data_f;

wire [31:0] current_pc, next_pc;

wire [3:0]  im_w_en, dm_w_en;
wire        wb_en;
wire [31:0] dm_read_data;
wire [31:0] rs1_data_out, rs2_data_out;
wire [31:0] wb_data;

wire next_pc_sel, jb_src1_sel, alu_src1_sel, alu_src2_sel, wb_sel;
wire ecall_sig;

wire pc_stall; // high when load used DH
wire f_d_stall,f_d_flush;
wire d_e_flush;
wire e_m_flush;
wire [1:0] rs1_forward_sel;
wire [1:0] rs2_forward_sel;
wire [31:0] rs1_data_f;
wire [31:0] rs2_data_f;

/*pipeline register signal*/
//EXE state
wire [31:0] rs1_data_reg_d_e;
wire [4:0] rs1_index_reg_d_e;
wire [4:0] rs2_index_reg_d_e;
wire [31:0] imm_out_reg_d_e;
wire alu_src1_sel_reg_d_e ;
wire alu_src2_sel_reg_d_e;
wire jb_src1_sel_reg_d_e;
wire [4:0] opcode_reg_d_e;
wire [2:0] func3_reg_d_e;
wire func7_reg_d_e;

//MEM state
wire [31:0] jb_addr_reg_e_m;
wire branch_taken_reg_e_m;

wire [31:0] pc_reg_f_d, pc_reg_d_e, pc_reg_e_m;
wire [4:0] rd_index_reg_d_e, rd_index_reg_e_m, rd_index_reg_m_w;
wire ecall_sig_reg_d_e, ecall_sig_reg_e_m, ecall_sig_reg_m_w;
wire [31:0] rs2_data_reg_d_e, rs2_data_reg_e_m;
wire [31:0] alu_out_reg_e_m, alu_out_reg_m_w;
wire [2:0] func3_reg_d_e, func3_reg_e_m, func3_reg_m_w;
wire [3:0] dm_w_en_reg_d_e, dm_w_en_reg_e_m;
wire wb_sel_reg_d_e, wb_sel_reg_e_m, wb_sel_reg_m_w;
wire wb_en_reg_d_e, wb_en_reg_e_m, wb_en_reg_m_w;

Reg_PC PC(
    .clk (clk),
    .rst (rst),
    .stall (pc_stall),
    .next_pc (next_pc),
    .current_pc (current_pc)
);

SRAM im(
    .clk (clk),
    .w_en (4'b0),
    .address (current_pc),
    .write_data (32'b0),
    .read_data (inst)
);

F_D_Reg f_d_reg (
	clk (clk),
	rst (rst),
	stall (f_d_stall),			//update or not
	flush (f_d_flush),          //flush or not
	inst (inst),
	pc (current_pc),
	inst_reg(inst_reg),
	pc_reg (pc_reg_f_d)
);

Decoder decoder(
    .inst (inst_reg),
    .dc_out_opcode (opcode),
    .dc_out_func3 (func3),
    .dc_out_func7 (func7),
    .dc_out_rs1_index (rs1_index),
    .dc_out_rs2_index (rs2_index),
    .dc_out_rd_index (rd_index)
);

RegFile regfile(
    .clk (clk),
    .reset (rst),
    .ecall_sig (ecall_sig_reg_m_w),
    .wb_en (wb_en_reg_m_w),
    .wb_data (wb_data),
    .rd_index (rd_index_reg_m_w),
    .rs1_index (rs1_index),
    .rs2_index (rs2_index),
    .rs1_data_out (rs1_data_out),
    .rs2_data_out (rs2_data_out),
    .halt (halt)
);

Imm_Ext imm_ext(
    .inst (inst_reg),
    .imm_ext_out (imm_ext_out)
);

Controller contr(
    .opcode (opcode),
    .func3 (func3),
    .func7 (func7),
    //.alu_branch (alu_out[0]),
    //.next_pc_sel (next_pc_sel),
    .im_w_en (im_w_en),
    .dm_w_en (dm_w_en),
    .wb_en (wb_en),
    .jb_src1_sel (jb_src1_sel),
    .alu_src1_sel (alu_src1_sel),
    .alu_src2_sel (alu_src2_sel),
    .wb_sel (wb_sel),
    .ecall_sig(ecall_sig)
);

D_E_Reg d_e_reg(
	clk (clk),
	rst (rst),
    flush (d_e_flush)
	rs1_index (rs1_index),
	rs2_index (rs2_index),
	rd_index (rd_index),
	rs1_data (rs1_data_out),
	rs2_data (rs2_data_out),
	imm_out (imm_ext_out),
	pc (pc_reg_f_d),
	/*control signal*/
	alu_src1_sel (alu_src1_sel),
	alu_src2_sel (alu_src2_sel),
	jb_src1_sel (jb_src1_sel),
	opcode (opcode),
	func3 (func3),
	func7 (func7),
	dm_w_en (dm_w_en),
	ecall_sig (ecall_sig),
	wb_sel (wb_sel),
	wb_en (w_en),
	
	rs1_index_reg (rs1_index_reg_d_e),
	rs2_index_reg (rs2_index_reg_d_e),
	rd_index_reg (rd_index_reg_d_e),
	rs1_data_reg (rs1_data_reg_d_e),
	rs2_data_reg (rs2_data_reg_d_e),
	imm_out_reg (imm_out_reg_d_e),
	pc_reg (pc_reg_d_e),
	/*control signal*/
	alu_src1_sel_reg (alu_src1_sel_reg_d_e),
	alu_src2_sel_reg (alu_src2_sel_reg_d_e),
	jb_src1_sel_reg (jb_src1_sel_reg_d_e),
	opcode_reg (opcode_reg_d_e),
	func3_reg (func3_reg_d_e),
	func7_reg (func7_reg_d_e),
	dm_w_en_reg (dm_w_en_reg_d_e),
	ecall_sig_reg (ecall_sig_reg_d_e),
	wb_sel_reg (wb_sel_reg_d_e),
	wb_en_reg (wb_en_reg_d_e)			
);

Mux4_1 rs1_f(
    .in0 (rs1_data_reg_d_e),
    .in1 (alu_out_reg_e_m),
    .in2 (alu_out_reg_m_w),
    .in3 (rs1_data_reg_d_e),
    .sel (rs1_forward_sel),
    .result (rs1_data_f),
); //choose rs1_data forward or not

Mux m2(
    .true_choice(pc_reg_d_e),
    .false_choice(rs1_data_f),
    .sel(alu_src1_sel_reg_d_e),
    .result(alu_src1)
);  //choose alu_src1

Mux4_1 rs2_f(
    .in0 (rs2_data_reg_d_e),
    .in1 (alu_out_reg_e_m),
    .in2 (alu_out_reg_m_w),
    .in3 (rs2_data_reg_d_e),
    .sel (rs2_forward_sel),
    .result (rs2_data_f),
); //choose rs1_data forward or not

Mux m3(
    .true_choice(rs2_data_f),
    .false_choice(imm_out_reg_d_e),
    .sel(alu_src2_sel_reg_d_e),
    .result(alu_src2)
);  //choose alu_src2

ALU alu (
    .opcode (opcode_reg_d_e),
    .func3 (func3_reg_d_e),
    .func7 (func7_reg_d_e),
    .alu_src1 (alu_src1),
    .alu_src2 (alu_src2),
    .alu_out (alu_out)
);

Branch_Taken_Unit btu(
    .opcode (opcode_reg_d_e),
    .alu_out0 (alu_out[0]),
    .branch_taken (branch_taken)
);  //next pc select

Mux m4(
    .true_choice(rs1_data_f),
    .false_choice(pc_reg_d_e),
    .sel(jb_src1_sel_reg_d_e),
    .result(JB_src1)
);  //choose JB_src1

JB_Unit jb_unit(
    .opcode (opcode_reg_d_e),
    .JB_src1 (JB_src1),
    .JB_src2 (imm_out_reg_d_e),
    .JB_out (JB_out)  
);

E_M_Reg e_m_reg (
	clk (clk),
	rst (rst),
	flush (e_m_flush),
	alu_out (alu_out),
	rs2_data (rs2_data_f),
	rd_index (rd_index_reg_d_e),
	jb_addr (JB_out),
	branch_taken (branch_taken),
	/*control signal*/
	dm_w_en (dm_w_en_reg_d_e),
	ecall_sig (ecall_sig_reg_d_e),
	wb_sel (wb_sel_reg_d_e),
	wb_en (wb_en_reg_d_e),
	func3 (func3_reg_d_e),

	alu_out_reg (alu_out_reg_e_m),
	rs2_data_reg (rs2_data_reg_e_m),
	rd_index_reg (rd_index_reg_e_m),
	jb_addr_reg (jb_addr_reg_e_m),
	branch_taken_reg (branch_taken_reg_e_m),
	/*control signal*/
	dm_w_en_reg (dm_w_en_reg_e_m),
	ecall_sig_reg (ecall_sig_reg_e_m),
	wb_sel_reg (wb_sel_reg_e_m),
	wb_en_reg (wb_en_reg_e_m),
	func3_reg (func3_reg_e_m)
);

LD_Filter ld_filter(
    .func3 (func3),
    .ld_data (dm_read_data),
    .ld_data_f (ld_data_f)
);





SRAM dm(
    .clk (clk),
    .w_en (dm_w_en),
    .address (alu_out),
    .write_data (rs2_data_out),
    .read_data (dm_read_data)
);
wire [31:0]n_pc = current_pc + 32'd4;
Mux m1(
    .true_choice(JB_out),
    .false_choice(n_pc),
    .sel(next_pc_sel),
    .result(next_pc)
);  //choose next pc

Mux m4(
    .true_choice(rs1_data_out),
    .false_choice(current_pc),
    .sel(jb_src1_sel),
    .result(JB_src1)
);  //choose JB_src1

Mux m5(
    .true_choice(ld_data_f),
    .false_choice(alu_out),
    .sel(wb_sel),
    .result(wb_data)
);  //choose wb_data


endmodule