module DFlipFlop(input clk, en, sclr, d, output reg q = 1'b0);
    always @(posedge clk) begin
        if (sclr)
            q <= 1'b0;
        else if (en)
            q <= d;
    end
endmodule
