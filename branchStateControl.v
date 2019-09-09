`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:40:27 11/22/2017 
// Design Name: 
// Module Name:    branchStateControl 
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
module branchStateControl(IFIDhold,PChold,beqID,bneID);
output IFIDhold,PChold;
input beqID,bneID;
assign PChold= beqID||bneID;
assign IFIDhold= beqID||bneID;
endmodule