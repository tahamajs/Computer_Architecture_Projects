`timescale 1ns/1ns
module RISC_V_TB();
    reg clk = 1'b0 , rst=1'b0;

    RISC_V risc(clk , rst);

    always #1 clk = ~clk;
	initial begin
		#2 rst = 1'b1;
		#2 rst = 1'b0;
		#1000
    $stop;
	end
endmodule