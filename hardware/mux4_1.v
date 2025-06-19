`timescale 1ns / 1ns
module mux4_1(in_0,in_1,in_2,in_3,mux_sel,out);

 	input[14:0]		in_0, in_1, in_2, in_3;	
	input[1:0]			mux_sel;
				
	output[14:0] out;			
				
	reg[14:0] out;			


	always@(in_0 or in_1 or in_2 or in_3 or mux_sel)
		begin
			case(mux_sel)
			 2'b00 : out = in_0;
			 2'b01 : out = in_1;
			 2'b10 : out = in_2;
			 2'b11 : out = in_3;
			 default: out = 0;
			endcase
		end

endmodule 