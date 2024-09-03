module ImmExt(in, ImmSrc, out);
	input [31:7] in;
	input [2:0] ImmSrc;
	output [31:0] out; reg [31:0] out;

	always @(*) begin
		case(ImmSrc)
			3'b000: begin out = {{20{in[31]}} , in[31:20]};end // i-type
			3'b001: out = {{20{in[31]}} , in[31:25] , in[11:7]}; // s-type
			3'b010: out = {{20{in[31]}} , in[7] , in[30:25] , in[11:8] , 1'b0}; // b-type
			3'b011: out = {in[31:12] , {12'b0} }; // u-type
			3'b100: out = {{12{in[31]}} , in[31],in[19:12] , in[20] , in[30:21] , 1'b0}; // j-type
		endcase
	end
endmodule