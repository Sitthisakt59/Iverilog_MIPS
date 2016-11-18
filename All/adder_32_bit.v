module half_adder(a,b,sum,cout);
	input a, b;
	output sum, cout;

	assign sum = a ^ b; // cin XOR a XOR b
	assign cout = a & b;
endmodule

module full_adder(a,b,cin,sum,cout);
	input a, b, cin;
	output sum, cout;

	assign sum = cin ^ a ^ b; // cin XOR a XOR b
	assign cout = cin & (a ^ b) | (a & b);
	//~cin & a & b | cin & (a | b); // cin'ab + cin(a + b)
endmodule

module adder_32_bit(a,b,sum,cout);
	input [31:0] a, b;
	output [31:0] sum;
	output cout;
	wire [31:0] carry;
	
	
	half_adder ha(a[0],b[0],sum[0],carry[0]);
	
	genvar i;
	generate for(i=1;i<32;i=i+1)
		begin
			full_adder fa(a[i],b[i],carry[i-1],sum[i],carry[i]);
	end endgenerate
	assign cout = carry[31];
endmodule


