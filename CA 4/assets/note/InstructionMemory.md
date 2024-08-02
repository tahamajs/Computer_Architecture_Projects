
# InstructionMemory Module for Instruction Fetch

## Overview

The `InstructionMemory` module implements a memory that stores instructions and allows fetching instructions based on an address.

## Module Interface

### Inputs

- **address [31:0]**: The 32-bit address for fetching the instruction.

### Outputs

- **readData [31:0]**: The 32-bit instruction fetched from memory.

## Operation

The `InstructionMemory` module reads a 32-bit instruction from memory based on the provided address.

### Memory Initialization

- The memory is initialized using the `$readmemh` function to load instructions from the `instructions.mem` file.

### Address Alignment

- The `alignedAddress` is calculated by aligning the 32-bit address to a 4-byte boundary.

### Instruction Fetch

- The instruction fetch operation is performed by combining four 8-bit memory locations into a 32-bit `readData` output.
