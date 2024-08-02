# Register File for Multi-Cycle RISC-V Processor

## Overview

This module implements a register file for a multi-cycle RISC-V processor. The register file provides read and write access to 32 general-purpose registers, each 32 bits wide. The x0 register is always zero.

## Module Interface

### Inputs

- **clk**: The clock signal for synchronizing the register file operations.
- **writeEnable**: A signal indicating whether a write operation should be performed.
- **readAddr1 [`ADDR_WIDTH(32)-1:0]**: The address of the first register to read.
- **readAddr2 [`ADDR_WIDTH(32)-1:0]**: The address of the second register to read.
- **writeAddr [`ADDR_WIDTH(32)-1:0]**: The address of the register to write.
- **writeData [31:0]**: The data to be written to the register.

### Outputs

- **readData1 [31:0]**: The data read from the first register.
- **readData2 [31:0]**: The data read from the second register.

## Operation

The register file allows for reading from two registers and writing to one register simultaneously. The write operation is performed on the rising edge of the `clk` signal if `writeEnable` is high and `writeAddr` is not zero. The x0 register is hardwired to zero and cannot be modified.

### Address Width Calculation

The address width is calculated using the `ADDR_WIDTH` macro, which computes the ceiling of the logarithm base 2 of the number of registers. For a 32-register file, the address width is 5 bits.
