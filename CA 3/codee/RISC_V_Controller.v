module RISC_V_Controller (
    input wire clk,
    input wire reset,
    input wire [6:0] opcode,
    input wire [2:0] func3,
    input wire func7,
    input wire zero,
    input wire negative,
    output wire PCWrite,
    output wire addrSrc,
    output wire memWrite,
    output wire IRWrite,
    output wire regWrite,
    output wire [1:0] resultSrc,
    output wire [1:0] ALUSrcA,
    output wire [1:0] ALUSrcB,
    output wire [2:0] ALUControl,
    output wire [2:0] immSrc
);

    wire PCUpdate, branchTaken, branchCondition;
    wire [1:0] ALUOp;

    MainController mainCtrl (.clk(clk),.rst(reset),.op(opcode),.zero(zero),.neg(negative),.PCUpdate(PCUpdate),.adrSrc(addrSrc),.memWrite(memWrite),.branch(branchTaken),.resultSrc(resultSrc),.ALUSrcA(ALUSrcA),.ALUSrcB(ALUSrcB),.immSrc(immSrc),.regWrite(regWrite),.IRWrite(IRWrite),.ALUOp(ALUOp));

    ALU_Controller aluCtrl (.func3(func3),.func7(func7),.ALUOp(ALUOp),.ALUControl(ALUControl));
    BranchController branchCtrl (.func3_code(func3),.branch_en(branchTaken),.is_neg(negative),.is_zero(zero),.branch_taken(branchCondition));
    assign PCWrite = (PCUpdate | branchCondition);

endmodule
