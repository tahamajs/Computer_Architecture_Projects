module RegisterFile(A1, A2, A3, WD, WE, clk ,RD1, RD2);
    input [4:0] A1, A2, A3;
    input [31:0] WD;
    input WE, clk;
    output [31:0] RD1, RD2;
    reg [31:0] regFile [0:31];

    assign RD1 = regFile[A1];
    assign RD2 = regFile[A2];
    assign regFile[0] = 32'b0000000000000000000000000000000;

    always @(posedge clk ) begin
        if (WE)
            if (A3 != {5{1'b0}}) 
                regFile[A3] <= WD;
    end
endmodule