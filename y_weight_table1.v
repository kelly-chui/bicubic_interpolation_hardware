`timescale 1ns / 1ns
module y_weight_table1(clk, rst, in_0, in_1 , in_2, in_3, weight_sum);

	input clk,rst;

	input [14:0] in_0,in_1,in_2,in_3;  //8+7

	output [7:0] weight_sum;


	//reg
	reg[21:0] mult_0,mult_1,mult_2,mult_3;
	reg[21:0] temp_0,temp_1,temp_2,temp_3;
	
	reg[14:0] weight_sum_temp;

	always@(in_1 or in_2 or in_3 or in_0) 
   begin
	  mult_0 = {4'b0,in_0,3'b0} + {7'b0,in_0};
	  mult_1 = {1'b0,in_1,6'b0} + {2'b0,in_1,5'b0} + {4'b0,in_1,3'b0} + {5'b0,in_1,2'b0} + {6'b0,in_1,1'b0} + {7'b0,in_1};
	  mult_2 = {3'b0,in_2,4'b0} + {4'b0,in_2,3'b0} + {5'b0,in_2,2'b0} + {7'b0,in_2};
	  mult_3 = {6'b0,in_3,1'b0} + {7'b0,in_3};
   end


	always@(posedge clk) 
	 begin
	  temp_0 <= mult_0;
	  temp_1 <= mult_1;
	  temp_2 <= mult_2;
	  temp_3 <= mult_3;
	 end

  always@(temp_0 or temp_1	or temp_2	or temp_3	)
	 begin
		weight_sum_temp = temp_1[21:7] - temp_0[21:7]	+ temp_2[21:7]	- temp_3[21:7];
	 end	

  assign weight_sum = weight_sum_temp[14:7];
		
endmodule

