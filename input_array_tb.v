`timescale 1ns / 1ns

module input_array_tb;
 
 reg clk,rst,act;

 reg [14:0] in;

 wire [14:0] out_0, out_1, out_2, out_3;

 input_array A(.clk(clk), .rst(rst), .act(act), .in(in),
					.out_0(out_0), .out_1(out_1), .out_2(out_2), .out_3(out_3));

 always forever #5 clk = ~clk;

 initial begin

		clk=0; rst=0; in= 15'd2; act=0;

	#10 rst=1; act=1;
 
	#10 in= 15'd1;

	#10 in= 15'd2;

	#10 in= 15'd3;

	#10 in= 15'd4;

	#10 in= 15'd5;

	#10 in= 15'd6;

	#10 in= 15'd7;

	#10 in= 15'd8;

	#10 in= 15'd9;

	#10 in= 15'd10;

	#10 in= 15'd11;

	#10 in= 15'd12;

	#10 in= 15'd13;

	#10 in= 15'd14;

	#10 in= 15'd15;

	#10 in= 15'd16;

	#10 in= 15'd17;

	#10 in= 15'd18;

	#10 in= 15'd19;

	#10 in= 15'd20;

  #10 rst = 0; act=0;

	#10 in= 15'd21;

	#10 in= 15'd22;

	#10 in= 15'd23;

	#10 in= 15'd24;

	#10 in= 15'd25;

	#10 in= 15'd26;

	#10 in= 15'd27;

	#10 in= 15'd28;

	#10 in= 15'd29;

	#10 in= 15'd30;
 
  #10 rst =1; act=1;

	#10 in= 15'd31;

	#10 in= 15'd32;

	#10 in= 15'd33;

	#10 in= 15'd34;

	#10 in= 15'd35;

	#10 in= 15'd36;

	#10 in= 15'd37;

	#10 in= 15'd38;

	#10 in= 15'd39;

	#10 in= 15'd40;

  #10 act=0;

	#10 in= 15'd41;

	#10 in= 15'd42;

	#10 in= 15'd43;

	#10 in= 15'd44;

	#10 in= 15'd45;

	#10 in= 15'd46;

	#10 in= 15'd47;

	#10 in= 15'd48;

	#10 in= 15'd49;

	#10 in= 15'd50;

  #10 act=1; 

	#10 in= 15'd1;
	#10 in= 15'd2;

	#10 in= 15'd3;

	#10 in= 15'd4;

	#10 in= 15'd5;

	#10 in= 15'd6;

	#10 in= 15'd7;

	#10 in= 15'd8;

	#10 in= 15'd9;

	#10 in= 15'd10;
end
endmodule

