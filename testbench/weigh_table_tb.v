`timescale 1ns / 1ns
module weight_table_tb;

	reg[14:0] in_0,in_1,in_2,in_3;
	reg clk,rst;

	wire[16:0] weight_sum;

	weight_table0 UTT(.clk(clk), .rst(rst), .in_0(in_0), .in_1(in_1), .in_2(in_2), .in_3(in_3), .weight_sum(weight_sum));


	always forever #5 clk = ~clk;

	initial begin
		clk =0; rst=1; 
		 in_0 ={8'd255,7'b0000000}; in_1 ={8'd255,7'b0000000}; in_2 ={8'd255,7'b0000000}; in_3 ={8'd255,7'b0000000}; 
	 
	 #10 
	  	in_0 ={8'd20,7'b0000000}; in_1 ={8'd30,7'b0000000}; in_2 ={8'd25,7'b0000000}; in_3 ={8'd55,7'b0000000}; 

	 #10 
	  	in_0 ={8'd22,7'b0000000}; in_1 ={8'd3,7'b0000000}; in_2 ={8'd5,7'b0000000}; in_3 ={8'd9,7'b0000000}; 
  end

endmodule