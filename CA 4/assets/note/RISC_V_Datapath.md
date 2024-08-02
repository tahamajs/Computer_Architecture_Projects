# RISC-V Datapath Module

## Overview

The `RISC_V_Datapath` module is a comprehensive implementation of the datapath for a pipelined RISC-V processor. It handles instruction fetch, decode, execute, memory access, and write-back stages, integrating various control signals to manage data flow and operation.

## Module Interface

### Inputs

- **clk**: The clock signal.
- **rst**: The reset signal.
- **regWriteD**: Register write enable signal for the decode stage.
- **memWriteD**: Memory write enable signal for the decode stage.
- **ALUSrcD**: ALU source select signal for the decode stage.
- **luiD**: Load upper immediate signal for the decode stage.
- **resultSrcD [1:0]**: Result source control signal for the decode stage.
- **jumpD [1:0]**: Jump control signal for the decode stage.
- **ALUControlD [2:0]**: ALU control signal for the decode stage.
- **branchD [2:0]**: Branch control signal for the decode stage.
- **immSrcD [2:0]**: Immediate source control signal for the decode stage.

### Outputs

- **op [6:0]**: Opcode field from the instruction.
- **func3 [2:0]**: Function 3 field from the instruction.
- **func7**: Function 7 field from the instruction.

## Pipeline Stages

### Fetch Stage (F)

- **PCFAdder**: Adds 4 to the current PC to get the next PC value.
- **PCreg**: Stores the current PC value.
- **InstructionMemory**: Fetches the instruction from memory.
- **PCmux**: Selects the next PC value based on control signals.
- **RegIF_ID**: Pipeline register between the fetch and decode stages.

### Decode Stage (D)

- **RegisterFile**: Holds the register values and provides read/write access.
- **ImmExtension**: Extends immediate values based on control signals.
- **ALU**: Performs arithmetic and logic operations.
- **RegID_EX**: Pipeline register between the decode and execute stages.

### Execute Stage (E)

- **SrcAreg**: Selects the source operand A for the ALU.
- **BSrcBreg**: Selects the source operand B for the ALU.
- **SrcBreg**: Selects between register data and immediate value for ALU.
- **PCEAdder**: Calculates the target PC value for branches.
- **RegEX_MEM**: Pipeline register between the execute and memory stages.

### Memory Stage (M)

- **DataMemory**: Reads from and writes to data memory.
- **muxMSrcA**: Selects the source operand for memory operations.
- **RegMEM_WB**: Pipeline register between the memory and write-back stages.

### Write-Back Stage (W)

- **resMux**: Selects the final result to be written back to the register file.

### Hazard Unit

- **HazardUnit**: Detects and handles hazards to ensure correct instruction execution.
- **BranchController**: Determines the PC source based on branch and jump conditions.

## Conclusion

The `RISC_V_Datapath` module integrates all the necessary components to implement a pipelined RISC-V processor. It handles various stages of instruction processing, ensuring correct data flow and operation through the use of control signals and pipeline registers.
