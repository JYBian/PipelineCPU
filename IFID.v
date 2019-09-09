`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:44:10 11/22/2017 
// Design Name: 
// Module Name:    IFID 
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
module IFID(insID,nPCID,nPCout,insout,clk,hold1,hold,reset);
input[31:0] nPCout;
input[31:0] insout;
input clk;
input reset;
input hold,hold1;
output reg[31:0] insID;
output reg[31:0] nPCID;
reg flag;
initial 
begin
insID=32'b0;
nPCID=32'b0;
flag=2'b00;
end


always@(posedge clk or posedge reset)
begin
if (reset==1'b1) begin insID<=32'b0;
nPCID<=32'b0;
flag<=2'b00;
end
else if ((flag==2'b01)||(flag==2'b00&&(!hold1)&&(!hold))) begin
nPCID<=nPCout;
insID<=insout;
flag<=2'b00;
end
else if (flag==2'b11) begin
flag<=2'b01;
end
else if (hold&&(flag==2'b00)&&(!hold1)) begin
flag<=2'b01;
end
else if (hold1&&(flag==2'b00)&&(!hold)) begin
flag<=2'b01;
end
else if (hold1&&(flag==2'b00)&&(hold)) begin
flag<=2'b11;
end
end
endmodule