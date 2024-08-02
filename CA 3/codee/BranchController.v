`define BEQ_OP 3'b000
`define BNE_OP 3'b001
`define BLT_OP 3'b010
`define BGE_OP 3'b011

module BranchController(
    input [2:0] func3_code,
    input branch_en,
    input is_zero,
    input is_neg,
    output reg branch_taken
);

    always @(*) begin
        case(func3_code)
            `BEQ_OP   : branch_taken = branch_en & is_zero;               // Branch if equal
            `BNE_OP   : branch_taken = branch_en & ~is_zero;              // Branch if not equal
            `BLT_OP   : branch_taken = branch_en & is_neg;                // Branch if less than
            `BGE_OP   : branch_taken = branch_en & (is_zero | ~is_neg);   // Branch if greater or equal
            default   : branch_taken = 1'b0;                              // Default to no branch
        endcase
    end

endmodule
