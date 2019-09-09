`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:54:26 11/22/2017 
// Design Name: 
// Module Name:    PipelineCPU 
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
module PipelineCPU(clk,reset,showpc,c,an,clkssd,showreg);
parameter four=4;
parameter [3:0]ALUbeq=4'b0110;
input clk,reset;
wire [31:0] PCin;
wire [31:0] PCout;
wire [31:0] nPCout;
wire [31:0] insout;
wire [31:0] PCbjout;
wire [31:0] insj;
wire [31:0] insID;
wire [31:0] nPCID;
wire RegDstID, Jump, MemReadID, MemtoRegID, MemWriteID, ALUSrcID, RegWriteID;
wire beqID, bneID;
wire [2:0] ALUOpID;
wire [31:0] regouta;
wire [31:0] regoutb;
wire [31:0] insiimmext;
wire [27:0] insjimm;
wire [31:0]ALUresultID;
wire ALUzeroID;
wire [1:0] forwardaID;
wire [1:0] forwardbID;
wire [31:0]ForwaoutID;
wire [31:0]ForwboutID;
wire [31:0] insEX;
wire [31:0] nPCEX;
wire[31:0] bPCID;
wire RegDstEX, MemReadEX, MemtoRegEX, MemWriteEX, ALUSrcEX, RegWriteEX;
wire [2:0] ALUOpEX;
wire [31:0] regoutaEX;
wire [31:0] regoutbEX;
wire [31:0] insiEX;
wire [4:0] insrtEX;
wire [4:0] insrdEX;
wire [31:0] bsout;
wire [31:0] ALUin;
wire [3:0] ALUconsign;
wire ALUzero;
wire [31:0] ALUresult;
wire [4:0] writeregEX;
wire [31:0] ForwaoutEX;
wire [31:0] ForwboutEX;
wire [1:0] forwardaEX;
wire [1:0] forwardbEX;
wire [4:0] forwinsrsEX;
wire [4:0] forwinsrtEX;
wire ALUzeroMEM;
wire [31:0] ALUresultMEM;
wire [31:0] insMEM;
wire [31:0] dmemdata;
wire [4:0] writeregMEM;
wire MemtoRegMEM,RegWriteMEM,MemReadMEM,MemWriteMEM;
wire [31:0] dmemout;
wire branchout;
wire [31:0] dmemWB;
wire [31:0] ALUresultWB;
wire [31:0] insWB;
wire [4:0] writeregWB;
wire MemtoRegWB,RegWriteWB;
wire [31:0] datawriteWB;
wire PChold,IFIDhold,IFIDreset,IDEXhold,IDEXreset,EXMEMreset;
input [4:0] showreg;
wire [31:0] curreg;
input showpc;
wire [6:0] c0;
wire [6:0] c1;
wire [6:0] c2;
wire [6:0] c3;
output [6:0] c;
output [3:0] an;
input clkssd;
wire clkdiv500;
wire [3:0] b;
wire [15:0] showthings;
wire IFIDhold1,PChold1;
muxshow M0(curreg[15:0],PCout[15:0],showpc,showthings);
clk500 M1(clkssd, clkdiv500);
ringcounter M2(clkdiv500, b);	
ssd M3(showthings[3:0], c0);
ssd M4(showthings[7:4], c1);
ssd M5(showthings[11:8], c2);
ssd M6(showthings[15:12], c3);
buffer M7(c0, c, b[0]);
buffer M8(c1, c, b[1]);
buffer M9(c2, c, b[2]);
buffer M10(c3, c, b[3]);
assign an=~b;
branchStateControl M11(IFIDhold1,PChold1,beqID,bneID);
lwhold M12(PChold,IFIDhold,IDEXhold,MemReadEX,RegWriteID,writeregEX,insID[25:21],insID[20:16]);
Mux32 M13(nPCout,bPCID,branchout,PCbjout);
Mux32 M14(PCbjout,insj,Jump,PCin);
controlj M15(insout[31:26], Jump);
PC M16(clk,reset,PCin,PCout,PChold1,PChold);
Add M17(PCout,four,nPCout);
IM M18(PCout, insout);
ShiftLeft26 M19(insout[25:0],insjimm);
assign insj={nPCout[31:28],insjimm};
IFID M20(insID,nPCID,nPCout,insout,clk,IFIDhold1,IFIDhold,IFIDreset);	
Forward2 M21(writeregMEM,writeregWB,insID[25:21],insID[20:16],RegWriteMEM,RegWriteWB,forwardaID,forwardbID,MemtoRegWB,beqID,bneID);
muxForw M22(regouta,datawriteWB,ALUresultMEM,forwardaID,ForwaoutID);
muxForw M23(regoutb, datawriteWB, ALUresultMEM, forwardbID, ForwboutID);	
ALU M24(ForwaoutID,ForwboutID,ALUbeq,ALUzeroID,ALUresultID);
Branch M25(beqID,bneID,ALUzeroID,branchout);
Control M26(insID[31:26],RegDstID,MemReadID,MemtoRegID,ALUOpID,MemWriteID,ALUSrcID,RegWriteID,beqID,bneID);
REG M27(insID[25:21],insID[20:16],writeregWB,datawriteWB,regouta,regoutb,RegWriteWB,clk,showreg,curreg);
SExt M28(insID[15:0],insiimmext);
Add M31(nPCID,bsout,bPCID);
ShiftLeft32 M30(insiimmext,bsout);
IDEX M29(regoutaEX,regoutbEX,insEX,nPCEX,insiEX,insrtEX,insrdEX,MemWriteEX,MemReadEX,MemtoRegEX,RegWriteEX,ALUSrcEX,ALUOpEX,RegDstEX,regouta,regoutb,insID,nPCID,insiimmext,insID[20:16],insID[15:11],ALUOpID,RegDstID,ALUSrcID,MemWriteID,MemReadID,MemtoRegID,RegWriteID,clk,insID[25:21],insID[20:16],forwinsrsEX,forwinsrtEX,IDEXhold,IDEXreset);
Forward M32(writeregMEM,writeregWB,forwinsrsEX,forwinsrtEX,RegWriteMEM,RegWriteWB,forwardaEX,forwardbEX,MemtoRegWB);
muxForw M33(regoutaEX,datawriteWB,ALUresultMEM,forwardaEX,ForwaoutEX);
muxForw M34(regoutbEX, datawriteWB, ALUresultMEM, forwardbEX, ForwboutEX);
Mux32 M35(ForwboutEX,insiEX,ALUSrcEX,ALUin);
ALUcontrol M36(insiEX[5:0],ALUOpEX,ALUconsign);
ALU M37(ForwaoutEX,ALUin,ALUconsign,ALUzero,ALUresult);
Mux5 M38(insrtEX,insrdEX,RegDstEX,writeregEX);
EXMEM M39(ALUzeroMEM,ALUresultMEM,insMEM,dmemdata,writeregMEM,MemtoRegMEM,RegWriteMEM,MemReadMEM,MemWriteMEM,ALUzero,ALUresult,insEX,ForwboutEX,writeregEX,MemWriteEX,MemReadEX,MemtoRegEX,RegWriteEX,clk,EXMEMreset);
Dmem M40(ALUresultMEM, dmemdata,MemWriteMEM,MemReadMEM,dmemout,clk);
MEMWB M41(dmemWB,ALUresultWB,insWB,writeregWB,MemtoRegWB,RegWriteWB,dmemout,ALUresultMEM,insMEM,writeregMEM,MemtoRegMEM,RegWriteMEM,clk);
Mux32 M42(ALUresultWB,dmemWB,MemtoRegWB,datawriteWB);
endmodule