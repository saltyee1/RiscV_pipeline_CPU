module RegFile (
input clk,
input rst,
input wb_en,
input ecall_sig,
input [31:0] wb_data,
input [4:0] rd_index,
input [4:0] rs1_index,
input [4:0] rs2_index,
output [31:0] rs1_data_out,
output [31:0] rs2_data_out,
output reg halt,
output reg print_flag
);
reg [31:0] regFile [0:31];
//import "DPI-C" function void ecall(input logic [31:0] reg_a0, input logic [31:0] reg_a1, inout logic halt);
// always @(*) begin
//     if(ecall_sig)
//         halt = (regFile[10] == 32'b0 ) ? 1'b1 : 1'b0;
//     else
//         halt =  1'b0;
// end 
wire print_en = ((regFile[10] == 32'd0) &&(regFile[11] == 32'd1));
wire stop_flag = ((regFile[10] == 32'd0) &&(regFile[11] == 32'd0));

/*wire reg0[31:0] = regFile[0];
wire reg1[31:0] = regFile[1];
wire reg2[31:0] = regFile[2];
wire reg3[31:0] = regFile[3];
wire reg4[31:0] = regFile[4];
wire reg5[31:0] = regFile[5];
wire reg6 = regFile[6];
wire reg7 = regFile[6];
wire reg8 = regFile[6];
wire reg9 = regFile[6];
wire reg10 = regFile[6];
wire reg11 = regFile[6];
wire reg12 = regFile[6];
wire reg13 = regFile[6];
wire reg14 = regFile[6];
wire reg15 = regFile[6];
wire reg61 = regFile[6];*/

genvar I;
generate
  	for (I = 0; I < 31; I = I + 1) begin : gen_regs
    	wire [31:0] reg_temp = regFile[I];
	end
endgenerate

always@(negedge clk or negedge rst) begin
    if (!rst) begin
        print_flag = 1'b0;
        halt = 1'b0;
    end
    else if(ecall_sig) begin
		print_flag = (print_en) ? 1'b1 : 1'b0;
        halt = (stop_flag) ? 1'b1 : 1'b0;
	end
    else begin
		print_flag = 1'b0;
        halt = 1'b0;
	end
end

integer i;
//Write
always@(posedge clk or negedge rst) begin
    if (!rst) begin
        for (i=0; i<=31; i=i+1) regFile[i] <= 32'b0;
    end
    else if (wb_en && rd_index != 5'b0) begin
        regFile[rd_index] <= wb_data;
    end
    else regFile[rd_index] <= regFile[rd_index];
end

//Read 
assign rs1_data_out = regFile[rs1_index];
assign rs2_data_out = regFile[rs2_index];
endmodule
