module RegUnit (
    input [31:0] dataIn,
    input enable,
    input reset,
    input clock,
    output reg [31:0] dataOut
);

    always @(posedge clock , posedge reset) begin
        if (reset)
            dataOut <= 32'b0;
        else if (enable)
            dataOut <= dataIn;
    end

endmodule
