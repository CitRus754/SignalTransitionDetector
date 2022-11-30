// Project Name:		"Signal Transition Detector"
// Author:				"R.A. Citaishvili"
//
// File description:	"HDL description of the main block"
//

`timescale 1ns / 1ps

module SigTransDetect
          (clk,
           reset,
           In,
           Out);

	input   clk;				// main clock 25 MHz
	input   reset;				// asynchronous reset
	input   signed [11:0] In; 	// input data
	output  signed [11:0] Out; 	// output data

//-----------------------------------------------------------------//
//-------------------------All wires and regs----------------------//
//-----------------------------------------------------------------//

	wire [11:0] C1;  // ufix12_En12
	wire [11:0] C2;  // ufix12_En12
	wire [11:0] C3;  // ufix12_En12
	wire [11:0] C4;  // ufix12_En12
	wire [11:0] C5;  // ufix12_En12
	wire [11:0] C6;  // ufix12_En12
	wire [11:0] C7;  // ufix12_En12
	wire [11:0] C8;  // ufix12_En12
	wire [11:0] C9;  // ufix12_En12
	wire [11:0] C10;  // ufix12_En12
	wire [11:0] C11;  // ufix12_En12
	wire [11:0] C12;  // ufix12_En12
	wire [11:0] C13;  // ufix12_En12
	wire [11:0] C14;  // ufix12_En12
	wire [11:0] C15;  // ufix12_En12
	wire [11:0] C16;  // ufix12_En12
	
//-----------------------------------------------------------------//
	
	reg signed [11:0] In_d1;  // sfix12_En10
	reg signed [11:0] In_d2;  // sfix12_En10
	reg signed [11:0] In_d3;  // sfix12_En10
	reg signed [11:0] In_d4;  // sfix12_En10
	reg signed [11:0] In_d5;  // sfix12_En10
	reg signed [11:0] In_d6;  // sfix12_En10
	reg signed [11:0] In_d7;  // sfix12_En10
	reg signed [11:0] In_d8;  // sfix12_En10
	reg signed [11:0] In_d9;  // sfix12_En10
	reg signed [11:0] In_d10;  // sfix12_En10
	reg signed [11:0] In_d11;  // sfix12_En10
	reg signed [11:0] In_d12;  // sfix12_En10
	reg signed [11:0] In_d13;  // sfix12_En10
	reg signed [11:0] In_d14;  // sfix12_En10
	reg signed [11:0] In_d15;  // sfix12_En10
	reg signed [11:0] In_d16;  // sfix12_En10
	reg signed [11:0] In_d17;  // sfix12_En10
	reg signed [11:0] In_d18;  // sfix12_En10
	reg signed [11:0] In_d19;  // sfix12_En10
	reg signed [11:0] In_d20;  // sfix12_En10
	reg signed [11:0] In_d21;  // sfix12_En10
	reg signed [11:0] In_d22;  // sfix12_En10
	reg signed [11:0] In_d23;  // sfix12_En10
	reg signed [11:0] In_d24;  // sfix12_En10
	reg signed [11:0] In_d25;  // sfix12_En10
	reg signed [11:0] In_d26;  // sfix12_En10
	reg signed [11:0] In_d27;  // sfix12_En10
	reg signed [11:0] In_d28;  // sfix12_En10
	reg signed [11:0] In_d29;  // sfix12_En10
	reg signed [11:0] In_d30;  // sfix12_En10
	
//-----------------------------------------------------------------//
	
	wire signed [12:0] Gain_cast;  // sfix13_En10
	wire signed [12:0] Gain_cast_1;  // sfix13_En10
	wire signed [23:0] Gain_cast_2;  // sfix24_En21
	wire signed [11:0] In_d30n;  // sfix12_En10
	
	wire signed [12:0] Gain1_cast;  // sfix13_En10
	wire signed [12:0] Gain1_cast_1;  // sfix13_En10
	wire signed [23:0] Gain1_cast_2;  // sfix24_En21
	wire signed [11:0] In_d29n;  // sfix12_En10
	
	wire signed [12:0] Gain2_cast;  // sfix13_En10
	wire signed [12:0] Gain2_cast_1;  // sfix13_En10
	wire signed [23:0] Gain2_cast_2;  // sfix24_En21
	wire signed [11:0] In_d28n;  // sfix12_En10
	
	wire signed [12:0] Gain3_cast;  // sfix13_En10
	wire signed [12:0] Gain3_cast_1;  // sfix13_En10
	wire signed [23:0] Gain3_cast_2;  // sfix24_En21
	wire signed [11:0] In_d27n;  // sfix12_En10
	
	wire signed [12:0] Gain4_cast;  // sfix13_En10
	wire signed [12:0] Gain4_cast_1;  // sfix13_En10
	wire signed [23:0] Gain4_cast_2;  // sfix24_En21
	wire signed [11:0] In_d26n;  // sfix12_En10
	
	wire signed [12:0] Gain5_cast;  // sfix13_En10
	wire signed [12:0] Gain5_cast_1;  // sfix13_En10
	wire signed [23:0] Gain5_cast_2;  // sfix24_En21
	wire signed [11:0] In_d25n;  // sfix12_En10
	
	wire signed [12:0] Gain6_cast;  // sfix13_En10
	wire signed [12:0] Gain6_cast_1;  // sfix13_En10
	wire signed [23:0] Gain6_cast_2;  // sfix24_En21
	wire signed [11:0] In_d24n;  // sfix12_En10
	
	wire signed [12:0] Gain7_cast;  // sfix13_En10
	wire signed [12:0] Gain7_cast_1;  // sfix13_En10
	wire signed [23:0] Gain7_cast_2;  // sfix24_En21
	wire signed [11:0] In_d23n;  // sfix12_En10
	
	wire signed [12:0] Gain8_cast;  // sfix13_En10
	wire signed [12:0] Gain8_cast_1;  // sfix13_En10
	wire signed [23:0] Gain8_cast_2;  // sfix24_En21
	wire signed [11:0] In_d22n;  // sfix12_En10
	
	wire signed [12:0] Gain9_cast;  // sfix13_En10
	wire signed [12:0] Gain9_cast_1;  // sfix13_En10
	wire signed [23:0] Gain9_cast_2;  // sfix24_En21
	wire signed [11:0] In_d21n;  // sfix12_En10
	
	wire signed [12:0] Gain10_cast;  // sfix13_En10
	wire signed [12:0] Gain10_cast_1;  // sfix13_En10
	wire signed [23:0] Gain10_cast_2;  // sfix24_En21
	wire signed [11:0] In_d20n;  // sfix12_En10
	
	wire signed [12:0] Gain11_cast;  // sfix13_En10
	wire signed [12:0] Gain11_cast_1;  // sfix13_En10
	wire signed [23:0] Gain11_cast_2;  // sfix24_En21
	wire signed [11:0] In_d19n;  // sfix12_En10
	
	wire signed [12:0] Gain12_cast;  // sfix13_En10
	wire signed [12:0] Gain12_cast_1;  // sfix13_En10
	wire signed [23:0] Gain12_cast_2;  // sfix24_En21
	wire signed [11:0] In_d18n;  // sfix12_En10
	
	wire signed [12:0] Gain13_cast;  // sfix13_En10
	wire signed [12:0] Gain13_cast_1;  // sfix13_En10
	wire signed [23:0] Gain13_cast_2;  // sfix24_En21
	wire signed [11:0] In_d17n;  // sfix12_En10
	
	wire signed [12:0] Gain14_cast;  // sfix13_En10
	wire signed [12:0] Gain14_cast_1;  // sfix13_En10
	wire signed [23:0] Gain14_cast_2;  // sfix24_En21
	wire signed [11:0] In_d16n;  // sfix12_En10
	
//-----------------------------------------------------------------//
	
	wire signed [31:0] Add_add_cast;  // sfix32_En10
	wire signed [31:0] Add_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_1;  // sfix13_En10
	
	wire signed [31:0] Add2_add_cast;  // sfix32_En10
	wire signed [31:0] Add2_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add2_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_2;  // sfix13_En10
	
	wire signed [31:0] Add3_add_cast;  // sfix32_En10
	wire signed [31:0] Add3_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add3_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_3;  // sfix13_En10
	
	wire signed [31:0] Add6_add_cast;  // sfix32_En10
	wire signed [31:0] Add6_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add6_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_4;  // sfix13_En10
	
	wire signed [31:0] Add7_add_cast;  // sfix32_En10
	wire signed [31:0] Add7_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add7_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_5;  // sfix13_En10
	
	wire signed [31:0] Add10_add_cast;  // sfix32_En10
	wire signed [31:0] Add10_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add10_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_6;  // sfix13_En10
	
	wire signed [31:0] Add11_add_cast;  // sfix32_En10
	wire signed [31:0] Add11_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add11_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_7;  // sfix13_En10
	
	wire signed [31:0] Add16_add_cast;  // sfix32_En10
	wire signed [31:0] Add16_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add16_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_8;  // sfix13_En10
	
	wire signed [31:0] Add19_add_cast;  // sfix32_En10
	wire signed [31:0] Add19_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add19_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_9;  // sfix13_En10
	
	wire signed [31:0] Add20_add_cast;  // sfix32_En10
	wire signed [31:0] Add20_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add20_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_10;  // sfix13_En10
	
	wire signed [31:0] Add13_add_cast;  // sfix32_En10
	wire signed [31:0] Add13_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add13_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_11;  // sfix13_En10
	
	wire signed [31:0] Add14_add_cast;  // sfix32_En10
	wire signed [31:0] Add14_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add14_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_12;  // sfix13_En10
	
	wire signed [31:0] Add26_add_cast;  // sfix32_En10
	wire signed [31:0] Add26_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add26_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_13;  // sfix13_En10
	
	wire signed [31:0] Add29_add_cast;  // sfix32_En10
	wire signed [31:0] Add29_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add29_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_14;  // sfix13_En10
	
	wire signed [31:0] Add23_add_cast;  // sfix32_En10
	wire signed [31:0] Add23_add_cast_1;  // sfix32_En10
	wire signed [31:0] Add23_add_temp;  // sfix32_En10
	wire signed [12:0] FoldSum_15;  // sfix13_En10
	
//-----------------------------------------------------------------//
	
	wire signed [12:0] Product1_cast;  // sfix13_En12
	wire signed [25:0] Product1_mul_temp;  // sfix26_En22
	wire signed [24:0] Product1_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_1;  // sfix16_En16
	
	wire signed [12:0] Product2_cast;  // sfix13_En12
	wire signed [25:0] Product2_mul_temp;  // sfix26_En22
	wire signed [24:0] Product2_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_2;  // sfix16_En16
	
	wire signed [12:0] Product3_cast;  // sfix13_En12
	wire signed [25:0] Product3_mul_temp;  // sfix26_En22
	wire signed [24:0] Product3_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_3;  // sfix16_En16
	
	wire signed [12:0] Product4_cast;  // sfix13_En12
	wire signed [25:0] Product4_mul_temp;  // sfix26_En22
	wire signed [24:0] Product4_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_4;  // sfix16_En16
	
	wire signed [12:0] Product5_cast;  // sfix13_En12
	wire signed [25:0] Product5_mul_temp;  // sfix26_En22
	wire signed [24:0] Product5_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_5;  // sfix16_En16
	
	wire signed [12:0] Product6_cast;  // sfix13_En12
	wire signed [25:0] Product6_mul_temp;  // sfix26_En22
	wire signed [24:0] Product6_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_6;  // sfix16_En16
	
	wire signed [12:0] Product7_cast;  // sfix13_En12
	wire signed [25:0] Product7_mul_temp;  // sfix26_En22
	wire signed [24:0] Product7_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_7;  // sfix16_En16
	
	wire signed [12:0] Product8_cast;  // sfix13_En12
	wire signed [25:0] Product8_mul_temp;  // sfix26_En22
	wire signed [24:0] Product8_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_8;  // sfix16_En16
	
	wire signed [12:0] Product9_cast;  // sfix13_En12
	wire signed [25:0] Product9_mul_temp;  // sfix26_En22
	wire signed [24:0] Product9_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_9;  // sfix16_En16
	
	wire signed [12:0] Product10_cast;  // sfix13_En12
	wire signed [25:0] Product10_mul_temp;  // sfix26_En22
	wire signed [24:0] Product10_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_10;  // sfix16_En16
	
	wire signed [12:0] Product11_cast;  // sfix13_En12
	wire signed [25:0] Product11_mul_temp;  // sfix26_En22
	wire signed [24:0] Product11_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_11;  // sfix16_En16
	
	wire signed [12:0] Product12_cast;  // sfix13_En12
	wire signed [25:0] Product12_mul_temp;  // sfix26_En22
	wire signed [24:0] Product12_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_12;  // sfix16_En16
	
	wire signed [12:0] Product13_cast;  // sfix13_En12
	wire signed [25:0] Product13_mul_temp;  // sfix26_En22
	wire signed [24:0] Product13_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_13;  // sfix16_En16
	
	wire signed [12:0] Product14_cast;  // sfix13_En12
	wire signed [25:0] Product14_mul_temp;  // sfix26_En22
	wire signed [24:0] Product14_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_14;  // sfix16_En16
	
	wire signed [12:0] Product15_cast;  // sfix13_En12
	wire signed [25:0] Product15_mul_temp;  // sfix26_En22
	wire signed [24:0] Product15_cast_1;  // sfix25_En22
	wire signed [15:0] Mult_15;  // sfix16_En16
	
	wire signed [12:0] Product16_cast;  // sfix13_En12
	wire signed [24:0] Product16_mul_temp;  // sfix25_En22
	wire signed [23:0] Product16_cast_1;  // sfix24_En22
	wire signed [15:0] Mult_16;  // sfix16_En16
	
//-----------------------------------------------------------------//
	
	wire signed [31:0] Add1_add_cast;  // sfix32_En16
	wire signed [31:0] Add1_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add1_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_1;  // sfix14_En14
	
	wire signed [31:0] Add4_add_cast;  // sfix32_En16
	wire signed [31:0] Add4_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add4_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_2;  // sfix14_En14
	
	wire signed [31:0] Add5_add_cast;  // sfix32_En16
	wire signed [31:0] Add5_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add5_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_3;  // sfix14_En14
	
	wire signed [31:0] Add8_add_cast;  // sfix32_En16
	wire signed [31:0] Add8_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add8_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_4;  // sfix14_En14
	
	wire signed [31:0] Add9_add_cast;  // sfix32_En16
	wire signed [31:0] Add9_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add9_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_5;  // sfix14_En14
	
	wire signed [31:0] Add12_add_cast;  // sfix32_En16
	wire signed [31:0] Add12_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add12_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_6;  // sfix14_En14
	
	wire signed [31:0] Add17_add_cast;  // sfix32_En16
	wire signed [31:0] Add17_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add17_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_7;  // sfix14_En14
	
	wire signed [31:0] Add18_add_cast;  // sfix32_En16
	wire signed [31:0] Add18_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add18_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_8;  // sfix14_En14
	
	wire signed [31:0] Add21_add_cast;  // sfix32_En16
	wire signed [31:0] Add21_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add21_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_9;  // sfix14_En14
	
	wire signed [31:0] Add22_add_cast;  // sfix32_En16
	wire signed [31:0] Add22_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add22_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_10;  // sfix14_En14
	
	wire signed [31:0] Add15_add_cast;  // sfix32_En16
	wire signed [31:0] Add15_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add15_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_11;  // sfix14_En14
	
	wire signed [31:0] Add27_add_cast;  // sfix32_En16
	wire signed [31:0] Add27_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add27_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_12;  // sfix14_En14
	
	wire signed [31:0] Add28_add_cast;  // sfix32_En16
	wire signed [31:0] Add28_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add28_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_13;  // sfix14_En14
	
	wire signed [31:0] Add24_add_cast;  // sfix32_En16
	wire signed [31:0] Add24_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add24_add_temp;  // sfix32_En16
	wire signed [13:0] Sum_14;  // sfix14_En14
	
	wire signed [31:0] Add31_add_cast;  // sfix32_En16
	wire signed [31:0] Add31_add_cast_1;  // sfix32_En16
	wire signed [31:0] Add31_add_temp;  // sfix32_En16
	wire signed [11:0] Sum_15;  // sfix14_En14
	
//-----------------------------------------------------------------//
	
	reg signed [11:0] Out_1;  // sfix14_En14

//-----------------------------------------------------------------//



//------------------Main processes and assignments-----------------//

//---------------------Coefficient assignments---------------------//

	assign C1  = 12'b000000010110;
	assign C2  = 12'b000000010101;
	assign C3  = 12'b000000010011;
	assign C4  = 12'b000000010010;
	assign C5  = 12'b000000010000;
	assign C6  = 12'b000000001111;
	assign C7  = 12'b000000001110;
	assign C8  = 12'b000000001100;
	assign C9  = 12'b000000001011;
	assign C10 = 12'b000000001010;
	assign C11 = 12'b000000001000;
	assign C12 = 12'b000000000111;
	assign C13 = 12'b000000000101;
	assign C14 = 12'b000000000100;
	assign C15 = 12'b000000000011;
	assign C16 = 12'b000000000001;

//------------------------Delay line process------------------------//

	always @(posedge clk or posedge reset)
	begin : Delay_line_process
	  if (reset == 1'b1) begin
		In_d1  <= 12'sb000000000000;
		In_d2  <= 12'sb000000000000;
		In_d3  <= 12'sb000000000000;
		In_d4  <= 12'sb000000000000;
		In_d5  <= 12'sb000000000000;
		In_d6  <= 12'sb000000000000;
		In_d7  <= 12'sb000000000000;
		In_d8  <= 12'sb000000000000;
		In_d9  <= 12'sb000000000000;
		In_d10 <= 12'sb000000000000;
		In_d11 <= 12'sb000000000000;
		In_d12 <= 12'sb000000000000;
		In_d13 <= 12'sb000000000000;
		In_d14 <= 12'sb000000000000;
		In_d15 <= 12'sb000000000000;
		In_d16 <= 12'sb000000000000;
		In_d17 <= 12'sb000000000000;
		In_d18 <= 12'sb000000000000;
		In_d19 <= 12'sb000000000000;
		In_d20 <= 12'sb000000000000;
		In_d21 <= 12'sb000000000000;
		In_d22 <= 12'sb000000000000;
		In_d23 <= 12'sb000000000000;
		In_d24 <= 12'sb000000000000;
		In_d25 <= 12'sb000000000000;
		In_d26 <= 12'sb000000000000;
		In_d27 <= 12'sb000000000000;
		In_d28 <= 12'sb000000000000;
		In_d29 <= 12'sb000000000000;
		In_d30 <= 12'sb000000000000;
	  end
	  else begin
		In_d1  <= In;
		In_d2  <= In_d1;
		In_d3  <= In_d2;
		In_d4  <= In_d3;
		In_d5  <= In_d4;
		In_d6  <= In_d5;
		In_d7  <= In_d6;
		In_d8  <= In_d7;
		In_d9  <= In_d8;
		In_d10 <= In_d9;
		In_d11 <= In_d10;
		In_d12 <= In_d11;
		In_d13 <= In_d12;
		In_d14 <= In_d13;
		In_d15 <= In_d14;
		In_d16 <= In_d15;
		In_d17 <= In_d16;
		In_d18 <= In_d17;
		In_d19 <= In_d18;
		In_d20 <= In_d19;
		In_d21 <= In_d20;
		In_d22 <= In_d21;
		In_d23 <= In_d22;
		In_d24 <= In_d23;
		In_d25 <= In_d24;
		In_d26 <= In_d25;
		In_d27 <= In_d26;
		In_d28 <= In_d27;
		In_d29 <= In_d28;
		In_d30 <= In_d29;
	  end
	end

//------------------------Invertors------------------------//

	assign Gain14_cast = {In_d16[11], In_d16};
	assign Gain14_cast_1 =  - (Gain14_cast);
	assign Gain14_cast_2 = {Gain14_cast_1, 11'b00000000000};
	assign In_d16n = Gain14_cast_2[22:11];

	assign Gain13_cast = {In_d17[11], In_d17};
	assign Gain13_cast_1 =  - (Gain13_cast);
	assign Gain13_cast_2 = {Gain13_cast_1, 11'b00000000000};
	assign In_d17n = Gain13_cast_2[22:11];

	assign Gain12_cast = {In_d18[11], In_d18};
	assign Gain12_cast_1 =  - (Gain12_cast);
	assign Gain12_cast_2 = {Gain12_cast_1, 11'b00000000000};
	assign In_d18n = Gain12_cast_2[22:11];

	assign Gain11_cast = {In_d19[11], In_d19};
	assign Gain11_cast_1 =  - (Gain11_cast);
	assign Gain11_cast_2 = {Gain11_cast_1, 11'b00000000000};
	assign In_d19n = Gain11_cast_2[22:11];

	assign Gain10_cast = {In_d20[11], In_d20};
	assign Gain10_cast_1 =  - (Gain10_cast);
	assign Gain10_cast_2 = {Gain10_cast_1, 11'b00000000000};
	assign In_d20n = Gain10_cast_2[22:11];

	assign Gain9_cast = {In_d21[11], In_d21};
	assign Gain9_cast_1 =  - (Gain9_cast);
	assign Gain9_cast_2 = {Gain9_cast_1, 11'b00000000000};
	assign In_d21n = Gain9_cast_2[22:11];

	assign Gain8_cast = {In_d22[11], In_d22};
	assign Gain8_cast_1 =  - (Gain8_cast);
	assign Gain8_cast_2 = {Gain8_cast_1, 11'b00000000000};
	assign In_d22n = Gain8_cast_2[22:11];

	assign Gain7_cast = {In_d23[11], In_d23};
	assign Gain7_cast_1 =  - (Gain7_cast);
	assign Gain7_cast_2 = {Gain7_cast_1, 11'b00000000000};
	assign In_d23n = Gain7_cast_2[22:11];

	assign Gain6_cast = {In_d24[11], In_d24};
	assign Gain6_cast_1 =  - (Gain6_cast);
	assign Gain6_cast_2 = {Gain6_cast_1, 11'b00000000000};
	assign In_d24n = Gain6_cast_2[22:11];

	assign Gain5_cast = {In_d25[11], In_d25};
	assign Gain5_cast_1 =  - (Gain5_cast);
	assign Gain5_cast_2 = {Gain5_cast_1, 11'b00000000000};
	assign In_d25n = Gain5_cast_2[22:11];

	assign Gain4_cast = {In_d26[11], In_d26};
	assign Gain4_cast_1 =  - (Gain4_cast);
	assign Gain4_cast_2 = {Gain4_cast_1, 11'b00000000000};
	assign In_d26n = Gain4_cast_2[22:11];

	assign Gain3_cast = {In_d27[11], In_d27};
	assign Gain3_cast_1 =  - (Gain3_cast);
	assign Gain3_cast_2 = {Gain3_cast_1, 11'b00000000000};
	assign In_d27n = Gain3_cast_2[22:11];

	assign Gain2_cast = {In_d28[11], In_d28};
	assign Gain2_cast_1 =  - (Gain2_cast);
	assign Gain2_cast_2 = {Gain2_cast_1, 11'b00000000000};
	assign In_d28n = Gain2_cast_2[22:11];

	assign Gain1_cast = {In_d29[11], In_d29};
	assign Gain1_cast_1 =  - (Gain1_cast);
	assign Gain1_cast_2 = {Gain1_cast_1, 11'b00000000000};
	assign In_d29n = Gain1_cast_2[22:11];

	assign Gain_cast = {In_d30[11], In_d30};
	assign Gain_cast_1 =  - (Gain_cast);
	assign Gain_cast_2 = {Gain_cast_1, 11'b00000000000};
	assign In_d30n = Gain_cast_2[22:11];

//------------------------Folded summations------------------------//

	assign Add_add_cast = {{20{In_d30n[11]}}, In_d30n};
	assign Add_add_cast_1 = {{20{In[11]}}, In};
	assign Add_add_temp = Add_add_cast + Add_add_cast_1;
	assign FoldSum_1 = Add_add_temp[12:0];
	
	assign Add2_add_cast = {{20{In_d29n[11]}}, In_d29n};
	assign Add2_add_cast_1 = {{20{In_d1[11]}}, In_d1};
	assign Add2_add_temp = Add2_add_cast + Add2_add_cast_1;
	assign FoldSum_2 = Add2_add_temp[12:0];
	
	assign Add3_add_cast = {{20{In_d28n[11]}}, In_d28n};
	assign Add3_add_cast_1 = {{20{In_d2[11]}}, In_d2};
	assign Add3_add_temp = Add3_add_cast + Add3_add_cast_1;
	assign FoldSum_3 = Add3_add_temp[12:0];
	
	assign Add6_add_cast = {{20{In_d27n[11]}}, In_d27n};
	assign Add6_add_cast_1 = {{20{In_d3[11]}}, In_d3};
	assign Add6_add_temp = Add6_add_cast + Add6_add_cast_1;
	assign FoldSum_4 = Add6_add_temp[12:0];
	
	assign Add7_add_cast = {{20{In_d26n[11]}}, In_d26n};
	assign Add7_add_cast_1 = {{20{In_d4[11]}}, In_d4};
	assign Add7_add_temp = Add7_add_cast + Add7_add_cast_1;
	assign FoldSum_5 = Add7_add_temp[12:0];
	
	assign Add10_add_cast = {{20{In_d25n[11]}}, In_d25n};
	assign Add10_add_cast_1 = {{20{In_d5[11]}}, In_d5};
	assign Add10_add_temp = Add10_add_cast + Add10_add_cast_1;
	assign FoldSum_6 = Add10_add_temp[12:0];
	
	assign Add11_add_cast = {{20{In_d24n[11]}}, In_d24n};
	assign Add11_add_cast_1 = {{20{In_d6[11]}}, In_d6};
	assign Add11_add_temp = Add11_add_cast + Add11_add_cast_1;
	assign FoldSum_7 = Add11_add_temp[12:0];
	
	assign Add16_add_cast = {{20{In_d23n[11]}}, In_d23n};
	assign Add16_add_cast_1 = {{20{In_d7[11]}}, In_d7};
	assign Add16_add_temp = Add16_add_cast + Add16_add_cast_1;
	assign FoldSum_8 = Add16_add_temp[12:0];
	
	assign Add19_add_cast = {{20{In_d22n[11]}}, In_d22n};
	assign Add19_add_cast_1 = {{20{In_d8[11]}}, In_d8};
	assign Add19_add_temp = Add19_add_cast + Add19_add_cast_1;
	assign FoldSum_9 = Add19_add_temp[12:0];
	
	assign Add20_add_cast = {{20{In_d21n[11]}}, In_d21n};
	assign Add20_add_cast_1 = {{20{In_d9[11]}}, In_d9};
	assign Add20_add_temp = Add20_add_cast + Add20_add_cast_1;
	assign FoldSum_10 = Add20_add_temp[12:0];
	
	assign Add13_add_cast = {{20{In_d20n[11]}}, In_d20n};
	assign Add13_add_cast_1 = {{20{In_d10[11]}}, In_d10};
	assign Add13_add_temp = Add13_add_cast + Add13_add_cast_1;
	assign FoldSum_11 = Add13_add_temp[12:0];
	
	assign Add14_add_cast = {{20{In_d19n[11]}}, In_d19n};
	assign Add14_add_cast_1 = {{20{In_d11[11]}}, In_d11};
	assign Add14_add_temp = Add14_add_cast + Add14_add_cast_1;
	assign FoldSum_12 = Add14_add_temp[12:0];
	
	assign Add26_add_cast = {{20{In_d18n[11]}}, In_d18n};
	assign Add26_add_cast_1 = {{20{In_d12[11]}}, In_d12};
	assign Add26_add_temp = Add26_add_cast + Add26_add_cast_1;
	assign FoldSum_13 = Add26_add_temp[12:0];
	
	assign Add29_add_cast = {{20{In_d17n[11]}}, In_d17n};
	assign Add29_add_cast_1 = {{20{In_d13[11]}}, In_d13};
	assign Add29_add_temp = Add29_add_cast + Add29_add_cast_1;
	assign FoldSum_14 = Add29_add_temp[12:0];
	
	assign Add23_add_cast = {{20{In_d16n[11]}}, In_d16n};
	assign Add23_add_cast_1 = {{20{In_d14[11]}}, In_d14};
	assign Add23_add_temp = Add23_add_cast + Add23_add_cast_1;
	assign FoldSum_15 = Add23_add_temp[12:0];
		
//------------------------Multiplications------------------------//

	assign Product1_cast = {1'b0, C1};
	assign Product1_mul_temp = Product1_cast * FoldSum_1;
	assign Product1_cast_1 = Product1_mul_temp[24:0];
	assign Mult_1 = Product1_cast_1[21:6];
	
	assign Product2_cast = {1'b0, C2};
	assign Product2_mul_temp = Product2_cast * FoldSum_2;
	assign Product2_cast_1 = Product2_mul_temp[24:0];
	assign Mult_2 = Product2_cast_1[21:6];
	
	assign Product3_cast = {1'b0, C3};
	assign Product3_mul_temp = Product3_cast * FoldSum_3;
	assign Product3_cast_1 = Product3_mul_temp[24:0];
	assign Mult_3 = Product3_cast_1[21:6];
	
	assign Product4_cast = {1'b0, C4};
	assign Product4_mul_temp = Product4_cast * FoldSum_4;
	assign Product4_cast_1 = Product4_mul_temp[24:0];
	assign Mult_4 = Product4_cast_1[21:6];
	
	assign Product5_cast = {1'b0, C5};
	assign Product5_mul_temp = Product5_cast * FoldSum_5;
	assign Product5_cast_1 = Product5_mul_temp[24:0];
	assign Mult_5 = Product5_cast_1[21:6];
	
	assign Product6_cast = {1'b0, C6};
	assign Product6_mul_temp = Product6_cast * FoldSum_6;
	assign Product6_cast_1 = Product6_mul_temp[24:0];
	assign Mult_6 = Product6_cast_1[21:6];
	
	assign Product7_cast = {1'b0, C7};
	assign Product7_mul_temp = Product7_cast * FoldSum_7;
	assign Product7_cast_1 = Product7_mul_temp[24:0];
	assign Mult_7 = Product7_cast_1[21:6];
	
	assign Product8_cast = {1'b0, C8};
	assign Product8_mul_temp = Product8_cast * FoldSum_8;
	assign Product8_cast_1 = Product8_mul_temp[24:0];
	assign Mult_8 = Product8_cast_1[21:6];
	
	assign Product9_cast = {1'b0, C9};
	assign Product9_mul_temp = Product9_cast * FoldSum_9;
	assign Product9_cast_1 = Product9_mul_temp[24:0];
	assign Mult_9 = Product9_cast_1[21:6];
	
	assign Product10_cast = {1'b0, C10};
	assign Product10_mul_temp = Product10_cast * FoldSum_10;
	assign Product10_cast_1 = Product10_mul_temp[24:0];
	assign Mult_10 = Product10_cast_1[21:6];
	
	assign Product11_cast = {1'b0, C11};
	assign Product11_mul_temp = Product11_cast * FoldSum_11;
	assign Product11_cast_1 = Product11_mul_temp[24:0];
	assign Mult_11 = Product11_cast_1[21:6];
	
	assign Product12_cast = {1'b0, C12};
	assign Product12_mul_temp = Product12_cast * FoldSum_12;
	assign Product12_cast_1 = Product12_mul_temp[24:0];
	assign Mult_12 = Product12_cast_1[21:6];
	
	assign Product13_cast = {1'b0, C13};
	assign Product13_mul_temp = Product13_cast * FoldSum_13;
	assign Product13_cast_1 = Product13_mul_temp[24:0];
	assign Mult_13 = Product13_cast_1[21:6];
	
	assign Product14_cast = {1'b0, C14};
	assign Product14_mul_temp = Product14_cast * FoldSum_14;
	assign Product14_cast_1 = Product14_mul_temp[24:0];
	assign Mult_14 = Product14_cast_1[21:6];
	
	assign Product15_cast = {1'b0, C15};
	assign Product15_mul_temp = Product15_cast * FoldSum_15;
	assign Product15_cast_1 = Product15_mul_temp[24:0];
	assign Mult_15 = Product15_cast_1[21:6];
	
	assign Product16_cast = {1'b0, C16};
	assign Product16_mul_temp = Product16_cast * In_d15;
	assign Product16_cast_1 = Product16_mul_temp[23:0];
	assign Mult_16 = Product16_cast_1[21:6];

//------------------------Filter summations------------------------//

	assign Add1_add_cast = {{16{Mult_2[15]}}, Mult_2};
	assign Add1_add_cast_1 = {{16{Mult_1[15]}}, Mult_1};
	assign Add1_add_temp = Add1_add_cast + Add1_add_cast_1;
	assign Sum_1 = Add1_add_temp[15:2];

	assign Add4_add_cast = {{16{Mult_3[15]}}, Mult_3};
	assign Add4_add_cast_1 = {{16{Sum_1[13]}}, {Sum_1, 2'b00}};
	assign Add4_add_temp = Add4_add_cast + Add4_add_cast_1;
	assign Sum_2 = Add4_add_temp[15:2];

	assign Add5_add_cast = {{16{Mult_4[15]}}, Mult_4};
	assign Add5_add_cast_1 = {{16{Sum_2[13]}}, {Sum_2, 2'b00}};
	assign Add5_add_temp = Add5_add_cast + Add5_add_cast_1;
	assign Sum_3 = Add5_add_temp[15:2];

	assign Add8_add_cast = {{16{Mult_5[15]}}, Mult_5};
	assign Add8_add_cast_1 = {{16{Sum_3[13]}}, {Sum_3, 2'b00}};
	assign Add8_add_temp = Add8_add_cast + Add8_add_cast_1;
	assign Sum_4 = Add8_add_temp[15:2];

	assign Add9_add_cast = {{16{Mult_6[15]}}, Mult_6};
	assign Add9_add_cast_1 = {{16{Sum_4[13]}}, {Sum_4, 2'b00}};
	assign Add9_add_temp = Add9_add_cast + Add9_add_cast_1;
	assign Sum_5 = Add9_add_temp[15:2];

	assign Add12_add_cast = {{16{Mult_7[15]}}, Mult_7};
	assign Add12_add_cast_1 = {{16{Sum_5[13]}}, {Sum_5, 2'b00}};
	assign Add12_add_temp = Add12_add_cast + Add12_add_cast_1;
	assign Sum_6 = Add12_add_temp[15:2];

	assign Add17_add_cast = {{16{Mult_8[15]}}, Mult_8};
	assign Add17_add_cast_1 = {{16{Sum_6[13]}}, {Sum_6, 2'b00}};
	assign Add17_add_temp = Add17_add_cast + Add17_add_cast_1;
	assign Sum_7 = Add17_add_temp[15:2];

	assign Add18_add_cast = {{16{Mult_9[15]}}, Mult_9};
	assign Add18_add_cast_1 = {{16{Sum_7[13]}}, {Sum_7, 2'b00}};
	assign Add18_add_temp = Add18_add_cast + Add18_add_cast_1;
	assign Sum_8 = Add18_add_temp[15:2];

	assign Add21_add_cast = {{16{Mult_10[15]}}, Mult_10};
	assign Add21_add_cast_1 = {{16{Sum_8[13]}}, {Sum_8, 2'b00}};
	assign Add21_add_temp = Add21_add_cast + Add21_add_cast_1;
	assign Sum_9 = Add21_add_temp[15:2];

	assign Add22_add_cast = {{16{Mult_11[15]}}, Mult_11};
	assign Add22_add_cast_1 = {{16{Sum_9[13]}}, {Sum_9, 2'b00}};
	assign Add22_add_temp = Add22_add_cast + Add22_add_cast_1;
	assign Sum_10 = Add22_add_temp[15:2];

	assign Add15_add_cast = {{16{Mult_12[15]}}, Mult_12};
	assign Add15_add_cast_1 = {{16{Sum_10[13]}}, {Sum_10, 2'b00}};
	assign Add15_add_temp = Add15_add_cast + Add15_add_cast_1;
	assign Sum_11 = Add15_add_temp[15:2];

	assign Add27_add_cast = {{16{Mult_13[15]}}, Mult_13};
	assign Add27_add_cast_1 = {{16{Sum_11[13]}}, {Sum_11, 2'b00}};
	assign Add27_add_temp = Add27_add_cast + Add27_add_cast_1;
	assign Sum_12 = Add27_add_temp[15:2];

	assign Add28_add_cast = {{16{Mult_14[15]}}, Mult_14};
	assign Add28_add_cast_1 = {{16{Sum_12[13]}}, {Sum_12, 2'b00}};
	assign Add28_add_temp = Add28_add_cast + Add28_add_cast_1;
	assign Sum_13 = Add28_add_temp[15:2];

	assign Add24_add_cast = {{16{Mult_15[15]}}, Mult_15};
	assign Add24_add_cast_1 = {{16{Sum_13[13]}}, {Sum_13, 2'b00}};
	assign Add24_add_temp = Add24_add_cast + Add24_add_cast_1;
	assign Sum_14 = Add24_add_temp[15:2];

	assign Add31_add_cast = {{16{Mult_16[15]}}, Mult_16};
	assign Add31_add_cast_1 = {{16{Sum_14[13]}}, {Sum_14, 2'b00}};
	assign Add31_add_temp = Add31_add_cast + Add31_add_cast_1;
	assign Sum_15 = Add31_add_temp[15:4];

//------------------------Output delay------------------------//

	always @(posedge clk or posedge reset)
	begin : Output_delay_process
	  if (reset == 1'b1) begin
		Out_1 <= 12'sb000000000000;
	  end
	  else begin
		Out_1 <= Sum_15;
	  end
	end

	assign Out = Out_1;

endmodule  // SigTransDetect
