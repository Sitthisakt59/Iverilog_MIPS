module alu_32_bit(aluCode,a,b,result,zero);
	input[3:0] aluCode;
	input signed  [31:0] a , b;
	output signed  [31:0] result;
	output [1:0] zero;
	
	reg signed  [31:0] temp_result;
	reg cin,cout;
	reg temp_zero = 0;
	
	task full_adder_task;
		input a, b, cin;
		output sum, cout;
		begin
			sum = cin ^ a ^ b; // cin XOR a XOR b
			cout = cin & (a ^ b) | (a & b);
		//~cin & a & b | cin & (a | b); // cin'ab + cin(a + b)
		end
	endtask
	
	task adder_32_bit_task;
		input signed [31:0] a, b;
		input cin;
		output signed [31:0] sum;
		output cout;
		reg carry_x,carry_z;
		integer i;
		begin
			full_adder_task(a[0],b[0],cin,sum[0],carry_x);
			
			for(i=1;i<32;i=i+1)
			begin
				full_adder_task(a[i],b[i],carry_x,sum[i],carry_z);
				carry_x = carry_z;
			end
			cout = carry_x;
		end
		
	endtask
	
	
	always @ (aluCode)
		case (aluCode) 
			4'b0010 : begin
							$display("ADD"); 
							cin = 1'b0;
							adder_32_bit_task(a,b,cin,temp_result,cout);
							//adder_32_bit add(a,b,cin,result,cout);
					  end
			4'b0110 : begin
							$display("SUBTRACT \n"); 
							//subtract_32_bit sub(a,b,result,cout);
					  end
			4'b0000 : begin
							$display("AND \n"); 
					  end
			4'b0001 : begin
							$display("OR \n"); 
					  end
			4'b0111 : begin
							$display("SLT \n"); 
							//slt_32_bit sub(a,b,result);
							case (result) 
								1 : temp_zero = 1'b1;
								default : temp_zero = 1'b0; 
							endcase
					  end
			
		default : $display("Error in ALUOp"); 
		endcase 
	
		assign result = temp_result;
		assign zero = temp_zero;
	
endmodule
