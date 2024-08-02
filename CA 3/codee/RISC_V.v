module RISC_V (
    input wire clk,
    input wire reset
);

    wire [2:0] func3, ALUControl, immSrc;
    wire zero, negative, PCWrite, addrSrc, memWrite, 
         regWrite, IRWrite;

    wire [1:0] resultSrc, ALUSrcA, ALUSrcB;
    wire [6:0] opcode;

    RISC_V_Controller controlUnit (.clk(clk),.reset(reset),.opcode(opcode),.func3(func3),.func7(func7),.zero(zero),.negative(negative),.PCWrite(PCWrite),.addrSrc(addrSrc),.memWrite(memWrite),.IRWrite(IRWrite),.resultSrc(resultSrc),.ALUControl(ALUControl),.ALUSrcA(ALUSrcA),.ALUSrcB(ALUSrcB),.regWrite(regWrite),.immSrc(immSrc));
    RISC_V_Datapath datapathUnit (.clk(clk),.reset(reset),.PCWrite(PCWrite),.addrSrc(addrSrc),.memWrite(memWrite),.IRWrite(IRWrite),.resultSrc(resultSrc),.ALUControl(ALUControl),.ALUSrcA(ALUSrcA),.ALUSrcB(ALUSrcB),.immSrc(immSrc),.regWrite(regWrite),.opcode(opcode),.func3(func3),.func7(func7),.zero(zero),.neg(negative));

endmodule
