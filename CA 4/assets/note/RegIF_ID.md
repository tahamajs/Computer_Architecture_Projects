# Register IF/ID Module for Pipelined Processor

## Overview

The `RegIF_ID` module is a pipeline register that holds the state between the Instruction Fetch (IF) and Instruction Decode (ID) stages of a pipelined processor. It stores the fetched instruction and the corresponding program counter values to be used in the ID stage.

## Module Interface

### Inputs

- **clk**: The clock signal.
- **rst**: The reset signal.
- **en**: The enable signal to allow writing to the register.
- **clr**: The clear signal to flush the pipeline.
- **instrF [31:0]**: The fetched instruction from the IF stage.
- **PCF [31:0]**: The program counter value from the IF stage.
- **PCPlus4F [31:0]**: The PC + 4 value from the IF stage.

### Outputs

- **instrD [31:0]**: The instruction for the ID stage.
- **PCD [31:0]**: The program counter value for the ID stage.
- **PCPlus4D [31:0]**: The PC + 4 value for the ID stage.

## Operation

The `RegIF_ID` module captures the values of the input signals on the rising edge of the clock or when the reset signal is asserted. When the reset or clear signal is high, all outputs are cleared to their default values. If the enable signal is high, the values from the IF stage are transferred to the corresponding ID stage signals.
