module MemoryUnit (input clk, we, input [31:0] address, writeData, output reg [31:0] readData);
    reg [7:0] memory [0:$pow(2, 16)-1];
    wire [31:0] alignedAddress;

    assign alignedAddress = {address[31:2], 2'b00};

    initial $readmemb("data.mem", memory);

    always @(address or alignedAddress) begin
        readData = {memory[alignedAddress + 3], memory[alignedAddress + 2], memory[alignedAddress + 1], memory[alignedAddress]};
    end

    always @(posedge clk) begin 
        if (we)
            {memory[alignedAddress + 3], memory[alignedAddress + 2], memory[alignedAddress + 1], memory[alignedAddress]} <= writeData;
        else
            memory[alignedAddress] <= memory[alignedAddress];
    end
endmodule
