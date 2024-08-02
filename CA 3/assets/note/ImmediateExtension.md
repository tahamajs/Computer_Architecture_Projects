# Immediate Extension for Multi-Cycle RISC-V Processor

## Overview

This module implements an Immediate Extension unit for a multi-cycle RISC-V processor. The Immediate Extension unit generates a 32-bit immediate value based on the instruction's immediate type and the provided data. It supports various instruction formats, including I-Type, S-Type, B-Type, J-Type, and U-Type.

## Supported Immediate Types

The Immediate Extension unit supports the following immediate types, defined by 3-bit codes:

- **I-Type Immediate**: `3'b000`
- **S-Type Immediate**: `3'b001`
- **B-Type Immediate**: `3'b010`
- **J-Type Immediate**: `3'b011`
- **U-Type Immediate**: `3'b100`

## Module Interface

### Inputs

- **immSrcType [2:0]**: A 3-bit code specifying the type of immediate value.
- **instructionData [24:0]**: A 25-bit portion of the instruction containing the immediate value data.

### Outputs

- **extendedImm [31:0]**: A 32-bit extended immediate value.

## Operation

The Immediate Extension unit interprets the `immSrcType` and `instructionData` inputs to generate the appropriate 32-bit immediate value, which is output on the `extendedImm` signal.

### Detailed Description

- **I-Type Immediate**: Sign-extends the bits [24:13] of `instructionData` to 32 bits.
- **S-Type Immediate**: Combines and sign-extends the bits [24:18] and [4:0] of `instructionData` to 32 bits.
- **J-Type Immediate**: Combines and sign-extends the bits [24], [23:14], [13], and [12:5] of `instructionData`, with the least significant bit as 0.
- **B-Type Immediate**: Combines and sign-extends the bits [24], [23:18], [4:1], and [0] of `instructionData`, with the least significant bit as 0.
- **U-Type Immediate**: Combines the bits [24:5] of `instructionData` with 12 zeros at the least significant position.
