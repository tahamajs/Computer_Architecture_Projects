# RISC-V Processor Top Module

## Overview

The `RISC_V` module is the top-level module for a RISC-V processor. It integrates the controller and datapath to form a complete RISC-V processor capable of executing instructions.

## Module Interface

### Inputs

- **clk**: The clock signal.
- **rst**: The reset signal.

### Internal Wires

- **ALUSrcD**: ALU source select signal.
- **memWriteD**: Memory write enable signal.
- **regWriteD**: Register write enable signal.
- **luiD**: Load upper immediate signal.
- **func7**: Function 7 field from the instruction.
- **resultSrcD [1:0]**: Result source control signal.
- **jumpD [1:0]**: Jump control signal.
- **immSrcD [2:0]**: Immediate source control signal.
- **branchD [2:0]**: Branch control signal.
- **func3 [2:0]**: Function 3 field from the instruction.
- **ALUControlD [2:0]**: ALU control signal.
- **op [6:0]**: Opcode field from the instruction.

## Operation

The `RISC_V` module instantiates the `RISC_V_Controller` and `RISC_V_Datapath` modules. The controller generates control signals based on the opcode and function fields of the instruction, while the datapath executes the instruction using these control signals.
