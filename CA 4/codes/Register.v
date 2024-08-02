module Register #(parameter N = 32) (
    input clk, en, sclr,
    input [N-1:0] d,
    output reg [N-1:0] q = {N{1'b0}}
);
    always @(posedge clk) begin
        if (sclr)
            q <= {N{1'b0}};
        else if (en)
            q <= d;
    end
endmodule
