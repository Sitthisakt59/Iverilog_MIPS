module subtract_32_bit_tb;
	
	reg[31:0] a , b;
	reg cin;
	wire[31:0] sum;
	wire cout;
	
	subtract_32_bit s1(a,b,sum,cout);
	initial begin
		$monitor(a, ,b, , ,sum, ,cout);
		a = 0; b = 0;
		#1 a = 7; b = 6;
		#1 a = 32'b00000000000000000000000000100000; b = 32'b00000000000000000000000000010000;
		#1 a = 128; b = 64;
		#1 $finish;
	end
endmodule
