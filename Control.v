`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:47:29 11/22/2017 
// Design Name: 
// Module Name:    Control 
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
module Control(in, regDst, memRead, memtoReg, ALUOp, memWrite, ALUSrc, regWrite, beq, bne);
input [5:0] in;
output reg regDst, memRead, memtoReg, memWrite, ALUSrc, regWrite, beq, bne;
output reg [2:0] ALUOp;
always@(in)
begin
if (in==6'b000000)
begin
regDst<=1;
memRead<=0;
memtoReg<=0;
memWrite<=0;
ALUSrc<=0;
regWrite<=1;
beq<=0;
bne<=0;
ALUOp<=3'b010; 
end
else if (in==6'b100011)
begin
regDst<=0;
memRead<=1;
memtoReg<=1;
memWrite<=0;
ALUSrc<=1;
regWrite<=1;
beq<=0;
bne<=0;
ALUOp<=3'b000; 
end
else if (in==6'b101011)
begin
regDst<=0;
memRead<=0;
memtoReg<=0;
memWrite<=1;
ALUSrc<=1;
regWrite<=0;
beq<=0;
bne<=0;
ALUOp<=3'b000; 
end
else if (in==6'b001000)
begin
regDst<=0;
memRead<=0;
memtoReg<=0;
memWrite<=0;
ALUSrc<=1;
regWrite<=1;
beq<=0;
bne<=0;
ALUOp<=3'b011; 
end
else if (in==6'b001100)
begin
regDst<=0;
memRead<=0;
memtoReg<=0;
memWrite<=0;
ALUSrc<=1;
regWrite<=1;
beq<=0;
bne<=0;
ALUOp<=3'b100; 
end
else if (in==6'b000010)
begin
regDst<=0;
memRead<=0;
memtoReg<=0;
memWrite<=0;
ALUSrc<=0;
regWrite<=0;
beq<=0;
bne<=0;
ALUOp<=3'b111;
end
else if (in==6'b000100)
begin
regDst<=0;
memRead<=0;
memtoReg<=0;
memWrite<=0;
ALUSrc<=0;
regWrite<=0;
beq<=1;
bne<=0;
ALUOp<=3'b001;
end
else if (in==6'b000101)
begin
regDst<=0;
memRead<=0;
memtoReg<=0;
memWrite<=0;
ALUSrc<=0;
regWrite<=0;
beq<=0;
bne<=1;
ALUOp<=3'b001;
end
end
endmodule
