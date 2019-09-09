`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:51:34 11/22/2017 
// Design Name: 
// Module Name:    Mux5 
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
module Mux5(in0, in1, sel, out);
input [4:0]in0;
input [4:0]in1;
input sel;
output [4:0]out;
assign out=(sel)?in1:in0;
endmodule
