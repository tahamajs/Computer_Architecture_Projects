`define S_T   2'b00
`define B_T   2'b01
`define R_T   2'b10
`define I_T   2'b11

`define ADD  3'b000
`define SUB  3'b001
`define AND  3'b010
`define OR   3'b011
`define SLT  3'b101
`define XOR  3'b100
`define SLTU 3'b110

module ALU_Controller(
    input [2:0] func3,
    input [1:0] ALUOp,
    input func7,
    output reg [2:0] ALUControl 
);

    always @(*) begin
        case (ALUOp)
            `S_T: ALUControl = `ADD; 
            `B_T: ALUControl = `SUB; 
            `R_T: begin
                case (func3)
                    3'b000: ALUControl = (func7) ? `SUB : `ADD; 
                    3'b111: ALUControl = `AND; 
                    3'b110: ALUControl = `OR;  
                    3'b010: ALUControl = `SLT; 
                    3'b011: ALUControl = `SLTU; 
                    default: ALUControl = 3'bzzz; 
            endcase
            end
            `I_T: begin
                case (func3)
                    3'b000: ALUControl = `ADD;
                    3'b100: ALUControl = `XOR;
                    3'b110: ALUControl = `OR;
                    3'b010: ALUControl = `SLT; 
                    3'b011: ALUControl = `SLTU;
                    default: ALUControl = 3'bzzz; 
                endcase
            end
            default: ALUControl = `ADD; // Default to ADD
        endcase
    end
endmodule
