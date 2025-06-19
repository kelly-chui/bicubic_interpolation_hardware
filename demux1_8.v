`timescale 1ns / 1ns
module demux1_8( in, switch , mux_sel, out0_0 , out0_1, out1_0 , out1_1, out2_0 , out2_1, out3_0, out3_1);
	
	input[14:0] in;
	input switch;
	input [1:0] mux_sel;
	
	output[14:0] out0_0 , out0_1, out1_0 , out1_1, out2_0 , out2_1, out3_0, out3_1;
	
	reg [14:0] wire_0, wire_1;


	demux1_4 d0( .in(wire_0), .mux_sel(mux_sel), .out_0(out0_0), .out_1(out1_0), .out_2(out2_0), .out_3(out3_0));
	demux1_4 d1( .in(wire_1), .mux_sel(mux_sel), .out_0(out0_1), .out_1(out1_1), .out_2(out2_1), .out_3(out3_1));


	//1:2 Demux
	always @(in or switch)
	 begin
		case(switch)
		 	1'b0:			 wire_0 = in;
		 	1'b1: 			wire_1 = in;
		 	default:	begin wire_0	=0; end
	   endcase
	 end 
endmodule