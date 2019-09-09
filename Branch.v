`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:04:33 11/22/2017 
// Design Name: 
// Module Name:    Branch 
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
module Branch(beq, bne, zero, out);
input beq, bne, zero;
output out;
assign out=(beq&zero)|(bne&(~zero));
endmodule

