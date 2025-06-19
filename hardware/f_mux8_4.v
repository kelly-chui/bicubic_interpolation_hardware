`timescale 1ns / 1ns
module f_mux8_4(in0_0, in1_0, in2_0, in3_0, in0_1, in1_1, in2_1, in3_1, switch, out_0, out_1, out_2, out_3);
			
	input[14:0]		in0_0, in1_0, in2_0, in3_0, in0_1, in1_1, in2_1, in3_1;
	input      		switch;
	output[14:0] out_0, out_1, out_2, out_3;		


	mux2_1 M0(.in_0(in0_0), .in_1(in0_1), .switch(switch), .out(out_0));
	mux2_1 M1(.in_0(in1_0), .in_1(in1_1), .switch(switch), .out(out_1));
	mux2_1 M2(.in_0(in2_0), .in_1(in2_1), .switch(switch), .out(out_2));
	mux2_1 M3(.in_0(in3_0), .in_1(in3_1), .switch(switch), .out(out_3));
   
endmodule