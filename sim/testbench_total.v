// `include "rtl/define.v"
// `include "rtl/ALU.v"
// `include "rtl/Controller.v"
// `include "rtl/Decoder.v"
// `include "rtl/Imme_Ext.v"
// `include "rtl/JB_Unit.v"
// `include "rtl/LD_Filter.v"
// `include "rtl/Mux.v"
// `include "rtl/Mux4_1.v"
// `include "rtl/Reg_PC.v"
// `include "rtl/RegFile.v"
// `include "rtl/SRAM.v"
// `include "rtl/F_D_Reg.v"
// `include "rtl/D_E_Reg.v"
// `include "rtl/E_M_Reg.v"
// `include "rtl/M_W_Reg.v"
// `include "rtl/Hazard_Detection.v"
// `include "rtl/Forwarding_Unit.v"
// `include "rtl/Branch_Taken_Unit.v"
`timescale 1ns/1ps 

`ifdef syn
	`include "../syn/Top_syn.v"
	`include "../syn/tsmc18.v"
`else
	`include "../rtl/Top.v"
`endif

`include "../rtl/SRAM.v"


`ifdef fibo
	`define PROG_PATH "../testprog/fibo.hex"
`else
	`define PROG_PATH "../testprog/sort.hex"
`endif

`ifdef basic
	`define PROG_PATH "../testprog/basic.hex"
`endif

`ifdef total
	`define PROG_PATH "../testprog/total.hex"
`endif

`define memptint_base_addr 0
`define memptint_counts 10

module tb_Top;
reg clk;
reg nclk;
reg rst;
/*for im*/
wire [31:0] inst;
wire [15:0] im_addr;
wire [3:0] im_w_en;
/*for dm*/
wire [31:0] dm_read_data;
wire [31:0] dm_write_data;
wire [15:0] dm_addr;
wire [3:0] dm_w_en;
/*for ecall*/
wire halt;
wire print_flag;

Top top(
    .rst (rst),
    .clk (clk),
    .nclk (nclk),
    .inst (inst),
    .im_addr (im_addr),
    .im_w_en (im_w_en),

    .dm_read_data (dm_read_data),
    .dm_write_data (dm_write_data),
    .dm_addr (dm_addr),
    .dm_w_en (dm_w_en),

    .halt (halt),
	.print_flag (print_flag)
);

SRAM dm(
    .clk (clk),
    .w_en (dm_w_en),
    .address (dm_addr),
    .write_data (dm_write_data),
    .read_data (dm_read_data)
);

SRAM im(
    .clk (clk),
    .w_en (im_w_en),
    .address (im_addr),
    .write_data (32'b0),
    .read_data (inst)
);

localparam CLK_PERIOD = 30.0;
always #(CLK_PERIOD/2) clk=~clk;
always #(CLK_PERIOD/2) nclk = ~clk;


initial begin
    $readmemh(`PROG_PATH, im.mem);
    $readmemh(`PROG_PATH, dm.mem);
end

`ifdef syn
	initial $sdf_annotate("../syn/Top_syn.sdf", top);
`endif

/*
always@(print_flag) begin
	$display("%c", top.regfile.regFile[11]);
end
*/

integer i;
initial begin
    clk = 0; nclk = 1; rst = 1;
    #5 rst= 0;
    // #(1000*CLK_PERIOD)
    // for (i=0; i<`memptint_counts; i=i+1 ) begin
    //     $display("mem[%d] : %d", (`memptint_base_addr+i*4), ({top.dm.mem[`memptint_base_addr+3+i*4], top.dm.mem[`memptint_base_addr+2+i*4], top.dm.mem[`memptint_base_addr+1+i*4], top.dm.mem[`memptint_base_addr+i*4]}));
    // end
	//$finish;
    //#(4096*CLK_PERIOD);
    //finish;
    wait (halt)
        for (i=0; i<`memptint_counts; i=i+1 ) begin
            $display("mem[%d] : %d", (`memptint_base_addr+i*4), ({dm.mem[`memptint_base_addr+3+i*4], dm.mem[`memptint_base_addr+2+i*4], dm.mem[`memptint_base_addr+1+i*4], dm.mem[`memptint_base_addr+i*4]}));
        end
    $finish;
end

`ifdef fibo
	initial begin
		$dumpfile("../wave/tb_Top_fibo.vcd");
		$dumpvars;
		//$fsdbDumpMDA(2, top);
	end
`endif
`ifdef sort
	initial begin
		$dumpfile("../wave/tb_Top_sort.vcd");
		$dumpvars;
		//$fsdbDumpMDA(2, top);
	end
`endif
`ifdef basic
	initial begin
		$dumpfile("../wave/tb_Top_basic.vcd");
		$dumpvars;
		//$fsdbDumpMDA(2, top);
	end
`endif
`ifdef total
	initial begin
		//$dumpfile("../wave/tb_Top_total.vcd");
		//$dumpvars;
		//$fsdbDumpMDA(2, top);
	end
`endif

endmodule
