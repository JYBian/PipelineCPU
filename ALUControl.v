`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:51:12 11/22/2017 
// Design Name: 
// Module Name:    ALUControl 
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
module ALUcontrol(in, ALUOp, out);
input [5:0] in;
input [2:0] ALUOp;
output reg [3:0] out;
always@(ALUOp or in)
begin
if (ALUOp==3'b010 && in==6'b100000) out<=4'b0010;
else if (ALUOp==3'b010 && in==6'b100010) out<=4'b0110;
else if (ALUOp==3'b010 && in==6'b100100) out<=4'b0000;
else if (ALUOp==3'b010 && in==6'b100101) out<=4'b0001;
else if (ALUOp==3'b010 && in==6'b101010) out<=4'b0111;
else if (ALUOp==3'b000) out<=4'b0010;
else if (ALUOp==3'b001) out<=4'b0110;
else if (ALUOp==3'b011) out<=4'b0010;
else if (ALUOp==3'b100) out<=4'b0000;
else out<=4'b1000;
end
endmodule

