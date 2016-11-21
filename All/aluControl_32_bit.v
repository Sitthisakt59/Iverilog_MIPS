module aluControl_32_bit(aluOp,fuct_field,aluCode);
	input [5:0] fuct_field;
	input [1:0] aluOp;
	output [3:0] aluCode;
	
	reg [3:0] temp;
	
	always @ (fuct_field or aluOp) 
		case (aluOp) 
			2'b00 : temp = 4'b0010; // add
			2'b01 : temp = 4'b0110; // subtract
			2'b10 : begin
						case (fuct_field)
							6'b100000 : temp = 4'b0010; // add
							6'b100010 : temp = 4'b0110; // subtract
							6'b100100 : temp = 4'b0000; // AND
							6'b100101 : temp = 4'b0001; // OR
							6'b101010 : temp = 4'b0111; // SLT
							default : $display("Error in fuct_field"); 
						endcase
					end
		default : $display("Error in ALUOp"); 
	endcase 
	
	assign aluCode = temp;
endmodule