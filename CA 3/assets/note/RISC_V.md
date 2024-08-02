# RISC-V Processor for Multi-Cycle Processor

## Overview

The `RISC_V` module integrates the controller and datapath of a multi-cycle RISC-V processor. This top-level module manages the control flow and data processing for executing RISC-V instructions.

## Module Interface

### Inputs

- **clk**: The clock signal for synchronizing the processor operations.
- **reset**: The reset signal for initializing the processor.

### Internal Wires

- **func3 [2:0]**: The func3 field from the instruction.
- **ALUControl [2:0]**: The control signal for the ALU operations.
- **immSrc [2:0]**: The control signal for the immediate value source.
- **zero**: A flag indicating if the ALU result is zero.
- **negative**: A flag indicating if the ALU result is negative.
- **PCWrite**: A control signal to enable writing to the program counter.
- **addrSrc**: A control signal to select the source of the address.
- **memWrite**: A control signal to enable memory write operations.
- **IRWrite**: A control signal to enable writing to the instruction register.
- **resultSrc [1:0]**: A control signal to select the source of the result.
- **ALUSrcA [1:0]**: A control signal to select the first ALU operand source.
- **ALUSrcB [1:0]**: A control signal to select the second ALU operand source.
- **regWrite**: A control signal to enable writing to the register file.
- **opcode [6:0]**: The opcode from the instruction.
- **func7**: The func7 field from the instruction.

## Components

### RISC_V_Controller

The `RISC_V_Controller` generates the necessary control signals based on the opcode and other instruction fields. It determines the flow of data and operations in the processor.

### RISC_V_Datapath

The `RISC_V_Datapath` handles the data processing and operations for the processor. It includes registers, multiplexers, an ALU, an immediate extension unit, and memory components.
