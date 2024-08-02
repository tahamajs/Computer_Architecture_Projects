module Multiplexer4to1 (
    input [1:0] select,
    input [31:0] inputA,
    input [31:0] inputB,
    input [31:0] inputC,
    input [31:0] inputD,
    output reg [31:0] outputW
);
    always @(*) begin
        case (select)
            2'b00  : outputW = inputA;
            2'b01  : outputW = inputB;
            2'b10  : outputW = inputC;
            2'b11  : outputW = inputD;
            default: outputW = 32'bz;
        endcase
    end
endmodule
