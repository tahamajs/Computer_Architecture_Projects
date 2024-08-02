module RISC_V(clk, rst);
	input clk, rst;
	wire MemWrite, ALUSrc, RegWrite, zero, sign;
	wire [1:0] PCSrc, ResultSrc;
	wire [2:0] ImmSrc, ALUControl, func3;
	wire[6:0] opcode, func7;
	Datapath dp(rst, PCSrc, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite, clk, zero, sign, opcode, func3, func7);
	Controller cnt(zero, sign, opcode, func3, func7, PCSrc, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite);
endmodule