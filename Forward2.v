`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:44 11/22/2017 
// Design Name: 
// Module Name:    Forward2 
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
module Forward2 (writeregMEM,writeregWB,insrs,insrt,RegWriteMEM,RegWriteWB,forwarda,forwardb,MemtoRegWB,beqID,bneID);
input [4:0] writeregMEM;
input [4:0] writeregWB;
input [4:0] insrs;
input [4:0] insrt;
input RegWriteMEM;
input RegWriteWB;
input MemtoRegWB;
input beqID,bneID;
output reg [1:0] forwarda;
output reg [1:0] forwardb;
always @(*) begin
if(beqID||bneID) begin
begin
if ((RegWriteMEM && writeregMEM!=0)&&(writeregMEM==insrs))
begin
if (MemtoRegWB && insrs==writeregWB)
begin
forwarda=2'b01;
end
else forwarda=2'b10;
end
else if ((RegWriteWB && writeregWB!=0)&&(writeregWB==insrs))
begin
forwarda=2'b01;
end
else begin
forwarda=2'b00;
end	
if ((RegWriteMEM && writeregMEM!=0)&&(writeregMEM==insrt))
begin
if (MemtoRegWB && insrt==writeregWB)
begin
forwardb=2'b01;
end
else forwardb=2'b10;
end
else if ((RegWriteWB && writeregWB!=0)&&(writeregWB==insrt))
begin
forwardb=2'b01;
end
else begin
forwardb=2'b00;
end
end
end
else begin
forwarda=2'b00;
forwardb=2'b00;
end
end

endmodule
