// Project Name:		"Signal Transition Detector"
// Author:				"R.A. Citaishvili"
//
// File description:	"Testbench for SigTransDetect.v"
//

`timescale 1ns / 1ps

module SigTransDetect_TB;

	// Inputs
	reg clk;
	reg reset;
	reg [11:0] In;

	// Outputs
	wire [11:0] Out;
	
	// Input Data Matrix
	reg [11:0] Din [0:2199];
	
	// Output Data Matrix
	reg [11:0] Dout [0:2199];
	
	// Counter
	reg [11:0] cntr = 12'd0;
	
	// RefOutData
	reg [11:0] RefOutData = 12'd0;
	
	// Error
	reg [11:0] Error = 12'd0;

	// Instantiate the Unit Under Test (UUT)
	SigTransDetect uut (
		.clk(clk), 
		.reset(reset), 
		.In(In), 
		.Out(Out)
	);
	
	// Taking layout into account
	initial
		$sdf_annotate("../Outputs/SigTransDetect.sdf",uut);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		In = 12'b000000000000;
		
		
		#400;
		reset = 0;
		
		#1000;
		reset = 1;
		
		#3000;
		reset = 0;
		
		#88000 $finish;
	end
	
// Read data from files
	initial $readmemb("../Source/Din.txt", Din);		// input data
	initial $readmemb("../Source/Dout.txt", Dout);	// reference output for error counting
	
// clock process
	always
		begin
		#20 clk = ~clk;
		end

// counter process for reading data
	always @(negedge clk)
	begin
		if (reset)
			cntr <= 12'd0;
		else begin
			cntr <= cntr + 1;
		end
	end
   
// input data reading
	always @(negedge clk)
	begin
		if (reset)
			In <= 12'd0;
		else begin
			In <= Din[cntr];
		end
	end
	
// reference output data reading	
	always @(posedge clk)
	begin
		if (reset)
			RefOutData <= 12'd0;
		else begin
			RefOutData <= Dout[cntr];
		end
	end

// error counting
	always @(posedge clk)
	begin
		if (reset)
			Error <= 12'd0;
		else begin
			Error <= RefOutData - Out;
		end
	end
      
endmodule
