`define I_TYPE 3'b000			
`define S_TYPE 3'b001
`define J_TYPE 3'b010
`define B_TYPE 3'b011
`define U_TYPE 3'b100

module ImmediateExtend(input [2:0] immSelect, input [31:7] instructionPart, output reg [31:0] extendedImmediate);
    always @(immSelect, instructionPart) begin 
        case(immSelect)
            `I_TYPE: extendedImmediate = {{20{instructionPart[31]}}, instructionPart[31:20]};
            `S_TYPE: extendedImmediate = {{20{instructionPart[31]}}, instructionPart[31:25], instructionPart[11:7]};
            `J_TYPE: extendedImmediate = {{12{instructionPart[31]}}, instructionPart[31], instructionPart[19:12], instructionPart[20], instructionPart[30:21], 1'b0};
            `B_TYPE: extendedImmediate = {{19{instructionPart[31]}}, instructionPart[31], instructionPart[7], instructionPart[30:25], instructionPart[11:8], 1'b0};
            `U_TYPE: extendedImmediate = {instructionPart[31:12], {12{1'b0}}};
            default: extendedImmediate = {32{1'b0}};
        endcase
    end
endmodule
