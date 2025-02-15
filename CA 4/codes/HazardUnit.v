module HazardUnit(
    input RegWriteM, RegWriteW,
    input [1:0] ResultSrcE, PCSrcE, ResultSrcM, ResultSrcW,
    input [4:0] Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW,
    output StallF, StallD, FlushD, FlushE,
    output [1:0] ForwardAE, ForwardBE
);
    wire loadStall;

    assign ForwardAE = ((Rs1E == RdM && RegWriteM) && Rs1E != 0) ? 2'b10 :
                      (((Rs1E == RdW && RegWriteW) && Rs1E != 0) || (Rs1E == RdW && ResultSrcW == 2'b11 && Rs1E != 0)) ? 2'b01 :
                      (Rs1E == RdM && ResultSrcM == 2'b11 && Rs1E != 0) ? 2'b11 :
                      2'b00;

    assign ForwardBE = ((Rs2E == RdM && RegWriteM) && Rs2E != 0) ? 2'b10 :
                      (((Rs2E == RdW && RegWriteW) && Rs2E != 0) || (Rs2E == RdW && ResultSrcW == 2'b11 && Rs2E != 0)) ? 2'b01 :
                      (Rs2E == RdM && ResultSrcM == 2'b11 && Rs2E != 0) ? 2'b11 :
                      2'b00;

    assign loadStall = ((Rs1D == RdE) || (Rs2D == RdE)) && ResultSrcE == 2'b01;
    assign StallF = loadStall;
    assign StallD = loadStall;
    assign FlushE = loadStall || (PCSrcE == 2'b01) || (PCSrcE == 2'b10);
    assign FlushD = (PCSrcE == 2'b01) ? 1 : 0;
endmodule
