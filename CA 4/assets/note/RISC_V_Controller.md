# RISC-V Controller Module

## Overview

The `RISC_V_Controller` module is responsible for generating control signals required for executing instructions in a RISC-V processor. It integrates the `MainController` and `ALU_Controller` to decode instructions and generate the appropriate control signals.

## Module Interface

### Inputs

- **clk**: The clock signal.
- **rst**: The reset signal.
- **op [6:0]**: The opcode field from the instruction.
- **func3 [2:0]**: The func3 field from the instruction.
- **func7**: The func7 field from the instruction.

### Outputs

- **ALUSrcD**: ALU source select signal.
- **memWriteD**: Memory write enable signal.
- **regWriteD**: Register write enable signal.
- **luiD**: Load upper immediate signal.
- **resultSrcD [1:0]**: Result source control signal.
- **jumpD [1:0]**: Jump control signal.
- **ALUControlD [2:0]**: ALU control signal.
- **immSrcD [2:0]**: Immediate source control signal.
- **branchD [2:0]**: Branch control signal.

## Operation

The `RISC_V_Controller` module integrates the `MainController` and `ALU_Controller` to decode the instruction and generate the necessary control signals for instruction execution.

### MainController

The `MainController` generates high-level control signals based on the opcode and func3 fields of the instruction. These control signals are used to determine the type of instruction and control the flow of data.

### ALU_Controller

The `ALU_Controller` generates specific control signals for the ALU based on the func3 and func7 fields of the instruction. It uses the ALUOp signal from the `MainController` to determine the ALU operation.
