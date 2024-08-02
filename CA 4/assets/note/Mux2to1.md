# 2-to-1 Multiplexer Module

## Overview

The `Mux2to1` module is a simple 2-to-1 multiplexer. It selects one of the two 32-bit input values based on the select signal and outputs the selected value.

## Module Interface

### Inputs

- **select**: A control signal to select between the two input values.
- **inA [31:0]**: The first 32-bit input value.
- **inB [31:0]**: The second 32-bit input value.

### Outputs

- **out [31:0]**: The selected 32-bit output value.

## Operation

The `Mux2to1` module outputs `inA` if the `select` signal is low (0) and `inB` if the `select` signal is high (1).
