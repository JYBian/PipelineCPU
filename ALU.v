`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:57:51 11/22/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(in1, in2, control, zero, out);
input [31:0] in1;
input [31:0] in2;
input [3:0] control;
output zero;
output reg [31:0]out;
always @(control or in1 or in2)
begin
if (control==4'b0000)
out<=in1&in2;
else if (control==4'b0001)
out<=in1|in2;
else if (control==4'b0010)
out<=in1+in2;
else if (control==4'b0110)
out<=in1-in2;
else if (control==4'b0111)
out<=in1<in2;
else
out<=0;
end
assign zero=(out==0);
endmodule

