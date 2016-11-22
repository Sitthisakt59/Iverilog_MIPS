`include "adder_32_bit.v"
module inverter(i,o);
	input i;
	output o;
	assign o = !i;
endmodule

module subtract_32_bit(a,b,sum,cout);
	input signed [31:0] a, b;
	output signed [31:0] sum;
	output cout;
	wire [31:0] temp_invert;
	wire cin;
	genvar i;
	
	// invert b and store to temp_invert
	generate for(i=0;i<32;i=i+1)
		begin
			inverter inv(b[i],temp_invert[i]);
	end endgenerate
	
	assign cin = 1'b1;
	// add a and b 
	adder_32_bit add2(a,temp_invert,cin,sum,cout);
endmodule
