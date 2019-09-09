`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:40:46 11/22/2017 
// Design Name: 
// Module Name:    lwhold 
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
module lwhold(PChold,IFIDhold,IDEXhold,MemReadEX,RegWriteID,writeregEX,insrt,insrd);
output PChold,IFIDhold,IDEXhold;
input MemReadEX,RegWriteID;
input [4:0] writeregEX;
input [4:0] insrt;
input [4:0] insrd;
assign PChold=MemReadEX && ((writeregEX==insrt)||(writeregEX==insrd));
assign IFIDhold=MemReadEX && ((writeregEX==insrt)||(writeregEX==insrd));
assign IDEXhold=MemReadEX && ((writeregEX==insrt)||(writeregEX==insrd));
assign EXMEMhold=MemReadEX && ((writeregEX==insrt)||(writeregEX==insrd));
endmodule

