module DataMemory(memAdr, writeData, memWrite, clk, readData);
    parameter N = 32;
    input [31:0] memAdr, writeData;
    input memWrite, clk;

    output [N-1:0] readData;

    reg [7:0] dataMemory [0:$pow(2, 16)-1]; // 64KB

    wire [31:0] adr;
    assign adr = {memAdr[31:2], 2'b00};

    initial $readmemb("data.mem", dataMemory, 1000); 

    always @(posedge clk) begin
        if(memWrite)
            {dataMemory[adr + 3], dataMemory[adr + 2], 
                dataMemory[adr + 1], dataMemory[adr]} <= writeData;
    end

    assign readData = {dataMemory[adr + 3], dataMemory[adr + 2], 
                        dataMemory[adr + 1], dataMemory[adr]};

endmodule
