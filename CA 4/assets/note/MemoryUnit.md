# MemoryUnit Module for 32-bit Data Memory

## Overview

The `MemoryUnit` module implements a 32-bit data memory with read and write capabilities, using a byte-addressable memory array.

## Module Interface

### Inputs

- **clk**: Clock signal.
- **we**: Write enable signal.
- **address [31:0]**: The 32-bit address for memory access.
- **writeData [31:0]**: The 32-bit data to be written to memory.

### Outputs

- **readData [31:0]**: The 32-bit data read from memory.

## Operation

The `MemoryUnit` module performs memory read and write operations based on the input signals.

### Memory Initialization

- The memory is initialized using the `$readmemb` function to load data from the `data.mem` file.

### Memory Read

- The memory read operation is performed by combining four 8-bit memory locations into a 32-bit `readData` output.
- The `alignedAddress` is calculated by aligning the 32-bit address to a 4-byte boundary.

### Memory Write

- The memory write operation occurs on the positive edge of the clock (`posedge clk`) when the write enable (`we`) signal is asserted.
- Four 8-bit memory locations are combined to store the 32-bit `writeData` input.

### Example Usage

Below is an example of how the `MemoryUnit` module can be instantiated and used in a higher-level Verilog module.

```verilog
module TopModule;
    reg clk;
    reg we;
    reg [31:0] address;
    reg [31:0] writeData;
    wire [31:0] readData;

    // Instantiate the MemoryUnit
    MemoryUnit memory_instance(.clk(clk), .we(we), .address(address), .writeData(writeData), .readData(readData));

    initial begin
        // Initialize signals
        clk = 0;
        we = 0;
        address = 32'h00000000;
        writeData = 32'h12345678;

        // Toggle clock and perform write operation
        #10 clk = 1; we = 1;
        #10 clk = 0; we = 0;

        // Toggle clock and perform read operation
        #10 clk = 1;
        #10 clk = 0;

        $display("Read Data: %h", readData);
    end
endmodule
```
