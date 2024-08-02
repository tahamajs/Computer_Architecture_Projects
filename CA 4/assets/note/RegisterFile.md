# Register File Module

## Overview

The `RegisterFile` module is a multi-port memory structure used to store and access register values in a RISC-V processor. It supports simultaneous reads and a single write per clock cycle.

## Module Interface

### Inputs

- **clk**: The clock signal.
- **regWrite**: The register write enable signal.
- **readRegister1 [`BITS(WordCount)-1:0]**: The address of the first register to read.
- **readRegister2 [`BITS(WordCount)-1:0]**: The address of the second register to read.
- **writeRegister [`BITS(WordCount)-1:0]**: The address of the register to write.
- **writeData [WordLen-1:0]**: The data to write to the register.

### Outputs

- **readData1 [WordLen-1:0]**: The data read from the first register.
- **readData2 [WordLen-1:0]**: The data read from the second register.

### Parameters

- **WordLen**: The bit-width of each register. Default is 32.
- **WordCount**: The number of registers. Default is 32.

## Operation

The `RegisterFile` module reads data from two registers and writes data to one register. Register 0 is hardwired to 0. Writes occur on the negative edge of the clock if the `regWrite` signal is enabled. Reads also occur on the negative edge of the clock.
