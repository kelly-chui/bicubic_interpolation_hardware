`timescale 1ns / 1ns
module mux2_1(in_0,in_1,switch,out);

	input[14:0] in_0,in_1;					
	input 					switch;
	output[14:0] out;					
 	reg [14:0] out;					

	always@(in_0 or in_1 or switch) 
		begin
			case(switch)
				1'b0: out = in_1;
				1'b1: out = in_0;
				default: out= 0;
			endcase
		end

endmodule