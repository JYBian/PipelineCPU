`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:38:21 11/23/2017
// Design Name:   PipelineCPU
// Module Name:   C:/Users/Zijian Sui/Desktop/VE370/PipelineCPU/banchout.v
// Project Name:  PipelineCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PipelineCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module banchout;

	// Inputs
	reg clk;
	reg reset;
	reg showpc;
	reg clkssd;
	reg [4:0] showreg;

	// Outputs
	wire [6:0] c;
	wire [3:0] an;
	wire [31:0] PCout;
	wire [31:0] bPCID;
	wire branchout;

	// Instantiate the Unit Under Test (UUT)
	PipelineCPU uut (
		.clk(clk), 
		.reset(reset), 
		.showpc(showpc), 
		.c(c), 
		.an(an), 
		.clkssd(clkssd), 
		.showreg(showreg), 
		.PCout(PCout), 
		.bPCID(bPCID), 
		.branchout(branchout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		showpc = 0;
		clkssd = 0;
		showreg = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
          always#50 clk=~clk;
		initial #3000 $stop;
endmodule

