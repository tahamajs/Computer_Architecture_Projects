module RegisterFile(input clk, we, input [4:0] A1, A2, A3, input[31:0] WD3, output[31:0] RD1, RD2);
	reg[31:0] regFile [0:31];
	initial begin
		regFile[0] = 32'b0;
	end
	assign RD1 = regFile[A1];
	assign RD2 = regFile[A2];
	always@(negedge clk)begin 
		if(we == 1 && A3 != 32'b0)
			regFile[A3] <= WD3;
		else
			regFile[A3] <= regFile[A3];
	end
endmodule