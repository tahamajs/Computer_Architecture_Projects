# Branch Controller for Multi-Cycle RISC-V Processor

## Overview

This module implements a Branch Controller for a multi-cycle RISC-V processor. The Branch Controller determines whether a branch should be taken based on the branch condition codes and the results of comparisons. It supports several branch types, including BEQ, BNE, BLT, and BGE.

## Supported Branch Types

The Branch Controller supports the following branch types, defined by 3-bit function codes:

- **Branch if Equal (BEQ)**: `3'b000`
- **Branch if Not Equal (BNE)**: `3'b001`
- **Branch if Less Than (BLT)**: `3'b010`
- **Branch if Greater or Equal (BGE)**: `3'b011`

## Module Interface

### Inputs

- **func3_code [2:0]**: A 3-bit function code from the instruction, specifying the branch condition.
- **branch_en**: A signal indicating whether branching is enabled.
- **is_zero**: A signal that is 1 if the comparison result is zero.
- **is_neg**: A signal that is 1 if the comparison result is negative.

### Outputs

- **branch_taken**: A signal that is 1 if the branch condition is met and the branch should be taken.

## Operation

The Branch Controller evaluates the branch condition specified by `func3_code` in conjunction with the `branch_en`, `is_zero`, and `is_neg` signals to determine if a branch should be taken. The result is output on the `branch_taken` signal.

### Detailed Description

- **BEQ (Branch if Equal)**: The branch is taken if `is_zero` is 1.
- **BNE (Branch if Not Equal)**: The branch is taken if `is_zero` is 0.
- **BLT (Branch if Less Than)**: The branch is taken if `is_neg` is 1.
- **BGE (Branch if Greater or Equal)**: The branch is taken if `is_zero` is 1 or `is_neg` is 0.
- **Default**: The branch is not taken.
