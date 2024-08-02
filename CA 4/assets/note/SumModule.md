
# Adder Module for 32-bit Addition

## Overview

The `SumModule` performs a 32-bit addition operation on two input operands and produces a 32-bit result.

## Module Interface

### Inputs

- **num1 [31:0]**: The first 32-bit operand for the addition.
- **num2 [31:0]**: The second 32-bit operand for the addition.

### Outputs

- **result [31:0]**: The 32-bit signed result of the addition operation.

## Operation

The `SumModule` performs a simple addition operation on the two input operands, `num1` and `num2`, and assigns the sum to the output `result`.

## Code

```verilog
module SumModule(input [31:0] num1, num2, output signed [31:0] result);
    assign result = num1 + num2;
endmodule
```
