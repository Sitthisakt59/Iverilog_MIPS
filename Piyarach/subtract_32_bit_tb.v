`include "subtract_32_bit.v"
module subtract_32_bit_tb;
	
	reg signed [31:0] a , b;
	reg cin;
	wire signed [31:0] sum;
	wire cout;
	
	subtract_32_bit s1(a,b,sum,cout);
	initial begin
		$monitor(a, ,b, , ,sum, ,cout);
		a = 0; b = 0;
		#1 a = 7; b = 6;
		#1 a = -7; b = 6;
		#1 a = 32'b00000000000000000000000000100000; b = 32'b00000000000000000000000000010000;
		#1 a = 128; b = 64;
		#1 a = 6; b = 7;
		#1 $finish;
	end
endmodule

