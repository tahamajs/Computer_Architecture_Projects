`define R_TYPE    7'b0110011
`define I_TYPE    7'b0010011
`define S_TYPE    7'b0100011
`define B_TYPE    7'b1100011
`define U_TYPE    7'b0110111
`define J_TYPE    7'b1101111
`define LW_TYPE   7'b0000011
`define JALR_TYPE 7'b1100111

`define FETCH      5'b00000
`define DECODE     5'b00001
`define EXECUTE1   5'b00010
`define EXECUTE2   5'b00011
`define EXECUTE3   5'b00100
`define EXECUTE4   5'b00101
`define EXECUTE5   5'b00110
`define EXECUTE6   5'b00111
`define EXECUTE7   5'b01000
`define EXECUTE8   5'b01001
`define EXECUTE9   5'b01010
`define MEM_STAGE1 5'b01011
`define MEM_STAGE2 5'b01100
`define MEM_STAGE3 5'b01101
`define MEM_STAGE4 5'b01110
`define MEM_STAGE5 5'b01111
`define MEM_STAGE6 5'b10000
`define WRITEBACK  5'b10001
module MainController(
    input wire clk,
    input wire rst,
    input wire [6:0] op,
    input wire zero,
    input wire neg,
    output reg PCUpdate,
    output reg adrSrc,
    output reg memWrite,
    output reg branch,
    output reg IRWrite,
    output reg [1:0] resultSrc,
    output reg [1:0] ALUSrcA,
    output reg [1:0] ALUSrcB,
    output reg [1:0] ALUOp,
    output reg [2:0] immSrc,
    output reg regWrite
);

    reg [4:0] presentState;
    reg [4:0] nextState = `FETCH;

    always @(presentState or op) begin
        case (presentState)
            `FETCH: nextState = `DECODE;

            `DECODE: nextState = (op == `R_TYPE) ? `EXECUTE2 :
                                 (op == `I_TYPE) ? `EXECUTE1 :
                                 (op == `S_TYPE) ? `EXECUTE6 :
                                 (op == `J_TYPE) ? `EXECUTE4 :
                                 (op == `B_TYPE) ? `EXECUTE3 :
                                 (op == `U_TYPE) ? `MEM_STAGE5 :
                                 (op == `LW_TYPE) ? `EXECUTE9 :
                                 (op == `JALR_TYPE) ? `EXECUTE8 : `FETCH;

            `EXECUTE1: nextState = `MEM_STAGE2;
            `EXECUTE2: nextState = `MEM_STAGE4;
            `EXECUTE3: nextState = `FETCH;
            `EXECUTE4: nextState = `EXECUTE7;
            `EXECUTE5: nextState = `MEM_STAGE2;
            `EXECUTE6: nextState = `MEM_STAGE3;
            `EXECUTE7: nextState = `MEM_STAGE6;
            `EXECUTE8: nextState = `EXECUTE5;
            `EXECUTE9: nextState = `MEM_STAGE1;
            `MEM_STAGE1: nextState = `WRITEBACK;
            `MEM_STAGE2: nextState = `FETCH;
            `MEM_STAGE3: nextState = `FETCH;
            `MEM_STAGE4: nextState = `FETCH;
            `MEM_STAGE5: nextState = `FETCH;
            `MEM_STAGE6: nextState = `FETCH;

            `WRITEBACK: nextState = `FETCH;
        endcase
    end

    always @(presentState , rst) begin
        {resultSrc, memWrite, ALUOp, ALUSrcA, ALUSrcB, immSrc, 
         regWrite, PCUpdate, branch, IRWrite} = 14'b0;

        case (presentState)
            `FETCH: begin
                IRWrite = 1'b1;
                ALUSrcA = 2'b00;
                ALUSrcB = 2'b10;
                ALUOp = 2'b00;
                resultSrc = 2'b10;
                PCUpdate = 1'b1;
                adrSrc = 1'b0;
            end
        
            `DECODE: begin
                ALUSrcA = 2'b01;
                ALUSrcB = 2'b01;
                ALUOp = 2'b00;
                immSrc = 3'b010;
            end
        
            `EXECUTE1: begin 
                ALUSrcA = 2'b10;
                ALUSrcB = 2'b01;
                immSrc = 3'b000;
                ALUOp = 2'b11;
            end

            `EXECUTE2: begin
                ALUSrcA = 2'b10;
                ALUSrcB = 2'b00;
                ALUOp = 2'b10;
            end
        
            `EXECUTE3: begin
                ALUSrcA = 2'b10;
                ALUSrcB = 2'b00;
                ALUOp = 2'b01;
                resultSrc = 2'b0;
                branch = 1'b1;
            end
        
            `EXECUTE4: begin
                ALUSrcA = 2'b01;
                ALUSrcB = 2'b10;
                ALUOp = 2'b00;
            end
        
            `EXECUTE5: begin
                ALUSrcA = 2'b01;
                ALUSrcB = 2'b10;
                ALUOp = 2'b00;
                resultSrc = 2'b00;
                PCUpdate = 1'b1;
            end
        
            `EXECUTE6: begin
                ALUSrcA = 2'b10;
                ALUSrcB = 2'b01;
                ALUOp = 2'b00;
                immSrc = 3'b001;
            end
        
            `EXECUTE7: begin
                regWrite = 1'b1;
                ALUSrcA = 2'b01;
                ALUSrcB = 2'b01;
                immSrc = 3'b011;
                ALUOp = 2'b00;
            end

            `EXECUTE8: begin 
                ALUSrcA = 2'b10;
                ALUSrcB = 2'b01;
                immSrc = 3'b000;
                ALUOp = 2'b00;
            end

            `EXECUTE9: begin 
                ALUSrcA = 2'b10;
                ALUSrcB = 2'b01;
                immSrc = 3'b000;
                ALUOp = 2'b00;
            end

            `MEM_STAGE1: begin
                resultSrc = 2'b00;
                adrSrc = 1'b1;
            end
        
            `MEM_STAGE2: begin
                resultSrc = 2'b00;
                regWrite = 1'b1;
            end
        
            `MEM_STAGE3: begin
                resultSrc = 2'b00;
                adrSrc = 1'b1;
                memWrite = 1'b1;
            end
        
            `MEM_STAGE4: begin
                resultSrc = 2'b00;
                regWrite = 1'b1;
            end
        
            `MEM_STAGE5: begin
                resultSrc = 2'b11;
                immSrc = 3'b100;
                regWrite = 1'b1;
            end
        
            `MEM_STAGE6: begin
                resultSrc = 2'b00;
                PCUpdate = 1'b1;
            end
        
            `WRITEBACK: begin
                resultSrc = 2'b01;
                regWrite = 1'b1;
            end
        
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            presentState <= `FETCH;
        else
            presentState <= nextState;
    end

endmodule
