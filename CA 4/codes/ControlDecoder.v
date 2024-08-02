module ControlDecoder(input jalrFlag, jumpFlag, branchFlag, zeroFlag, aluResultFlag, input [2:0] funcCode, output [1:0] pcSource);
    assign pcSource = (jalrFlag) ? 2'b10 :
        ((jumpFlag) ||
        (branchFlag && funcCode == 3'b000 && zeroFlag) || // beq
        (branchFlag && funcCode == 3'b001 && ~zeroFlag) || // bne
        (branchFlag && funcCode == 3'b100 && aluResultFlag) || // blt
        (branchFlag && funcCode == 3'b101 && ~aluResultFlag)) ? 2'b01 : // bge
        2'b00;
endmodule
