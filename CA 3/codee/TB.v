module Testbench();
    reg clk, reset;
    RISC_V processor (.clk(clk), .reset(reset));

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        reset = 1'b1;

        #60 reset = 1'b0;

        #3500 $stop;
    end
    
endmodule
