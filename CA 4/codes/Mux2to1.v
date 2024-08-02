module Mux2to1(input sel, input [31:0] a, b, output[31:0] out);
	assign out = (sel == 0) ? a : b;
endmodule
