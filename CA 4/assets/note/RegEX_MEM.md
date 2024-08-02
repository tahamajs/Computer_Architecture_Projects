# Register EX/MEM Module for Pipelined Processor

## Overview

The `RegEX_MEM` module is a pipeline register that holds the state between the Execute (EX) and Memory (MEM) stages of a pipelined processor. It stores intermediate values and control signals to be used in the MEM stage.

## Module Interface

### Inputs

- **clk**: The clock signal.
- **rst**: The reset signal.
- **regWriteE**: Register write enable signal from the EX stage.
- **memWriteE**: Memory write enable signal from the EX stage.
- **luiE**: Load upper immediate signal from the EX stage.
- **resultSrcE [1:0]**: Result source control signal from the EX stage.
- **RdE [4:0]**: Destination register address from the EX stage.
- **ALUResultE [31:0]**: ALU result from the EX stage.
- **writeDataE [31:0]**: Data to be written to memory from the EX stage.
- **PCPlus4E [31:0]**: PC + 4 value from the EX stage.
- **extImmE [31:0]**: Extended immediate value from the EX stage.

### Outputs

- **regWriteM**: Register write enable signal for the MEM stage.
- **memWriteM**: Memory write enable signal for the MEM stage.
- **luiM**: Load upper immediate signal for the MEM stage.
- **resultSrcM [1:0]**: Result source control signal for the MEM stage.
- **RdM [4:0]**: Destination register address for the MEM stage.
- **ALUResultM [31:0]**: ALU result for the MEM stage.
- **writeDataM [31:0]**: Data to be written to memory for the MEM stage.
- **PCPlus4M [31:0]**: PC + 4 value for the MEM stage.
- **extImmM [31:0]**: Extended immediate value for the MEM stage.

## Operation

The `RegEX_MEM` module captures the values of the input signals on the rising edge of the clock or when the reset signal is asserted. When the reset signal is high, all outputs are cleared to their default values. On the rising edge of the clock, the values from the EX stage are transferred to the corresponding MEM stage signals.
