module aluControl_32_bit_tb;
	
	reg [1:0] aluOp;
	reg [5:0] fuct_field;
	wire [3:0] aluCode;
	
	aluControl_32_bit s1(aluOp,fuct_field,aluCode);
	initial begin
		$monitor("%b , %b , %b \n",aluOp,fuct_field,aluCode);
		aluOp = 2'b00; fuct_field = 6'b000000;
		#1 aluOp = 2'b01; fuct_field = 6'b000000;
		#1 aluOp = 2'b10; fuct_field = 6'b100000;
		#1 aluOp = 2'b10; fuct_field = 6'b100010;
		#1 aluOp = 2'b10; fuct_field = 6'b100100;
		#1 aluOp = 2'b10; fuct_field = 6'b100101;
		#1 aluOp = 2'b10; fuct_field = 6'b101010;
		#1 aluOp = 2'b11; fuct_field = 6'b101010;
		#1 aluOp = 2'b10; fuct_field = 6'b111111;
		#1 $finish;
	end
endmodule
