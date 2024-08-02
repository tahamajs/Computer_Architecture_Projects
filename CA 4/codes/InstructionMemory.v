module InstructionMemory(input [31:0] address, output [31:0] readData);
    reg [7:0] memory [0:$pow(2, 16)-1]; 

    wire [31:0] alignedAddress;
    assign alignedAddress = {address[31:2], 2'b00}; 

    initial $readmemh("instructions.mem", memory);
    assign readData = {memory[alignedAddress + 3], memory[alignedAddress + 2], memory[alignedAddress + 1], memory[alignedAddress]};
endmodule
