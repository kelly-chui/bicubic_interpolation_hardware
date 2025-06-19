`timescale 1ns / 1ns
module top_mux(in0_0_0, in0_1_0, in0_2_0, in0_3_0, 					
					  in0_0_1, in0_1_1, in0_2_1, in0_3_1,
					
 					 in1_0_0, in1_1_0, in1_2_0, in1_3_0, 
					 in1_0_1, in1_1_1, in1_2_1, in1_3_1,
					
 					 in2_0_0, in2_1_0, in2_2_0, in2_3_0, 
					 in2_0_1, in2_1_1, in2_2_1, in2_3_1,
					
 					 in3_0_0, in3_1_0, in3_2_0, in3_3_0, 
					 in3_0_1, in3_1_1, in3_2_1, in3_3_1,

					 switch,mux_sel,
						
					 out0_0, out0_1, out0_2, out0_3,
					 out1_0, out1_1, out1_2, out1_3,
					 out2_0, out2_1, out2_2, out2_3,
					 out3_0, out3_1, out3_2, out3_3);

	input[1:0] mux_sel;
	input switch;


	input[14:0] in0_0_0, in0_1_0, in0_2_0, in0_3_0, 						
					  in0_0_1, in0_1_1, in0_2_1, in0_3_1,		
							
 					 in1_0_0, in1_1_0, in1_2_0, in1_3_0, 		
					 in1_0_1, in1_1_1, in1_2_1, in1_3_1,		
							
 					 in2_0_0, in2_1_0, in2_2_0, in2_3_0, 		
					 in2_0_1, in2_1_1, in2_2_1, in2_3_1,		
							
 					 in3_0_0, in3_1_0, in3_2_0, in3_3_0, 		
					 in3_0_1, in3_1_1, in3_2_1, in3_3_1;		
							
	output[14:0] 	out0_0, out0_1, out0_2, out0_3,					
					 		out1_0, out1_1, out1_2, out1_3,
					 		out2_0, out2_1, out2_2, out2_3,
							out3_0, out3_1, out3_2, out3_3;
							
							
							
	  wire[14:0] m0_0, m0_1, m0_2, m0_3, 						
 						 m1_0, m1_1, m1_2, m1_3, 	
 						 m2_0, m2_1, m2_2, m2_3,	
 						 m3_0, m3_1, m3_2, m3_3; 	



	f_mux8_4 F0(.in0_0(in0_0_0), .in1_0(in0_1_0), .in2_0(in0_2_0), .in3_0(in0_3_0), .in0_1(in0_0_1), .in1_1(in0_1_1), .in2_1(in0_2_1), .in3_1(in0_3_1), .switch(switch), .out_0(m0_0), .out_1(m0_1), .out_2(m0_2), .out_3(m0_3));
	f_mux8_4 F1(.in0_0(in1_0_0), .in1_0(in1_1_0), .in2_0(in1_2_0), .in3_0(in1_3_0), .in0_1(in1_0_1), .in1_1(in1_1_1), .in2_1(in1_2_1), .in3_1(in1_3_1), .switch(switch), .out_0(m1_0), .out_1(m1_1), .out_2(m1_2), .out_3(m1_3));
	f_mux8_4 F2(.in0_0(in2_0_0), .in1_0(in2_1_0), .in2_0(in2_2_0), .in3_0(in2_3_0), .in0_1(in2_0_1), .in1_1(in2_1_1), .in2_1(in2_2_1), .in3_1(in2_3_1), .switch(switch), .out_0(m2_0), .out_1(m2_1), .out_2(m2_2), .out_3(m2_3));
	f_mux8_4 F3(.in0_0(in3_0_0), .in1_0(in3_1_0), .in2_0(in3_2_0), .in3_0(in3_3_0), .in0_1(in3_0_1), .in1_1(in3_1_1), .in2_1(in3_2_1), .in3_1(in3_3_1), .switch(switch), .out_0(m3_0), .out_1(m3_1), .out_2(m3_2), .out_3(m3_3));


	mux4_1 M0_0(.in_0(m0_0), .in_1(m1_0), .in_2(m2_0), .in_3(m3_0), .mux_sel(mux_sel), .out(out0_0));
	mux4_1 M0_1(.in_0(m0_1), .in_1(m1_1), .in_2(m2_1), .in_3(m3_1), .mux_sel(mux_sel), .out(out0_1));
	mux4_1 M0_2(.in_0(m0_2), .in_1(m1_2), .in_2(m2_2), .in_3(m3_2), .mux_sel(mux_sel), .out(out0_2));
	mux4_1 M0_3(.in_0(m0_3), .in_1(m1_3), .in_2(m2_3), .in_3(m3_3), .mux_sel(mux_sel), .out(out0_3));

	mux4_1 M1_0(.in_0(m1_0), .in_1(m2_0), .in_2(m3_0), .in_3(m0_0), .mux_sel(mux_sel), .out(out1_0));
	mux4_1 M1_1(.in_0(m1_1), .in_1(m2_1), .in_2(m3_1), .in_3(m0_1), .mux_sel(mux_sel), .out(out1_1));
	mux4_1 M1_2(.in_0(m1_2), .in_1(m2_2), .in_2(m3_2), .in_3(m0_2), .mux_sel(mux_sel), .out(out1_2));
	mux4_1 M1_3(.in_0(m1_3), .in_1(m2_3), .in_2(m3_3), .in_3(m0_3), .mux_sel(mux_sel), .out(out1_3));

	mux4_1 M2_0(.in_0(m2_0), .in_1(m3_0), .in_2(m0_0), .in_3(m1_0), .mux_sel(mux_sel), .out(out2_0));
	mux4_1 M2_1(.in_0(m2_1), .in_1(m3_1), .in_2(m0_1), .in_3(m1_1), .mux_sel(mux_sel), .out(out2_1));
	mux4_1 M2_2(.in_0(m2_2), .in_1(m3_2), .in_2(m0_2), .in_3(m1_2), .mux_sel(mux_sel), .out(out2_2));
	mux4_1 M2_3(.in_0(m2_3), .in_1(m3_3), .in_2(m0_3), .in_3(m1_3), .mux_sel(mux_sel), .out(out2_3));

	mux4_1 M3_0(.in_0(m3_0), .in_1(m0_0), .in_2(m1_0), .in_3(m2_0), .mux_sel(mux_sel), .out(out3_0));
	mux4_1 M3_1(.in_0(m3_1), .in_1(m0_1), .in_2(m1_1), .in_3(m2_1), .mux_sel(mux_sel), .out(out3_1));
	mux4_1 M3_2(.in_0(m3_2), .in_1(m0_2), .in_2(m1_2), .in_3(m2_2), .mux_sel(mux_sel), .out(out3_2));
	mux4_1 M3_3(.in_0(m3_3), .in_1(m0_3), .in_2(m1_3), .in_3(m2_3), .mux_sel(mux_sel), .out(out3_3));


endmodule













