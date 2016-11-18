module inverter(i,o);
	input i;
	output o;
	assign o = !i;
endmodule

module subtract_32_bit(a,b,sum,cout);
	input [31:0] a, b;
	output [31:0] sum;
	output cout,cout2;
	wire [31:0] carry,temp_invert,temp_add,temp_sum;
	genvar i;
	
	// invert b and store to temp_invert
	generate for(i=0;i<32;i=i+1)
		begin
			inverter inv(b[i],temp_invert[i]);
	end endgenerate
	
	// 2 complement
	assign temp_add = 1;adder_32_bit add1(temp_invert,temp_add,temp_sum,cout2);
	
	// add a and b 
	adder_32_bit add2(a,temp_sum,sum,cout);
endmodule