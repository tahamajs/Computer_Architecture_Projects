# ALU Controller for Multi-Cycle RISC-V Processor

## Overview

This module implements an ALU Controller for a multi-cycle RISC-V processor. The ALU Controller generates the appropriate control signals for the ALU based on the instruction's function codes and the ALU operation type. It supports various instruction formats, including R-Type, I-Type, S-Type, and B-Type.

## Supported Instruction Types

The ALU Controller supports the following instruction types, defined by 2-bit ALU operation codes:

- **Store (S-Type)**: `2'b00`
- **Branch (B-Type)**: `2'b01`
- **Register (R-Type)**: `2'b10`
- **Immediate (I-Type)**: `2'b11`

## Supported ALU Operations

The ALU Controller generates control signals for the following ALU operations, defined by 3-bit codes:

- **Addition (ADD)**: `3'b000`
- **Subtraction (SUB)**: `3'b001`
- **Bitwise AND (AND)**: `3'b010`
- **Bitwise OR (OR)**: `3'b011`
- **Set Less Than (SLT)**: `3'b101`
- **Bitwise XOR (XOR)**: `3'b100`

## Module Interface

### Inputs

- **func3 [2:0]**: A 3-bit function code from the instruction, specifying the specific operation.
- **func7**: A function code bit from the instruction (bit 30), used for distinguishing between similar operations.
- **ALUOp [1:0]**: A 2-bit code specifying the ALU operation type (S-Type, B-Type, R-Type, I-Type).

### Outputs

- **ALUControl [2:0]**: A 3-bit code that controls the operation of the ALU.

## Operation

The ALU Controller interprets the `func3`, `func7`, and `ALUOp` inputs to generate the appropriate `ALUControl` signal, which determines the operation performed by the ALU.

### Detailed Description

- **S-Type (Store)**: The ALU performs an addition (`ADD`) operation.
- **B-Type (Branch)**: The ALU performs a subtraction (`SUB`) operation.
- **R-Type (Register)**: The ALU operation depends on the `func3` and `func7` codes:
  - `func3 == 3'b000 & func7 == 0`: Addition (`ADD`)
  - `func3 == 3'b000 & func7 == 1`: Subtraction (`SUB`)
  - `func3 == 3'b111`: Bitwise AND (`AND`)
  - `func3 == 3'b110`: Bitwise OR (`OR`)
  - `func3 == 3'b010`: Set Less Than (`SLT`)
  - `default`: Invalid operation (`zzz`)
- **I-Type (Immediate)**: The ALU operation depends on the `func3` code:
  - `func3 == 3'b000`: Addition (`ADD`)
  - `func3 == 3'b100`: Bitwise XOR (`XOR`)
  - `func3 == 3'b110`: Bitwise OR (`OR`)
  - `func3 == 3'b010`: Set Less Than (`SLT`)
  - `default`: Invalid operation (`zzz`)
