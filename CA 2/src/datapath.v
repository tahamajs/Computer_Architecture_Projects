module Datapath(rst, PCSrc, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite, clk, zero, sign, opcode, func3, func7);
	input clk, rst, MemWrite, ALUSrc, RegWrite;
	input [1:0] PCSrc, ResultSrc;
	input [2:0] ALUControl, ImmSrc;
	output zero, sign;
	output [6:0] opcode; reg [6:0] opcode;
	output [2:0] func3; reg [2:0] func3;
	output [6:0] func7; reg [6:0] func7;

	wire [31:0] PCIn, PCOut, Inst;
	wire[4:0] A1, A2, A3;
	wire [24:0] imm;
	wire [31:0] RD1 , RD2 , Result;
	wire[31:0] immext;
	wire[31:0] ALUResult;
	wire signed[31:0] SrcA , SrcB;
	wire[31:0] PCPlus4, PCTarget;
	wire [31:0] ReadData;

	PC pc(PCIn, clk, rst, PCOut);
	InstMemory instmem(PCOut, Inst);

	assign opcode = Inst[6:0];
	assign func3 = Inst[14:12];
	assign func7 = Inst[31:25];
	assign A1 = Inst[19:15];
	assign A2 = Inst[24:20];
	assign A3 = Inst[11:7];
	assign imm = Inst[31:7];
	assign SrcA = RD1;

	RegisterFile regfile(A1, A2, A3, Result, RegWrite, clk, RD1, RD2);
	Mux2To1 mux21(RD2, immext, ALUSrc, SrcB);
	ALU alu(SrcA, SrcB, ALUControl, zero, sign, ALUResult);
	DataMemory datamem(ALUResult, RD2, MemWrite, clk, ReadData);
	Mux4To1 mux41(ALUResult, ReadData, PCPlus4, immext, ResultSrc, Result);
	Adder pctarget(PCOut, immext, PCTarget);
	Adder pc4(PCOut, 32'b00000000000000000000000000000100, PCPlus4);
	Mux3To1 pcmux31(PCPlus4, PCTarget ,ALUResult ,PCSrc, PCIn);
	ImmExt immextend(imm, ImmSrc, immext);
endmodule