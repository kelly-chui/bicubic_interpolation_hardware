`timescale 1ns / 1ns
module input_array(clk, rst, act, in, out_0, out_1, out_2, out_3);

 input clk,rst,act;
 input[7:0] in;
 output [7:0] out_0, out_1, out_2, out_3;

 reg [7:0]input_array_0 [0:3];
 reg [7:0]input_array_1 [0:3];
 reg [7:0]input_array_2 [0:3];
 reg [7:0]input_array_3 [0:3];

 reg [1:0] count;
 reg [7:0] out_0, out_1, out_2, out_3;


 reg enable;


 always@(posedge clk or negedge rst) 
 begin
  if(!rst)
   count <= 2'b00;
  
 else
   begin
    case(act)
     1'b0:
 			count <= count;
     1'b1: begin
   				  if(count==2'b11)
     					 count<= 2'b00;
    				  else
             count <= count+1; 
          end 
	  endcase
   end
 end


 always@(posedge clk)
  begin
   if(act==0) begin
  					 input_array_3[0] <= input_array_3[0];
 					 input_array_3[3] <= input_array_3[3];
  					 input_array_3[2] <= input_array_3[2];
 					 input_array_3[1] <= input_array_3[1];

  					 input_array_2[0] <= input_array_2[0];
 					 input_array_2[3] <= input_array_2[3];
  					 input_array_2[2] <= input_array_2[2];
 					 input_array_2[1] <= input_array_2[1];

  					 input_array_1[0] <= input_array_1[0];
 					 input_array_1[3] <= input_array_1[3];
  					 input_array_1[2] <= input_array_1[2];
 					 input_array_1[1] <= input_array_1[1];

  					 input_array_0[0] <= input_array_0[0];
 					 input_array_0[3] <= input_array_0[3];
  					 input_array_0[2] <= input_array_0[2];
 					 input_array_0[1] <= input_array_0[1];
          end
  
  else begin
     case(count)		 
  		  3'b00 : begin 
  					 input_array_0[0] <= in;
 					 input_array_3[3] <= input_array_3[2];
  					 input_array_3[2] <= input_array_3[1];
 					 input_array_3[1] <= input_array_3[0];
           end

   		  3'b01 : begin
	           input_array_1[0] <= in;
 					 input_array_0[3] <= input_array_0[2];
  					 input_array_0[2] <= input_array_0[1];
 					 input_array_0[1] <= input_array_0[0];
           end

    		 3'b10 : begin
             input_array_2[0] <= in;
 					 input_array_1[3] <= input_array_1[2];
  					 input_array_1[2] <= input_array_1[1];
 					 input_array_1[1] <= input_array_1[0];
           end

    	  3'b11 : begin
             input_array_3[0] <= in;
 					 input_array_2[3] <= input_array_2[2];
  					 input_array_2[2] <= input_array_2[1];
 					 input_array_2[1] <= input_array_2[0];
           end
     endcase
    end
   end 


 always @ (count or input_array_0[0] or input_array_0[1] or input_array_0[2] or input_array_0[3]or input_array_1[0] or input_array_1[1] or input_array_1[2] or input_array_1[3]or input_array_2[0] or input_array_2[1] or input_array_2[2] or input_array_2[3]or input_array_3[0] or input_array_3[1] or input_array_3[2] or input_array_3[3])
  begin
   case(count)
    2'b01 : begin
					  out_0 = input_array_0[0];
					  out_1 = input_array_0[1];
					  out_2 = input_array_0[2];
					  out_3 = input_array_0[3];
           end

    2'b10 : begin
					  out_0 = input_array_1[0];
					  out_1 = input_array_1[1];
					  out_2 = input_array_1[2];
					  out_3 = input_array_1[3];
           end

    2'b11 : begin
					  out_0 = input_array_2[0];
					  out_1 = input_array_2[1];
					  out_2 = input_array_2[2];
					  out_3 = input_array_2[3];
           end

    2'b00 : begin
					  out_0 = input_array_3[0];
					  out_1 = input_array_3[1];
					  out_2 = input_array_3[2];
					  out_3 = input_array_3[3];
           end
   endcase
end 
endmodule
  
