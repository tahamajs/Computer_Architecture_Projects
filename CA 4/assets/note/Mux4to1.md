# 4-to-1 Multiplexer Module

## Overview

The `Mux4to1` module is a 4-to-1 multiplexer that selects one of four 32-bit input values based on a 2-bit select signal and outputs the selected value.

## Module Interface

### Inputs

- **select [1:0]**: A 2-bit control signal to select one of the four input values.
- **inA [31:0]**: The first 32-bit input value.
- **inB [31:0]**: The second 32-bit input value.
- **inC [31:0]**: The third 32-bit input value.
- **inD [31:0]**: The fourth 32-bit input value.

### Outputs

- **out [31:0]**: The selected 32-bit output value.

## Operation

The `Mux4to1` module outputs `inA` if the `select` signal is `2'b00`, `inB` if it is `2'b01`, `inC` if it is `2'b10`, and `inD` if it is `2'b11`. If none of these conditions are met, the output is set to high-impedance.
