module Mux2to1 (
    input select,
    input [31:0] inputA,
    input [31:0] inputB,
    output [31:0] outputW
);

    assign outputW = select ? inputB : inputA;

endmodule
