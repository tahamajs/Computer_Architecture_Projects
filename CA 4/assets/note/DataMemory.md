# Data Memory Module for 32-bit Data Storage

## Overview

The `DataMemory` module implements a 64KB memory unit for reading and writing 32-bit data. It supports aligned memory access, ensuring correct byte addressing and storage.

## Module Interface

### Inputs

- **address [31:0]**: The memory address for read/write operations.
- **writeData [31:0]**: The 32-bit data to be written to memory.
- **writeEnable**: A signal indicating whether a write operation should be performed.
- **clk**: The clock signal for synchronizing memory operations.

### Outputs

- **readData [31:0]**: The 32-bit data read from memory.

## Memory Organization

The memory is organized as an array of 8-bit bytes, supporting 64KB of data storage. The module ensures 32-bit aligned memory access for read and write operations.

## Operation

### Write Operation

When the `writeEnable` signal is high, the 32-bit `writeData` is written to the memory location specified by the `address`. The address is aligned to a 4-byte boundary by setting the least significant two bits to zero.

### Read Operation

The 32-bit data is read from the memory location specified by the `address`, aligned to a 4-byte boundary. The data is assembled from four consecutive 8-bit memory locations.

### Initial Memory Contents

The memory contents are initialized from a file named `data.mem` using the `$readmemb` system task, starting from address 1000.
