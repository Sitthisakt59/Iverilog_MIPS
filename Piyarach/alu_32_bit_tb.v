`include "alu_task.v"
module alu_32_bit_tb;
	reg [3:0] aluCode;
	reg signed [31:0] a,b;
	wire signed  [31:0] result;
	wire [1:0] zero;
	
	alu_32_bit alu01(aluCode,a,b,result,zero);
	initial begin
		$monitor(aluCode, ,a, ,b, ,result, ,zero);
		aluCode = 4'b0010; a = 5; b = 9;
		#1 aluCode = 4'b0010; a = 32'b00000000000000000000000000010000; b = 32'b00000000000000000000000000100000;
		#1 aluCode = 4'b0010; a = -7; b = 9;
		#1 $finish;
	end
endmodule