module slt_32_bit_tb;
	
	reg signed [31:0] a , b;
	reg cin;
	wire signed [31:0] result;
	
	slt_32_bit s1(a,b,result);
	initial begin
		$monitor(a, ,b, , ,result);
		a = 0; b = 0;
		#1 a = -7; b = 6;
		#1 a = 32'b00000000000000000000000000001000; b = 32'b00000000000000000000000000110000;
		#1 a = 128; b = 64;
		#1 a = 6; b = 7;
		#1 $finish;
	end
endmodule
