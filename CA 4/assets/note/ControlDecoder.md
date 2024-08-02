# ControlDecoder Module for Program Counter Source Selection

## Overview

The `ControlDecoder` module determines the source for the program counter (`pcSource`) based on various control signals and the function code.

## Module Interface

### Inputs

- **jalrFlag**: Flag indicating a JALR (Jump And Link Register) instruction.
- **jumpFlag**: Flag indicating a jump instruction.
- **branchFlag**: Flag indicating a branch instruction.
- **zeroFlag**: Flag indicating the result of an ALU operation is zero.
- **aluResultFlag**: Flag indicating the result of an ALU operation.
- **funcCode [2:0]**: The 3-bit function code from the instruction.

### Outputs

- **pcSource [1:0]**: The source for the program counter, determining the next instruction to be executed.

## Operation

The `ControlDecoder` module sets the `pcSource` output based on the following conditions:

- **jalrFlag**: If `jalrFlag` is set, `pcSource` is set to `2'b10`.
- **jumpFlag**: If `jumpFlag` is set, `pcSource` is set to `2'b01`.
- **Branch Conditions**:
  - **BEQ (Branch if Equal)**: If `branchFlag` is set, `funcCode` is `3'b000`, and `zeroFlag` is set, `pcSource` is set to `2'b01`.
  - **BNE (Branch if Not Equal)**: If `branchFlag` is set, `funcCode` is `3'b001`, and `zeroFlag` is not set, `pcSource` is set to `2'b01`.
  - **BLT (Branch if Less Than)**: If `branchFlag` is set, `funcCode` is `3'b100`, and `aluResultFlag` is set, `pcSource` is set to `2'b01`.
  - **BGE (Branch if Greater Than or Equal)**: If `branchFlag` is set, `funcCode` is `3'b101`, and `aluResultFlag` is not set, `pcSource` is set to `2'b01`.

If none of the above conditions are met, `pcSource` is set to `2'b00`.
