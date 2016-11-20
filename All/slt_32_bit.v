module slt_32_bit(a,b,result);
	input signed [31:0] a, b;
	output signed [31:0] result;
	wire signed [31:0] sum;
	wire cout; // temp cout to call subtract_32_bits
	
	reg signed [31:0] temp_result;
	
	subtract_32_bit sub(a,b,sum,cout);
	
	always @(sum) begin
		if(sum < 0) // a < b
		begin
			temp_result = 1; // must be reg to assign variable
		end 
		else // a >= b
		begin
			temp_result = 0;
		end
	end
	assign result = temp_result; 
	
endmodule
