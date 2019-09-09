`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:53:09 11/22/2017 
// Design Name: 
// Module Name:    Dmem 
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
module Dmem(address, writeData, memWrite, memRead, readData, clk);
input [31:0]address;
input [31:0]writeData;
input	memWrite, memRead, clk;
output [31:0] readData;
reg [31:0] memory[0:127];
integer i;
initial begin
for (i=0;i<128;i=i+1)
begin
memory[i]=32'b0;
end
end
always@(posedge clk)
begin
if (memWrite==1'b1)
memory[address/4]<=writeData;
end
assign readData=(memRead)?memory[address/4]:32'b0;
endmodule
