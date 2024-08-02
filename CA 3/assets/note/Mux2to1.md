# 2-to-1 Multiplexer for Multi-Cycle RISC-V Processor

## Overview

This module implements a 2-to-1 multiplexer for a multi-cycle RISC-V processor. The multiplexer selects one of two 32-bit input signals based on a select signal and outputs the selected signal.

## Module Interface

### Inputs

- **select**: The control signal used to select between the two inputs.
- **inputA [31:0]**: The first 32-bit input signal.
- **inputB [31:0]**: The second 32-bit input signal.

### Outputs

- **outputW [31:0]**: The 32-bit output signal, which is one of the two input signals based on the select signal.

## Operation

The multiplexer outputs `inputA` if `select` is 0, and outputs `inputB` if `select` is 1. The selection is done using a ternary operator in Verilog.
