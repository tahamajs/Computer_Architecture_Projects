# 4-to-1 Multiplexer for Multi-Cycle RISC-V Processor

## Overview

This module implements a 4-to-1 multiplexer for a multi-cycle RISC-V processor. The multiplexer selects one of four 32-bit input signals based on a 2-bit select signal and outputs the selected signal.

## Module Interface

### Inputs

- **select [1:0]**: The control signal used to select one of the four inputs.
- **inputA [31:0]**: The first 32-bit input signal.
- **inputB [31:0]**: The second 32-bit input signal.
- **inputC [31:0]**: The third 32-bit input signal.
- **inputD [31:0]**: The fourth 32-bit input signal.

### Outputs

- **outputW [31:0]**: The 32-bit output signal, which is one of the four input signals based on the select signal.

## Operation

The multiplexer outputs one of the four input signals (`inputA`, `inputB`, `inputC`, `inputD`) based on the value of the `select` signal:

- `00`: Outputs `inputA`
- `01`: Outputs `inputB`
- `10`: Outputs `inputC`
- `11`: Outputs `inputD`
