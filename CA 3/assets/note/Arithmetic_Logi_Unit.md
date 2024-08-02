# Arithmetic Logic Unit (ALU) for Multi-Cycle RISC-V Processor

## Overview

This module implements an Arithmetic Logic Unit (ALU) for a multi-cycle RISC-V processor. The ALU is designed to perform various arithmetic and logical operations based on the provided operation code. The operations supported by this ALU are addition, subtraction, bitwise AND, bitwise OR, set less than (signed comparison), and bitwise XOR.

## Supported Operations

The ALU supports the following operations, defined by 3-bit operation codes:

- **Addition (ADD)**: `3'b000`
- **Subtraction (SUB)**: `3'b001`
- **Bitwise AND (AND)**: `3'b010`
- **Bitwise OR (OR)**: `3'b011`
- **Set Less Than (SLT)**: `3'b101`
- **Bitwise XOR (XOR)**: `3'b100`

## Module Interface

### Parameters

- **WIDTH**: The bit-width of the operands and the result. The default width is 32 bits.

### Inputs

- **operation_code [2:0]**: A 3-bit code specifying the operation to be performed.
- **operand_a [WIDTH-1:0]**: The first operand for the ALU operation.
- **operand_b [WIDTH-1:0]**: The second operand for the ALU operation.

### Outputs

- **result [WIDTH-1:0]**: The result of the ALU operation.
- **is_zero**: A flag that is set to 1 if the result is zero.
- **is_negative**: A flag that is set to 1 if the result is negative.

## Operation

The ALU performs the operation specified by the `operation_code` on the inputs `operand_a` and `operand_b`, and produces the result on the `result` output. Additionally, it sets the `is_zero` flag if the result is zero and the `is_negative` flag if the result is negative.

### Detailed Description

- **Addition (ADD)**: Adds `operand_a` and `operand_b`.
- **Subtraction (SUB)**: Subtracts `operand_b` from `operand_a`.
- **Bitwise AND (AND)**: Performs a bitwise AND between `operand_a` and `operand_b`.
- **Bitwise OR (OR)**: Performs a bitwise OR between `operand_a` and `operand_b`.
- **Set Less Than (SLT)**: Sets the result to 1 if `operand_a` is less than `operand_b` (signed comparison), otherwise sets the result to 0.
- **Bitwise XOR (XOR)**: Performs a bitwise XOR between `operand_a` and `operand_b`.
