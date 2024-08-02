module RISC_V_Datapath (
    input wire clk,
    input wire reset,
    input wire PCWrite,
    input wire addrSrc,
    input wire memWrite,
    input wire IRWrite,
    input wire regWrite,
    input wire [1:0] resultSrc,
    input wire [1:0] ALUSrcA,
    input wire [1:0] ALUSrcB,
    input wire [2:0] ALUControl,
    input wire [2:0] immSrc,
    output wire [6:0] opcode,
    output wire [2:0] func3,
    output wire func7,
    output wire zero,
    output wire neg
);

    wire [31:0] PC, addr, readData, oldPC;
    wire [31:0] immExt, instruction, data;
    wire [31:0] RD1, RD2, A, B, srcA, srcB;
    wire [31:0] ALUResult, ALUOut, result;

    RegUnit PCReg (.dataIn(result),    .enable(PCWrite), .reset(reset), .clock(clk), .dataOut(PC));
    RegUnit OldPCReg (.dataIn(PC),     .enable(IRWrite), .reset(1'b0), .clock(clk), .dataOut(oldPC));
    RegUnit IRReg (.dataIn(readData),  .enable(IRWrite), .reset(1'b0), .clock(clk), .dataOut(instruction));
    RegUnit MDRReg (.dataIn(readData), .enable(1'b1),    .reset(1'b0), .clock(clk), .dataOut(data));
    RegUnit AReg (.dataIn(RD1),        .enable(1'b1),    .reset(1'b0), .clock(clk), .dataOut(A));
    RegUnit BReg (.dataIn(RD2),        .enable(1'b1),    .reset(1'b0), .clock(clk), .dataOut(B));
    RegUnit ALUOutReg (.dataIn(ALUResult), .enable(1'b1), .reset(1'b0), .clock(clk), .dataOut(ALUOut));

    Mux2to1 AddrMux (.select(addrSrc), .inputA(PC), .inputB(result), .outputW(addr));

    Multiplexer4to1 AMux (.select(ALUSrcA), .inputA(PC), .inputB(oldPC), .inputC(A), .inputD(32'd0), .outputW(srcA));
    Multiplexer4to1 BMux (.select(ALUSrcB), .inputA(B), .inputB(immExt), .inputC(32'd4), .inputD(32'd0), .outputW(srcB));
    Multiplexer4to1 ResultMux (.select(resultSrc), .inputA(ALUOut), .inputB(data), .inputC(ALUResult), .inputD(immExt), .outputW(result));

    ImmediateExtension immExtUnit (.immSrcType(immSrc), .instructionData(instruction[31:7]), .extendedImm(immExt));

    ArithmeticLogicUnit aluInstance (.operation_code(ALUControl), .operand_a(srcA), .operand_b(srcB), .is_zero(zero), .is_negative(neg), .result(ALUResult), .operand_a_unsign(srcA), .operand_b_unsign(srcB));

    InstrDataMemory dataMemory (.memAdr(addr), .writeData(B), .clk(clk), .memWrite(memWrite), .readData(readData));

    RegisterFile regFile (
        .clk(clk), 
        .regWrite(regWrite),
        .writeData(result),
        .readData1(RD1), .readData2(RD2),
        .readRegister1(instruction[19:15]), 
        .readRegister2(instruction[24:20]),
        .writeRegister(instruction[11:7])
    );

    assign opcode = instruction[6:0];
    assign func3 = instruction[14:12];
    assign func7 = instruction[30];
endmodule
