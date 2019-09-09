`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:42:17 11/22/2017 
// Design Name: 
// Module Name:    controlj 
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
module controlj(insop,Jump);
input [5:0]insop;
output Jump;
assign Jump=(insop==6'b000010);
endmodule

