# ControlUnit Module for RISC-V Control Logic

## Overview

The `ControlUnit` module decodes the instruction opcode and function fields to generate control signals for the RISC-V processor.

## Module Interface

### Inputs

- **function3 [2:0]**: The 3-bit function field.
- **function7 [6:0]**: The 7-bit function field.
- **opcode [6:0]**: The 7-bit opcode field.

### Outputs

- **memWrite**: Control signal to enable memory write.
- **aluSrc**: Control signal to select the ALU source.
- **regWrite**: Control signal to enable register write.
- **jump**: Control signal for jump instructions.
- **branch**: Control signal for branch instructions.
- **jalr**: Control signal for JALR instructions.
- **resultSrc [1:0]**: Control signal to select the result source.
- **aluControl [2:0]**: Control signal to select the ALU operation.
- **immSrc [2:0]**: Control signal to select the immediate source.

## Operation

The `ControlUnit` module generates control signals based on the input opcode and function fields to control the execution of instructions in the RISC-V processor.

- **R_TYPE (7'b0110011)**: Generates control signals for R-type instructions.

  - **ADD (10'b0000000000)**: ALU performs addition.
  - **SUB (10'b0100000000)**: ALU performs subtraction.
  - **AND (10'b0000000111)**: ALU performs bitwise AND.
  - **OR (10'b0000000110)**: ALU performs bitwise OR.
  - **SLT (10'b0000000010)**: ALU performs set on less than (signed).
  - **SLTU (10'b0000000011)**: ALU performs set on less than (unsigned).
- **LW (7'b0000011)**: Generates control signals for load word instructions.
- **I_TYPE (7'b0010011)**: Generates control signals for I-type instructions.

  - **ADDI (3'b000)**: ALU performs addition with immediate.
  - **XORI (3'b100)**: ALU performs bitwise XOR with immediate.
  - **ORI (3'b110)**: ALU performs bitwise OR with immediate.
  - **SLTI (3'b010)**: ALU performs set on less than immediate (signed).
  - **SLTIU (3'b011)**: ALU performs set on less than immediate (unsigned).
- **JALR (7'b1100111)**: Generates control signals for JALR instructions.
- **S_TYPE (7'b0100011)**: Generates control signals for store instructions.
- **J_TYPE (7'b1101111)**: Generates control signals for jump instructions.
- **B_TYPE (7'b1100011)**: Generates control signals for branch instructions.

  - **BEQ (3'b000)**: ALU performs branch if equal.
  - **BNE (3'b001)**: ALU performs branch if not equal.
  - **BLT (3'b100)**: ALU performs branch if less than.
  - **BGE (3'b101)**: ALU performs branch if greater than or equal.
- **U_TYPE (7'b0110111)**: Generates control signals for upper immediate instructions.
