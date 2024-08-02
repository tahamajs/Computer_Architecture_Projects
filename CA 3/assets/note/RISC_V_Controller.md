# RISC-V Controller for Multi-Cycle Processor

## Overview

The `RISC_V_Controller` module integrates the main control logic for a multi-cycle RISC-V processor. It orchestrates the operations of the main controller, ALU controller, and branch controller to manage the execution of instructions.

## Module Interface

### Inputs

- **clk**: The clock signal for synchronizing the controller operations.
- **reset**: The reset signal for initializing the controller.
- **opcode [6:0]**: The operation code from the instruction.
- **func3 [2:0]**: The 3-bit function code from the instruction.
- **func7**: The 7th bit of the function code from the instruction.
- **zero**: A flag indicating if the ALU result is zero.
- **negative**: A flag indicating if the ALU result is negative.

### Outputs

- **PCWrite**: A signal indicating whether the program counter should be updated.
- **addrSrc**: A signal indicating the source of the address.
- **memWrite**: A signal indicating whether a memory write operation should be performed.
- **IRWrite**: A signal indicating whether the instruction register should be written.
- **regWrite**: A signal indicating whether a register write operation should be performed.
- **resultSrc [1:0]**: A signal indicating the source of the result.
- **ALUSrcA [1:0]**: A signal indicating the first ALU source.
- **ALUSrcB [1:0]**: A signal indicating the second ALU source.
- **ALUControl [2:0]**: A signal indicating the ALU control operation.
- **immSrc [2:0]**: A signal indicating the source of the immediate value.

## Operation

The `RISC_V_Controller` integrates three submodules: `MainController`, `ALU_Controller`, and `BranchController`. It manages the control signals necessary for the execution of instructions in a multi-cycle RISC-V processor.

### Submodules

#### MainController

The `MainController` generates the primary control signals based on the current state and the opcode of the instruction. It manages the overall control flow of the processor.

#### ALU_Controller

The `ALU_Controller` decodes the function codes (`func3` and `func7`) and ALU operation code to generate the appropriate ALU control signals.

#### BranchController

The `BranchController` determines whether a branch should be taken based on the branch condition codes and the results of comparisons (`zero` and `negative` flags).
