module Mux3To1(a0, a1, a2, sel, out);
    input [31:0] a0, a1, a2;
    input [1:0] sel;
    output [31:0] out;
    assign out = (sel == 2'b01) ? a1 : (sel == 2'b10)? a0 : a2;
endmodule