`include "adder_32_bit.v"
module adder_32_bit_tb;
	
	reg[31:0] a , b;
	reg cin;
	wire[31:0] sum;
	wire cout;
	
	adder_32_bit a1(a,b,cin,sum,cout);
	initial begin
		$monitor(a, ,b, , ,sum, ,cout);
		a = 0; b = 0; cin = 0;
		#1 a = 5; b = 9; cin = 1'b0;
		#1 a = 32'b00000000000000000000000000010000; b = 32'b00000000000000000000000000100000; cin = 1'b0;
		#1 a = 128; b = 64; cin = 1'b0;
		#1 $finish;
	end
endmodule
