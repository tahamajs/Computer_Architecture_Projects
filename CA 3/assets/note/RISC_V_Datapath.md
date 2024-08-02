

# RISC-V Datapath for Multi-Cycle Processor

## Overview

The `RISC_V_Datapath` module implements the datapath for a multi-cycle RISC-V processor. It integrates various components such as registers, multiplexers, an ALU, an immediate extension unit, and memory to execute RISC-V instructions.

## Module Interface

### Inputs

- **clk**: The clock signal for synchronizing the datapath operations.
- **reset**: The reset signal for initializing the datapath.
- **PCWrite**: A control signal to enable writing to the program counter.
- **addrSrc**: A control signal to select the source of the address.
- **memWrite**: A control signal to enable memory write operations.
- **IRWrite**: A control signal to enable writing to the instruction register.
- **regWrite**: A control signal to enable writing to the register file.
- **resultSrc [1:0]**: A control signal to select the source of the result.
- **ALUSrcA [1:0]**: A control signal to select the first ALU operand source.
- **ALUSrcB [1:0]**: A control signal to select the second ALU operand source.
- **ALUControl [2:0]**: A control signal to specify the ALU operation.
- **immSrc [2:0]**: A control signal to specify the immediate value source.

### Outputs

- **opcode [6:0]**: The opcode from the instruction.
- **func3 [2:0]**: The func3 field from the instruction.
- **func7**: The func7 field from the instruction.
- **zero**: A flag indicating if the ALU result is zero.
- **neg**: A flag indicating if the ALU result is negative.

## Components

### Registers

- **PCReg**: Program counter register.
- **OldPCReg**: Register to store the old program counter value.
- **IRReg**: Instruction register.
- **MDRReg**: Memory data register.
- **AReg**: Register to store the value read from the first source register.
- **BReg**: Register to store the value read from the second source register.
- **ALUOutReg**: Register to store the ALU output.

### Multiplexers

- **AddrMux**: 2-to-1 multiplexer to select the address source.
- **AMux**: 4-to-1 multiplexer to select the first ALU operand source.
- **BMux**: 4-to-1 multiplexer to select the second ALU operand source.
- **ResultMux**: 4-to-1 multiplexer to select the result source.

### ALU

- **aluInstance**: The Arithmetic Logic Unit (ALU) to perform arithmetic and logic operations.

### Immediate Extension

- **immExtUnit**: The immediate extension unit to generate immediate values from the instruction.

### Memory

- **dataMemory**: The data memory unit to handle memory read and write operations.

### Register File

- **regFile**: The register file to store and read register values.

## Example

Here is an example instantiation of the `RISC_V_Datapath` module:

```verilog
module RISC_V_Datapath_example;
    reg clk;
    reg reset;
    reg PCWrite;
    reg addrSrc;
    reg memWrite;
    reg IRWrite;
    reg regWrite;
    reg [1:0] resultSrc;
    reg [1:0] ALUSrcA;
    reg [1:0] ALUSrcB;
    reg [2:0] ALUControl;
    reg [2:0] immSrc;
    wire [6:0] opcode;
    wire [2:0] func3;
    wire func7;
    wire zero;
    wire neg;

    // Instantiate the RISC-V Datapath
    RISC_V_Datapath datapath (
        .clk(clk),
        .reset(reset),
        .PCWrite(PCWrite),
        .addrSrc(addrSrc),
        .memWrite(memWrite),
        .IRWrite(IRWrite),
        .regWrite(regWrite),
        .resultSrc(resultSrc),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .ALUControl(ALUControl),
        .immSrc(immSrc),
        .opcode(opcode),
        .func3(func3),
        .func7(func7),
        .zero(zero),
        .neg(neg)
    );

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        PCWrite = 0;
        addrSrc = 0;
        memWrite = 0;
        IRWrite = 0;
        regWrite = 0;
        resultSrc = 2'b00;
        ALUSrcA = 2'b00;
        ALUSrcB = 2'b00;
        ALUControl = 3'b000;
        immSrc = 3'b000;

        // Reset the datapath
        #10 reset = 0;
        #10 clk = 1; #10 clk = 0;

        // Simulate an instruction execution
        PCWrite = 1;
        #10 clk = 1; #10 clk = 0;
        $display("PC: %h", datapath.PC); // Check the program counter
    end
endmodule
```
