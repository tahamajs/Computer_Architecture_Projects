
# ArithmeticLogicUnit Module for 32-bit Arithmetic and Logic Operations

## Overview

The `ArithmeticLogicUnit` module performs various arithmetic and logic operations on two input operands and produces a 32-bit result.

## Module Interface

### Inputs

- **operandA [31:0]**: The first 32-bit signed operand.
- **operandB [31:0]**: The second 32-bit signed operand.
- **controlSignal [2:0]**: A 3-bit control signal that determines the operation to be performed.

### Outputs

- **result [31:0]**: The 32-bit result of the ALU operation.
- **zeroFlag**: A flag that is asserted (set to 1) if `result` is zero.

## Operation

The `ArithmeticLogicUnit` module performs different operations based on the `controlSignal`:

- **3'b000**: Addition (`operandA + operandB`)
- **3'b001**: Subtraction (`operandA - operandB`)
- **3'b010**: Bitwise AND (`operandA & operandB`)
- **3'b011**: Bitwise OR (`operandA | operandB`)
- **3'b100**: Bitwise XOR (`operandA ^ operandB`)
- **3'b101**: Set on less than (`operandA < operandB ? 1 : 0`)
- **3'b110**: Set on less than unsigned (`$unsigned(operandA) < $unsigned(operandB) ? 1 : 0`)
- **default**: Sets `result` to zero (`32'b0`)

The `zeroFlag` output is asserted if the result of the ALU operation (`result`) is zero.
