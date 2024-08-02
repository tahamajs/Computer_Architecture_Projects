module Adder (a, b, res);
	input signed [31:0] a, b;
	output signed [31:0] res;
	assign res = a + b;
endmodule