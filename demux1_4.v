`timescale 1ns / 1ns
module demux1_4( in, mux_sel, out_0, out_1, out_2, out_3);

	input[14:0] in;
	input [1:0] mux_sel;
	
	output[14:0]  out_0, out_1, out_2, out_3;
	reg[14:0]  out_0, out_1, out_2, out_3;


	
	always @(in or mux_sel) 
	  begin
		  case(mux_sel)
			 	3'b00: 		out_0 = in;
			 	3'b01: 		out_1 = in;
			 	3'b10: 		out_2 = in;
			 	3'b11: 		out_3 = in;
				default: out_0 = 0;
			endcase
		end

endmodule