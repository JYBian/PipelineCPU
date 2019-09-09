`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:39:19 11/22/2017 
// Design Name: 
// Module Name:    ssd 
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
module ssd(i,o);
input [3:0] i;
output reg [6:0] o;
always @(i)
begin
case (i)
4'b0000: o = ~7'b1111110;
4'b0001: o = ~7'b0110000;
4'b0010: o = ~7'b1101101;
4'b0011: o = ~7'b1111001;
4'b0100: o = ~7'b0110011;
4'b0101: o = ~7'b1011011;
4'b0110: o = ~7'b1011111;
4'b0111: o = ~7'b1110000;
4'b1000: o = ~7'b1111111;
4'b1001: o = ~7'b1111011;
4'b1010: o = ~7'b1110111;
4'b1011: o = ~7'b0011111;
4'b1100: o = ~7'b1001110;
4'b1101: o = ~7'b0111101;
4'b1110: o = ~7'b1001111;
4'b1111: o = ~7'b1000111;
endcase
end
endmodule
