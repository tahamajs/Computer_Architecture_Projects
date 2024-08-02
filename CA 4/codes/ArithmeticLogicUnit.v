module ArithmeticLogicUnit (input signed [31:0] operandA, operandB, input [2:0] controlSignal, output reg [31:0] result, output zeroFlag);
    always @(operandA, operandB, controlSignal) begin
        case (controlSignal)
            3'b000:  result = operandA + operandB;
            3'b001:  result = operandA - operandB;
            3'b010:  result = operandA & operandB;
            3'b011:  result = operandA | operandB;
            3'b100:  result = operandA ^ operandB;
            3'b101:  result = operandA < operandB ? 1'b1 : 1'b0;
            3'b110:  result = $unsigned(operandA) < $unsigned(operandB) ? 1'b1 : 1'b0;
            default: result = {32{1'b0}};
        endcase
    end
    assign zeroFlag = ~|result;
endmodule
