`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:38:14 11/22/2017 
// Design Name: 
// Module Name:    muxshow 
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
module muxshow(in0,in1,sel,out);
input[15:0] in0;
input[15:0] in1;
input sel;
output[15:0] out;
assign out=(sel)?in1:in0;
endmodule
