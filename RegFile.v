module RegFile (
input clk,
input reset,
input wb_en,
input ecall_sig,
input [31:0] wb_data,
input [4:0] rd_index,
input [4:0] rs1_index,
input [4:0] rs2_index,
output [31:0] rs1_data_out,
output [31:0] rs2_data_out,
output reg halt
);
reg [31:0] regFile [0:31];
//import "DPI-C" function void ecall(input logic [31:0] reg_a0, input logic [31:0] reg_a1, inout logic halt);
// always @(*) begin
//     if(ecall_sig)
//         halt = (regFile[10] == 32'b0 ) ? 1'b1 : 1'b0;
//     else
//         halt =  1'b0;
// end 
wire print_falg = ((regFile[10] == 32'd0) &&(regFile[11] == 32'd1));
wire stop_flag = ((regFile[10] == 32'd0) &&(regFile[11] == 32'd0));
always@(*) begin
     if(ecall_sig) 
        halt = (stop_flag) ? 1'b1 : 1'b0;
    else
        halt = 1'b0;
end

integer i;
//Write
always@(negedge clk or negedge reset) begin
    if (!reset) begin
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