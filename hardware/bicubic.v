`timescale 1ns / 1ns
module bicubic(clk, rst, act, in, out_0, out_1, out_2, out_3);

	input clk,rst,act;
	input [7:0] in;
 
  wire oooooooooooooooo;

	wire [7:0] in_0,in_1,in_2,in_3;  //8+7

	output [7:0] out_0, out_1, out_2, out_3;

	wire [1:0] ooooooooooo;
	//reg
	wire[14:0] x_weight_sum_0;
	wire[14:0] x_weight_sum_1;
	wire[14:0] x_weight_sum_2;
	wire[14:0] x_weight_sum_3;
	
	wire[7:0] y_weight_sum_0;	
	wire[7:0] y_weight_sum_1;
	wire[7:0] y_weight_sum_2;
	wire[7:0] y_weight_sum_3;



	 input_array A(.clk(clk), .rst(rst), .act(act), .in(in),
					.out_0(in_3), .out_1(in_2), .out_2(in_1), .out_3(in_0));

  //x 가중치 값 배열 
	reg[14:0] array0_0 [3:0];
	reg[14:0] array0_1 [3:0];
	
	reg[14:0] array1_0 [3:0];
	reg[14:0] array1_1 [3:0];
	
	reg[14:0] array2_0 [3:0];
	reg[14:0] array2_1 [3:0];
	
	reg[14:0] array3_0 [3:0];
	reg[14:0] array3_1 [3:0];



	reg[1:0] mux_sel;
	reg switch;


	wire[14:0] dm0_0_0, dm0_1_0, dm0_2_0, dm0_3_0, 				
					  dm0_0_1, dm0_1_1, dm0_2_1, dm0_3_1,
					
 					 dm1_0_0, dm1_1_0, dm1_2_0, dm1_3_0, 
					 dm1_0_1, dm1_1_1, dm1_2_1, dm1_3_1,
					
 					 dm2_0_0, dm2_1_0, dm2_2_0, dm2_3_0, 
					 dm2_0_1, dm2_1_1, dm2_2_1, dm2_3_1,
					
 					 dm3_0_0, dm3_1_0, dm3_2_0, dm3_3_0, 
					 dm3_0_1, dm3_1_1, dm3_2_1, dm3_3_1;
					
  wire[14:0]  array0_0_0, array0_1_0, array0_2_0, array0_3_0, 					
					  array0_0_1, array0_1_1, array0_2_1, array0_3_1,
					
 					 array1_0_0, array1_1_0, array1_2_0, array1_3_0, 
					 array1_0_1, array1_1_1, array1_2_1, array1_3_1,
					
 					 array2_0_0, array2_1_0, array2_2_0, array2_3_0, 
					 array2_0_1, array2_1_1, array2_2_1, array2_3_1,
					
 					 array3_0_0, array3_1_0, array3_2_0, array3_3_0, 
					 array3_0_1, array3_1_1, array3_2_1, array3_3_1;
					
	wire[14:0]  y_in0_0,y_in0_1,y_in0_2,y_in0_3,				
					  y_in1_0,y_in1_1,y_in1_2,y_in1_3,
					  y_in2_0,y_in2_1,y_in2_2,y_in2_3,
					  y_in3_0,y_in3_1,y_in3_2,y_in3_3;



	assign array0_0_0= array0_0[0];		
	assign array0_1_0= array0_0[1];		
	assign array0_2_0= array0_0[2];		
	assign array0_3_0= array0_0[3];		
	assign array1_0_0= array1_0[0];		
	assign array1_1_0= array1_0[1];		
	assign array1_2_0= array1_0[2];		
	assign array1_3_0= array1_0[3];		
	assign array2_0_0= array2_0[0];		
	assign array2_1_0= array2_0[1];		
	assign array2_2_0= array2_0[2];		
	assign array2_3_0= array2_0[3];		
	assign array3_0_0= array3_0[0];		
	assign array3_1_0= array3_0[1];		
	assign array3_2_0= array3_0[2];		
	assign array3_3_0= array3_0[3];		
			
	assign array0_0_1= array0_1[0];		
	assign array0_1_1= array0_1[1];		
	assign array0_2_1= array0_1[2];		
	assign array0_3_1= array0_1[3];		
	assign array1_0_1= array1_1[0];		
	assign array1_1_1= array1_1[1];		
	assign array1_2_1= array1_1[2];		
	assign array1_3_1= array1_1[3];		
	assign array2_0_1= array2_1[0];		
	assign array2_1_1= array2_1[1];		
	assign array2_2_1= array2_1[2];		
	assign array2_3_1= array2_1[3];		
	assign array3_0_1= array3_1[0];		
	assign array3_1_1= array3_1[1];		
	assign array3_2_1= array3_1[2];		
	assign array3_3_1= array3_1[3];		

	assign out_0 = y_weight_sum_0;
	assign out_1 = y_weight_sum_1;
	assign out_2 = y_weight_sum_2;
	assign out_3 = y_weight_sum_3;






	//x가중치 테이블 모듈 연결 
	weight_table0 x0(.clk(clk), .rst(rst), .in_0(in_0), .in_1(in_1), .in_2(in_2), .in_3(in_3), .weight_sum(x_weight_sum_0));
	weight_table1 x1(.clk(clk), .rst(rst), .in_0(in_0), .in_1(in_1), .in_2(in_2), .in_3(in_3), .weight_sum(x_weight_sum_1));
	weight_table2 x2(.clk(clk), .rst(rst), .in_0(in_0), .in_1(in_1), .in_2(in_2), .in_3(in_3), .weight_sum(x_weight_sum_2));
	weight_table3 x3(.clk(clk), .rst(rst), .in_0(in_0), .in_1(in_1), .in_2(in_2), .in_3(in_3), .weight_sum(x_weight_sum_3));




	demux1_8 dm0( .in(x_weight_sum_0), .switch(switch) , .mux_sel(mux_sel), .out0_0(dm0_0_0) , .out0_1(dm0_0_1), .out1_0(dm0_1_0) , .out1_1(dm0_1_1), .out2_0(dm0_2_0) , .out2_1(dm0_2_1), .out3_0(dm0_3_0), .out3_1(dm0_3_1));
	demux1_8 dm1( .in(x_weight_sum_1), .switch(switch) , .mux_sel(mux_sel), .out0_0(dm1_0_0) , .out0_1(dm1_0_1), .out1_0(dm1_1_0) , .out1_1(dm1_1_1), .out2_0(dm1_2_0) , .out2_1(dm1_2_1), .out3_0(dm1_3_0), .out3_1(dm1_3_1));
	demux1_8 dm2( .in(x_weight_sum_2), .switch(switch) , .mux_sel(mux_sel), .out0_0(dm2_0_0) , .out0_1(dm2_0_1), .out1_0(dm2_1_0) , .out1_1(dm2_1_1), .out2_0(dm2_2_0) , .out2_1(dm2_2_1), .out3_0(dm2_3_0), .out3_1(dm2_3_1));
	demux1_8 dm3( .in(x_weight_sum_3), .switch(switch) , .mux_sel(mux_sel), .out0_0(dm3_0_0) , .out0_1(dm3_0_1), .out1_0(dm3_1_0) , .out1_1(dm3_1_1), .out2_0(dm3_2_0) , .out2_1(dm3_2_1), .out3_0(dm3_3_0), .out3_1(dm3_3_1));

	top_mux top(.in0_0_0(array0_0_0), .in0_1_0(array0_1_0), .in0_2_0(array0_2_0), .in0_3_0(array0_3_0), 					
					  .in0_0_1(array0_0_1), .in0_1_1(array0_1_1), .in0_2_1(array0_2_1), .in0_3_1(array0_3_1),
						.in1_0_0(array1_0_0), .in1_1_0(array1_1_0), .in1_2_0(array1_2_0), .in1_3_0(array1_3_0), 							
						.in1_0_1(array1_0_1), .in1_1_1(array1_1_1), .in1_2_1(array1_2_1), .in1_3_1(array1_3_1),							
						.in2_0_0(array2_0_0), .in2_1_0(array2_1_0), .in2_2_0(array2_2_0), .in2_3_0(array2_3_0), 							
						.in2_0_1(array2_0_1), .in2_1_1(array2_1_1), .in2_2_1(array2_2_1), .in2_3_1(array2_3_1),									
 						.in3_0_0(array3_0_0), .in3_1_0(array3_1_0), .in3_2_0(array3_2_0), .in3_3_0(array3_3_0), 							
						.in3_0_1(array3_0_1), .in3_1_1(array3_1_1), .in3_2_1(array3_2_1), .in3_3_1(array3_3_1),	
						.switch(switch), .mux_sel(mux_sel),					

						
					 .out0_0(y_in0_0), .out0_1(y_in0_1), .out0_2(y_in0_2), .out0_3(y_in0_3),
					 .out1_0(y_in1_0), .out1_1(y_in1_1), .out1_2(y_in1_2), .out1_3(y_in1_3),
					 .out2_0(y_in2_0), .out2_1(y_in2_1), .out2_2(y_in2_2), .out2_3(y_in2_3),
					 .out3_0(y_in3_0), .out3_1(y_in3_1), .out3_2(y_in3_2), .out3_3(y_in3_3));


	y_weight_table0 y0(.clk(clk), .rst(rst), .in_0(y_in0_0), .in_1(y_in0_1), .in_2(y_in0_2), .in_3(y_in0_3), .weight_sum(y_weight_sum_0));
	y_weight_table1 y1(.clk(clk), .rst(rst), .in_0(y_in1_0), .in_1(y_in1_1), .in_2(y_in1_2), .in_3(y_in1_3), .weight_sum(y_weight_sum_1));
	y_weight_table2 y2(.clk(clk), .rst(rst), .in_0(y_in2_0), .in_1(y_in2_1), .in_2(y_in2_2), .in_3(y_in2_3), .weight_sum(y_weight_sum_2));
	y_weight_table3 y3(.clk(clk), .rst(rst), .in_0(y_in3_0), .in_1(y_in3_1), .in_2(y_in3_2), .in_3(y_in3_3), .weight_sum(y_weight_sum_3));




	//mux_sel count
	always@(posedge clk or negedge rst)
	 begin
		if(!rst)
			mux_sel <=2'b10;
		else begin
		 case(act)
       1'b0: mux_sel <= mux_sel;
       1'b1: begin 
		 				if(mux_sel == 2'b11)
				 			mux_sel <= 2'b00;
						else
				 			mux_sel <= mux_sel +1;
					  end
 		  endcase
      end
	  end

	// 배열 바뀌니까,,, why 1 is first? : 1->0->1 mux-> 조합회로 -> 셀렉에 따라 바로 빠져나간다. // 이전값 출력값 영향 -> f/f
	always@(posedge clk or negedge rst) 
	 begin
		if(!rst)
			switch <= 1;
		else
		 if(mux_sel == 2'b11)
			switch <= !switch;
		 else 
			switch <=switch;
	 end


	
	// 굳이 리셋 달아줄 필요는 X// 가 아니라 리셋후 [0]에 넣어줘야 하므로 필요 //가 아니라 swith muxsel(순차회로)에 따라 움직이미로 필요 X 
	always@(posedge clk )
	  begin
			case({switch,mux_sel})
 					//table0
					3'b000: begin  
									array0_0[0] <= dm0_0_0;
									array1_0[0] <= dm1_0_0;
									array2_0[0] <= dm2_0_0;
									array3_0[0] <= dm3_0_0;
								 end

					3'b001: begin  
									array0_0[1] <= dm0_1_0;
									array1_0[1] <= dm1_1_0;
									array2_0[1] <= dm2_1_0;
									array3_0[1] <= dm3_1_0;
								 end

					3'b010: begin  
									array0_0[2] <= dm0_2_0;
									array1_0[2] <= dm1_2_0;
									array2_0[2] <= dm2_2_0;
									array3_0[2] <= dm3_2_0;
								 end

					3'b011: begin  
									array0_0[3] <= dm0_3_0;
									array1_0[3] <= dm1_3_0;
									array2_0[3] <= dm2_3_0;
									array3_0[3] <= dm3_3_0;
								 end

					3'b100: begin  
									array0_1[0] <= dm0_0_1;
									array1_1[0] <= dm1_0_1;
									array2_1[0] <= dm2_0_1;
									array3_1[0] <= dm3_0_1;
								 end

					3'b101: begin  
									array0_1[1] <= dm0_1_1;
									array1_1[1] <= dm1_1_1;
									array2_1[1] <= dm2_1_1;
									array3_1[1] <= dm3_1_1;
								 end

					3'b110: begin  
									array0_1[2] <= dm0_2_1;
									array1_1[2] <= dm1_2_1;
									array2_1[2] <= dm2_2_1;
									array3_1[2] <= dm3_2_1;
								 end

					3'b111: begin  
									array0_1[3] <= dm0_3_1;
									array1_1[3] <= dm1_3_1;
									array2_1[3] <= dm2_3_1;
									array3_1[3] <= dm3_3_1;
								 end
	 			endcase
	  end


endmodule


















