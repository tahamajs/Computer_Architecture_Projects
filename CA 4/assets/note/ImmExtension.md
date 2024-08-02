# Immediate Extension Module for RISC-V Processor

## Overview

The `ImmediateExtension` module is responsible for generating a 32-bit immediate value from different instruction formats in a RISC-V processor. It supports multiple immediate types, each specified by the instruction format.

## Module Interface

### Inputs

- **immType [2:0]**: The type of immediate value to be generated.
- **instructionData [24:0]**: The instruction data used to generate the immediate value.

### Outputs

- **extendedImmediate [31:0]**: The 32-bit extended immediate value.

## Operation

The `ImmediateExtension` module generates a 32-bit immediate value based on the `immType` input. The instruction data is used to generate different types of immediate values according to the RISC-V instruction formats.

### Immediate Types

- **IMM_TYPE_I** (`3'b000`): I-type immediate value.
- **IMM_TYPE_S** (`3'b001`): S-type immediate value.
- **IMM_TYPE_B** (`3'b010`): B-type immediate value.
- **IMM_TYPE_J** (`3'b011`): J-type immediate value.
- **IMM_TYPE_U** (`3'b100`): U-type immediate value.

### Immediate Value Generation

- **IMM_TYPE_I**: Sign-extended from bits [24:13].
- **IMM_TYPE_S**: Sign-extended from bits [24:18] and [4:0].
- **IMM_TYPE_B**: Sign-extended from bits [24], [0], [23:18], and [4:1] with a final bit set to 0.
- **IMM_TYPE_J**: Sign-extended from bits [24], [12:5], [13], [23:14] with a final bit set to 0.
- **IMM_TYPE_U**: Upper 20 bits are taken from bits [24:5], and the lower 12 bits are set to 0.
