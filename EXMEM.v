`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:52:44 11/22/2017 
// Design Name: 
// Module Name:    EXMEM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module EXMEM(ALUzeroMEM,ALUresultMEM,insMEM,dmemdata,writeregMEM,MemtoRegMEM,RegWriteMEM,MemReadMEM,MemWriteMEM,ALUzero,ALUresult,insEX,regoutbEX,writeregEX,MemWriteEX,MemReadEX,MemtoRegEX,RegWriteEX,clk,reset);
input clk;
input ALUzero;
input[31:0] ALUresult;
input[31:0] insEX;
input[31:0] regoutbEX;
input[4:0] writeregEX;
input MemWriteEX;
input MemReadEX;
input MemtoRegEX;
input RegWriteEX;
input reset;
output reg ALUzeroMEM;
output reg[31:0] ALUresultMEM;
output reg[31:0] insMEM;
output reg[31:0] dmemdata;
output reg[4:0] writeregMEM;
output reg MemtoRegMEM;
output reg RegWriteMEM;
output reg MemReadMEM;
output reg MemWriteMEM;
initial begin
ALUzeroMEM=1'b0;
ALUresultMEM=32'b0;
insMEM=32'b0;
dmemdata=32'b0;
writeregMEM=5'b0;
MemtoRegMEM=1'b0;
RegWriteMEM=1'b0;
MemReadMEM=1'b0;
MemWriteMEM=1'b0;
end
always @(posedge clk) begin
if (reset) begin
ALUzeroMEM<=1'b0;
ALUresultMEM<=32'b0;
insMEM<=32'b0;
dmemdata<=32'b0;
writeregMEM<=5'b0;
MemtoRegMEM<=1'b0;
RegWriteMEM<=1'b0;
MemReadMEM<=1'b0;
MemWriteMEM<=1'b0;
end
else begin
ALUzeroMEM<=ALUzero;
ALUresultMEM<=ALUresult;
insMEM<=insEX;
dmemdata<=regoutbEX;
writeregMEM<=writeregEX;
MemtoRegMEM<=MemtoRegEX;
RegWriteMEM<=RegWriteEX;
MemWriteMEM<=MemWriteEX;
MemReadMEM<=MemReadEX;
end
end	
endmodule
