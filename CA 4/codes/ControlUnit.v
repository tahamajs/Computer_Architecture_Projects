`define R_TYPE 7'b0110011
`define I_TYPE 7'b0010011
`define LW 7'b0000011
`define JALR 7'b1100111
`define S_TYPE 7'b0100011
`define J_TYPE 7'b1101111
`define B_TYPE 7'b1100011
`define U_TYPE 7'b0110111
`define ADD 10'b0000000000
`define SUB 10'b0100000000
`define AND 10'b0000000111
`define OR 10'b0000000110
`define SLT 10'b0000000010
`define SLTU 10'b0000000011
`define LW_FUNC 3'b010
`define ADDI 3'b000
`define XORI 3'b100
`define ORI 3'b110
`define SLTI 3'b010
`define JALR_FUNC 3'b000
`define SLTIU 3'b011
`define BEQ 3'b000
`define BNE 3'b001
`define BLT 3'b100
`define BGE 3'b101

module ControlUnit(input [2:0] function3, input [6:0] function7, opcode, output reg memWrite, aluSrc, regWrite, jump, branch, jalr, output reg [1:0] resultSrc, output reg [2:0] aluControl, immSrc);
    wire [9:0] functionn;
    assign functionn = {function7, function3};

    always @(function3, function7, opcode) begin
        {memWrite, aluSrc, regWrite, jump, branch, jalr, resultSrc, aluControl, immSrc} = 14'b00000000000000;

        case (opcode)
            `R_TYPE: begin
                regWrite = 1'b1;
                case (functionn)
                    `ADD: aluControl = 3'b000;
                    `SUB: aluControl = 3'b001;
                    `AND: aluControl = 3'b010;
                    `OR: aluControl = 3'b011;
                    `SLT: aluControl = 3'b101;
                    `SLTU: aluControl = 3'b110;
                endcase
            end

            `LW: {regWrite, resultSrc, aluSrc} = 4'b1011;

            `I_TYPE: begin
                {aluSrc, regWrite} = 2'b11;
                case (function3)
                    // `ADDI:
                    `XORI: aluControl = 3'b100;
                    `ORI: aluControl = 3'b011;
                    `SLTI: aluControl = 3'b101;
                    `SLTIU: aluControl = 3'b110;
                endcase
            end

            `JALR: {jalr, aluSrc, resultSrc, regWrite} = 5'b11101;

            `S_TYPE: {immSrc, aluSrc, memWrite} = 5'b00111;

            `J_TYPE: {resultSrc, immSrc, regWrite, jump} = 7'b1001011;

            `B_TYPE: begin
                {branch, immSrc} = 4'b1011;
                case (function3)
                    `BEQ: aluControl = 3'b001;
                    `BNE: aluControl = 3'b001;
                    `BLT: aluControl = 3'b101;
                    `BGE: aluControl = 3'b101;
                endcase
            end

            `U_TYPE: {resultSrc, immSrc, regWrite} = 6'b111001;
        endcase
    end
endmodule
