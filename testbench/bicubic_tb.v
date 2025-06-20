`timescale 1ns / 1ns
module bicubic_tb;

	reg clk,rst,act;

	reg [7:0] in;  //8+7

	wire [7:0] out_0, out_1, out_2, out_3;

 	bicubic B(.clk(clk), .rst(rst), .act(act), .in(in),
					.out_0(out_0), .out_1(out_1), .out_2(out_2), .out_3(out_3));


	always forever #5 clk = ~clk;


	initial begin
	
	clk=0; rst=0; in= 8'd2; act=0;
	
	#10 rst=1; act=1;
 	
	#10 in= 8'd1;
	
	#10 in= 8'd2;
	
	#10 in= 8'd3;
	
	#10 in= 8'd4;
	
	#10 in= 8'd5;
	
	#10 in= 8'd6;
	
	#10 in= 8'd7;
	
	#10 in= 8'd8;
	
	#10 in= 8'd9;
	
	#10 in= 8'd10;
	
	#10 in= 8'd11;
	
	#10 in= 8'd12;
	
	#10 in= 8'd13;
	
	#10 in= 8'd14;
	
	#10 in= 8'd15;
	
	#10 in= 8'd16;
	
	#10 in= 8'd17;
	
	#10 in= 8'd18;
	
	#10 in= 8'd19;
	
	#10 in= 8'd20;
	
  #10 rst = 0; act=0;	
	
	#10 in= 8'd21;
	
	#10 in= 8'd22;
	
	#10 in= 8'd23;
	
	#10 in= 8'd24;
	
	#10 in= 8'd25;
	
	#10 in= 8'd26;
	
	#10 in= 8'd27;
	
	#10 in= 8'd28;
	
	#10 in= 8'd29;
	
	#10 in= 8'd30;
 	
  #10 rst =1; act=1;	
	
	#10 in= 8'd31;
	
	#10 in= 8'd32;
	
	#10 in= 8'd33;
	
	#10 in= 8'd34;
	
	#10 in= 8'd35;
	
	#10 in= 8'd36;
	
	#10 in= 8'd37;
	
	#10 in= 8'd38;
	
	#10 in= 8'd39;
	
	#10 in= 8'd40;
	
  #10 act=0;	
	
	#10 in= 8'd41;
	
	#10 in= 8'd42;
	
	#10 in= 8'd43;
	
	#10 in= 8'd44;
	
	#10 in= 8'd45;
	
	#10 in= 8'd46;
	
	#10 in= 8'd47;
	
	#10 in= 8'd48;
	
	#10 in= 8'd49;
	
	#10 in= 8'd50;
	
  #10 act=1; 	
	
	#10 in= 8'd1;
	#10 in= 8'd2;
	
	#10 in= 8'd3;
	
	#10 in= 8'd4;
	
	#10 in= 8'd5;
	
	#10 in= 8'd6;
	
	#10 in= 8'd7;
	
	#10 in= 8'd8;
	
	#10 in= 8'd9;
	
	#10 in= 8'd10;
	#10 in= 8'd1;
	
	#10 in= 8'd2;
	
	#10 in= 8'd3;
	
	#10 in= 8'd4;
	
	#10 in= 8'd5;
	
	#10 in= 8'd6;
	
	#10 in= 8'd7;
	
	#10 in= 8'd8;
	
	#10 in= 8'd9;
	
	#10 in= 8'd10;
	
	#10 in= 8'd11;
	
	#10 in= 8'd12;
	
	#10 in= 8'd13;
	
	#10 in= 8'd14;
	
	#10 in= 8'd15;
	
	#10 in= 8'd16;
	
	#10 in= 8'd17;
	
	#10 in= 8'd18;
	
	#10 in= 8'd19;
	
	#10 in= 8'd20;
	
  #10 rst = 0; act=0;	
	
	#10 in= 8'd21;
	
	#10 in= 8'd22;
	
	#10 in= 8'd23;
	
	#10 in= 8'd24;
	
	#10 in= 8'd25;
	
	#10 in= 8'd26;
	
	#10 in= 8'd27;
	
	#10 in= 8'd28;
	
	#10 in= 8'd29;
	
	#10 in= 8'd30;
 	
  #10 rst =1; act=1;	
	
	#10 in= 8'd31;
	
	#10 in= 8'd32;
	
	#10 in= 8'd33;
	
	#10 in= 8'd34;
	
	#10 in= 8'd35;
	
	#10 in= 8'd36;
	
	#10 in= 8'd37;
	
	#10 in= 8'd38;
	
	#10 in= 8'd39;
	
	#10 in= 8'd40;
	
  #10 act=0;	
	
	#10 in= 8'd41;
	
	#10 in= 8'd42;
	
	#10 in= 8'd43;
	
	#10 in= 8'd44;
	
	#10 in= 8'd45;
	
	#10 in= 8'd46;
	
	#10 in= 8'd47;
	
	#10 in= 8'd48;
	
	#10 in= 8'd49;
	
	#10 in= 8'd50;
	
	#10 in= 8'd1;
	
	#10 in= 8'd2;
	
	#10 in= 8'd3;
	
	#10 in= 8'd4;
	
	#10 in= 8'd5;
	
	#10 in= 8'd6;
	
	#10 in= 8'd7;
	
	#10 in= 8'd8;
	
	#10 in= 8'd9;
	
	#10 in= 8'd10;
	
	#10 in= 8'd11;
	
	#10 in= 8'd12;
	
	#10 in= 8'd13;
	
	#10 in= 8'd14;
	
	#10 in= 8'd15;
	
	#10 in= 8'd16;
	
	#10 in= 8'd17;
	
	#10 in= 8'd18;
	
	#10 in= 8'd19;
	
	#10 in= 8'd20;
	
  #10 rst = 0; act=0;	
	
	#10 in= 8'd21;
	
	#10 in= 8'd22;
	
	#10 in= 8'd23;
	
	#10 in= 8'd24;
	
	#10 in= 8'd25;
	
	#10 in= 8'd26;
	
	#10 in= 8'd27;
	
	#10 in= 8'd28;
	
	#10 in= 8'd29;
	
	#10 in= 8'd30;
 	
  #10 rst =1; act=1;	
	
	#10 in= 8'd31;
	
	#10 in= 8'd32;
	
	#10 in= 8'd33;
	
	#10 in= 8'd34;
	
	#10 in= 8'd35;
	
	#10 in= 8'd36;
	
	#10 in= 8'd37;
	
	#10 in= 8'd38;
	
	#10 in= 8'd39;
	
	#10 in= 8'd40;
	
  #10 act=0;	
	
	#10 in= 8'd41;
	
	#10 in= 8'd42;
	
	#10 in= 8'd43;
	
	#10 in= 8'd44;
	
	#10 in= 8'd45;
	
	#10 in= 8'd46;
	
	#10 in= 8'd47;
	
	#10 in= 8'd48;
	
	#10 in= 8'd49;
	
	#10 in= 8'd50;
	
	#10 in= 8'd1;
	
	#10 in= 8'd2;
	
	#10 in= 8'd3;
	
	#10 in= 8'd4;
	
	#10 in= 8'd5;
	
	#10 in= 8'd6;
	
	#10 in= 8'd7;
	
	#10 in= 8'd8;
	
	#10 in= 8'd9;
	
	#10 in= 8'd10;
	
	#10 in= 8'd11;
	
	#10 in= 8'd12;
	
	#10 in= 8'd13;
	
	#10 in= 8'd14;
	
	#10 in= 8'd15;
	
	#10 in= 8'd16;
	
	#10 in= 8'd17;
	
	#10 in= 8'd18;
	
	#10 in= 8'd19;
	
	#10 in= 8'd20;
	
  #10 rst = 0; act=0;	
	
	#10 in= 8'd21;
	
	#10 in= 8'd22;
	
	#10 in= 8'd23;
	
	#10 in= 8'd24;
	
	#10 in= 8'd25;
	
	#10 in= 8'd26;
	
	#10 in= 8'd27;
	
	#10 in= 8'd28;
	
	#10 in= 8'd29;
	
	#10 in= 8'd30;
 	
  #10 rst =1; act=1;	
	
	#10 in= 8'd31;
	
	#10 in= 8'd32;
	
	#10 in= 8'd33;
	
	#10 in= 8'd34;
	
	#10 in= 8'd35;
	
	#10 in= 8'd36;
	
	#10 in= 8'd37;
	
	#10 in= 8'd38;
	
	#10 in= 8'd39;
	
	#10 in= 8'd40;
	
  #10 act=0;	
	
	#10 in= 8'd41;
	
	#10 in= 8'd42;
	
	#10 in= 8'd43;
	
	#10 in= 8'd44;
	
	#10 in= 8'd45;
	
	#10 in= 8'd46;
	
	#10 in= 8'd47;
	
	#10 in= 8'd48;
	
	#10 in= 8'd49;
	
	#10 in= 8'd50;
	
	#10 in= 8'd1;
	
	#10 in= 8'd2;
	
	#10 in= 8'd3;
	
	#10 in= 8'd4;
	
	#10 in= 8'd5;
	
	#10 in= 8'd6;
	
	#10 in= 8'd7;
	
	#10 in= 8'd8;
	
	#10 in= 8'd9;
	
	#10 in= 8'd10;
	
	#10 in= 8'd11;
	
	#10 in= 8'd12;
	
	#10 in= 8'd13;
	
	#10 in= 8'd14;
	
	#10 in= 8'd15;
	
	#10 in= 8'd16;
	
	#10 in= 8'd17;
	
	#10 in= 8'd18;
	
	#10 in= 8'd19;
	
	#10 in= 8'd20;
	
  #10 rst = 0; act=0;	
	
	#10 in= 8'd21;
	
	#10 in= 8'd22;
	
	#10 in= 8'd23;
	
	#10 in= 8'd24;
	
	#10 in= 8'd25;
	
	#10 in= 8'd26;
	
	#10 in= 8'd27;
	
	#10 in= 8'd28;
	
	#10 in= 8'd29;
	
	#10 in= 8'd30;
 	
  #10 rst =1; act=1;	
	
	#10 in= 8'd31;
	
	#10 in= 8'd32;
	
	#10 in= 8'd33;
	
	#10 in= 8'd34;
	
	#10 in= 8'd35;
	
	#10 in= 8'd36;
	
	#10 in= 8'd37;
	
	#10 in= 8'd38;
	
	#10 in= 8'd39;
	
	#10 in= 8'd40;
	
  #10 act=0;	
	
	#10 in= 8'd41;
	
	#10 in= 8'd42;
	
	#10 in= 8'd43;
	
	#10 in= 8'd44;
	
	#10 in= 8'd45;
	
	#10 in= 8'd46;
	
	#10 in= 8'd47;
	
	#10 in= 8'd48;
	
	#10 in= 8'd49;
	
	#10 in= 8'd50;



end


endmodule