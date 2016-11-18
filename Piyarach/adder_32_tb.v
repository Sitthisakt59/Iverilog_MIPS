module adder_32_bit_tb;
	
	reg[31:0] a , b;
	reg cin;
	wire[31:0] sum;
	wire cout;
	
	adder_32_bit a1(a,b,sum,cout);
	initial begin
		$monitor(a, ,b, , ,sum, ,cout);
		a = 0; b = 0;
		#1 a = 5; b = 9;
		#1 a = 32'b00000000000000000000000000010000; b = 32'b00000000000000000000000000100000;
		#1 a = 128; b = 64;
		#1 $finish;
	end
endmodule
