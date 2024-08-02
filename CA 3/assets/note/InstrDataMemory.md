# Instruction and Data Memory for Multi-Cycle RISC-V Processor

## Overview

This module implements an instruction and data memory unit for a multi-cycle RISC-V processor. The memory unit handles 32-bit read and write operations based on the provided address and control signals.

## Module Interface

### Inputs

- **address [31:0]**: The memory address for read/write operations.
- **writeData [31:0]**: The data to be written to memory during a write operation.
- **writeEnable**: A signal indicating whether a write operation should be performed.
- **clock**: The clock signal for synchronizing memory operations.

### Outputs

- **readData [31:0]**: The data read from memory.

## Memory Organization

The memory is organized as an array of 8-bit bytes. The module supports 32-bit read and write operations with addresses aligned to 4-byte boundaries.

## Operation

### Write Operation

When the `writeEnable` signal is high, the 32-bit `writeData` is written to the memory location specified by the `address`. The address is aligned to a 4-byte boundary by zeroing the least significant two bits.

### Read Operation

The 32-bit data is read from the memory location specified by the `address`, aligned to a 4-byte boundary. The data is assembled from four consecutive 8-bit memory locations.

### Initial Memory Contents

The memory contents are initialized from a file named `memory_init.mem` using the `$readmemb` system task.
