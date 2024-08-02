`define OP_ADD 3'b000
`define OP_SUB 3'b001
`define OP_AND 3'b010
`define OP_OR  3'b011
`define OP_SLT 3'b101
`define OP_XOR 3'b100
`define OP_SLTU 3'b110

module ArithmeticLogicUnit(operation_code, operand_a, operand_b, is_zero, is_negative, result , operand_a_unsign, operand_b_unsign);
    parameter WIDTH = 32;

    inout [WIDTH-1:0] operand_a_unsign, operand_b_unsign;

    input [2:0] operation_code;
    input signed [WIDTH-1:0] operand_a, operand_b;
    
    output is_zero, is_negative;
    output reg signed [WIDTH-1:0] result;
    
    always @(operation_code or operand_a or operand_b) begin
        case (operation_code)
            `OP_ADD   :  result = operand_a + operand_b;
            `OP_SUB   :  result = operand_a - operand_b;
            `OP_AND   :  result = operand_a & operand_b;
            `OP_OR    :  result = operand_a | operand_b;
            `OP_SLT   :  result = (operand_a < operand_b) ? 32'd1 : 32'd0;
            `OP_XOR   :  result = operand_a ^ operand_b;
            `OP_SLTU  :  result = (operand_a_unsign < operand_b_unsign) ? 32'd1 : 32'd0;
            default:  result = {WIDTH{1'bz}};
        endcase
    end

    assign is_zero = (~|result);
    assign is_negative = result[WIDTH-1];

endmodule
