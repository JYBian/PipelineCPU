`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:42:36 11/22/2017 
// Design Name: 
// Module Name:    PC 
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
module PC(clk, reset, in, out, hold1,hold);
input clk, reset;
input [31:0] in;
input hold,hold1;
output reg[31:0] out;
reg [1:0]flag;
initial 
begin
out=32'b0;
flag=2'b00;
end
always@(posedge clk or posedge reset)
begin
if (reset==1'b1) out<=32'b0;
else if ((flag==2'b01)||(flag==2'b00&&(!hold1)&&(!hold))) begin
out<=in;
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