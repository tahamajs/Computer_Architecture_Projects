module Mux2To1(a0, a1, sel, out);
    input [31:0] a0, a1;
    input sel;
    output [31:0] out;
    assign out = sel ? a1 : a0;
endmodule