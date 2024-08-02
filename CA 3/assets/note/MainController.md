# Main Controller for Multi-Cycle RISC-V Processor

## Overview

The `MainController` module manages the control signals for a multi-cycle RISC-V processor. It includes a state machine that transitions through various states to execute instructions, ensuring proper sequencing of operations.

## Module Interface

### Inputs

- **clk**: The clock signal for synchronizing the controller.
- **rst**: The reset signal for initializing the controller.
- **op [6:0]**: The operation code from the instruction.
- **zero**: A flag indicating if the ALU result is zero.
- **neg**: A flag indicating if the ALU result is negative.

### Outputs

- **PCUpdate**: A signal indicating if the program counter should be updated.
- **adrSrc**: A signal indicating the source of the address.
- **memWrite**: A signal indicating if a memory write operation should be performed.
- **branch**: A signal indicating if a branch should be taken.
- **IRWrite**: A signal indicating if the instruction register should be written.
- **resultSrc [1:0]**: A signal indicating the source of the result.
- **ALUSrcA [1:0]**: A signal indicating the first ALU source.
- **ALUSrcB [1:0]**: A signal indicating the second ALU source.
- **ALUOp [1:0]**: A signal indicating the ALU operation.
- **immSrc [2:0]**: A signal indicating the source of the immediate value.
- **regWrite**: A signal indicating if a register write operation should be performed.

## State Machine

The state machine transitions through various states to execute instructions. Each state corresponds to a specific phase of instruction execution, including fetching, decoding, executing, memory access, and write-back.

### State Transitions

- **FETCH**: Fetches the instruction from memory.
- **DECODE**: Decodes the instruction and determines the next state based on the operation code.
- **EXECUTE1** - **EXECUTE9**: Executes various phases of different instruction types.
- **MEM_STAGE1** - **MEM_STAGE6**: Handles memory access phases.
- **WRITEBACK**: Writes the result back to the register file.
