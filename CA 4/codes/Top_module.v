module TopLevelPipe(input clk);
	wire MemWriteD, ALUSrcD, RegWriteD, JumpD, BranchD, JalrD, RegWriteM, RegWriteW, JalrE, JumpE, BranchE, ZeroE, ALUResult0, StallF, StallD, FlushD, FlushE;
	wire[1:0] ResultSrcD, ResultSrcE, PCSrcE, ForwardAE, ForwardBE, ResultSrcM, ResultSrcW;
	wire[2:0] func3D, func3E, ALUControlD, ImmSrcD;
	wire[4:0] Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW;
	wire[6:0] func7, op;
	ControlUnit	CTRL(func3D, func7, op, MemWriteD, ALUSrcD, RegWriteD, JumpD, BranchD, JalrD, ResultSrcD, ALUControlD, ImmSrcD);
	HazardUnit	HU(RegWriteM, RegWriteW, ResultSrcE, PCSrcE, ResultSrcM, ResultSrcW, Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW, StallF, StallD, FlushD, FlushE, ForwardAE, ForwardBE);
	ControlDecoder		DC(JalrE, JumpE, BranchE, ZeroE, ALUResult0, func3E, PCSrcE);
	DataPath	DP(clk, MemWriteD, ALUSrcD, RegWriteD, JumpD, BranchD, JalrD, StallF, StallD, FlushD, FlushE, 
		ResultSrcD, ForwardAE, ForwardBE, PCSrcE, ALUControlD, ImmSrcD, BranchE, JumpE, JalrE, ZeroE, ALUResult0, RegWriteM, RegWriteW, 
		ResultSrcE, func3D, func3E, func7, op, Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW, ResultSrcM, ResultSrcW);
endmodule