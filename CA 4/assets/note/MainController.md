# Main Controller Module for RISC-V Processor

## Overview

The `MainController` module generates control signals for the RISC-V processor based on the opcode (`op`) and function (`func3`) fields of the instruction. It produces various control signals required for different stages of instruction execution.

## Module Interface

### Inputs

- **op [6:0]**: The opcode field from the instruction.
- **func3 [2:0]**: The func3 field from the instruction.

### Outputs

- **regWriteD**: Register write enable signal.
- **memWriteD**: Memory write enable signal.
- **ALUSrcD**: ALU source select signal.
- **luiD**: Load upper immediate signal.
- **resultSrcD [1:0]**: Result source select signal.
- **jumpD [1:0]**: Jump control signal.
- **ALUOp [1:0]**: ALU operation control signal.
- **branchD [2:0]**: Branch control signal.
- **immSrcD [2:0]**: Immediate source control signal.

## Operation

The `MainController` generates control signals based on the instruction's opcode and func3 fields. These control signals are used to guide the execution of the instruction through various stages.

### Control Signal Generation

- **R_TYPE** (`7'b0110011`): R-type instructions

  - `ALUOp` set to `2'b10`
  - `regWriteD` set to `1'b1`
- **I_TYPE** (`7'b0010011`): I-type instructions

  - `ALUOp` set to `2'b11`
  - `regWriteD` set to `1'b1`
  - `immSrcD` set to `3'b000`
  - `ALUSrcD` set to `1'b1`
  - `resultSrcD` set to `2'b00`
- **S_TYPE** (`7'b0100011`): S-type instructions

  - `ALUOp` set to `2'b00`
  - `memWriteD` set to `1'b1`
  - `immSrcD` set to `3'b001`
  - `ALUSrcD` set to `1'b1`
- **B_TYPE** (`7'b1100011`): B-type instructions

  - `ALUOp` set to `2'b01`
  - `immSrcD` set to `3'b010`
  - `branchD` set based on `func3`
- **U_TYPE** (`7'b0110111`): U-type instructions

  - `resultSrcD` set to `2'b11`
  - `immSrcD` set to `3'b100`
  - `regWriteD` set to `1'b1`
  - `luiD` set to `1'b1`
- **J_TYPE** (`7'b1101111`): J-type instructions

  - `resultSrcD` set to `2'b10`
  - `immSrcD` set to `3'b011`
  - `jumpD` set to `2'b01`
  - `regWriteD` set to `1'b1`
- **LW_TYPE** (`7'b0000011`): Load word instructions

  - `ALUOp` set to `2'b00`
  - `regWriteD` set to `1'b1`
  - `immSrcD` set to `3'b000`
  - `ALUSrcD` set to `1'b1`
  - `resultSrcD` set to `2'b01`
- **JALR_TYPE** (`7'b1100111`): JALR instructions

  - `ALUOp` set to `2'b00`
  - `regWriteD` set to `1'b1`
  - `immSrcD` set to `3'b000`
  - `ALUSrcD` set to `1'b1`
  - `jumpD` set to `2'b10`
  - `resultSrcD` set to `2'b10`
- **default**: Default control signals

  - `regWriteD` set to `1'b0`
  - `ALUSrcD` set to `1'b0`
  - `ALUOp` set to `2'b00`
