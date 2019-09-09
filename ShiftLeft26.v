`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:43:53 11/22/2017 
// Design Name: 
// Module Name:    ShiftLeft26 
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
module ShiftLeft26(in, out);
input [25:0] in;
output [27:0] out;
assign out= in << 2;
endmodule

