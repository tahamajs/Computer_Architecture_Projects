`define IMM_I_TYPE 3'b000
`define IMM_S_TYPE 3'b001
`define IMM_B_TYPE 3'b010
`define IMM_J_TYPE 3'b011
`define IMM_U_TYPE 3'b100

module ImmediateExtension(input [2:0] immSrcType,input [24:0] instructionData,output reg [31:0] extendedImm);
    always @(*) begin
        case(immSrcType)
            `IMM_I_TYPE : extendedImm = {{20{instructionData[24]}}, instructionData[24:13]};  
            `IMM_S_TYPE : extendedImm = {{20{instructionData[24]}}, instructionData[24:18], instructionData[4:0]};
            `IMM_J_TYPE : extendedImm = {{12{instructionData[24]}}, instructionData[12:5], instructionData[13], instructionData[23:14], 1'b0};
            `IMM_B_TYPE : extendedImm = {{20{instructionData[24]}}, instructionData[0], instructionData[23:18], instructionData[4:1], 1'b0};
            `IMM_U_TYPE : extendedImm = {instructionData[24:5], 12'b0};
            default     : extendedImm = 32'b0; 
        endcase
    end

endmodule
