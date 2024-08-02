# DataPath Module for CPU Data Path

## Overview

The `DataPath` module implements the data path of a CPU, handling instruction fetch, decode, execute, memory access, and write-back stages.

## Module Interface

### Inputs

- **clk**: Clock signal.
- **MemWriteD**: Memory write enable signal for the decode stage.
- **ALUSrcD**: ALU source select signal for the decode stage.
- **RegWriteD**: Register write enable signal for the decode stage.
- **JumpD**: Jump signal for the decode stage.
- **BranchD**: Branch signal for the decode stage.
- **JalrD**: JALR signal for the decode stage.
- **StallF**: Stall signal for the fetch stage.
- **StallD**: Stall signal for the decode stage.
- **FlushD**: Flush signal for the decode stage.
- **FlushE**: Flush signal for the execute stage.
- **ResultSrcD [1:0]**: Result source select signal for the decode stage.
- **ForwardAE [1:0]**: Forwarding control signal for ALU source A.
- **ForwardBE [1:0]**: Forwarding control signal for ALU source B.
- **PCSrcE [1:0]**: Program counter source select signal for the execute stage.
- **ALUControlD [2:0]**: ALU control signal for the decode stage.
- **ImmSrcD [2:0]**: Immediate source select signal for the decode stage.

### Outputs

- **BranchE**: Branch signal for the execute stage.
- **JumpE**: Jump signal for the execute stage.
- **JalrE**: JALR signal for the execute stage.
- **ZeroE**: Zero flag from the ALU in the execute stage.
- **ALUResult0**: ALU result (not used).
- **RegWriteM**: Register write enable signal for the memory stage.
- **RegWriteW**: Register write enable signal for the write-back stage.
- **ResultSrcE [1:0]**: Result source select signal for the execute stage.
- **func3D [2:0]**: Function field from the decode stage.
- **func3E [2:0]**: Function field from the execute stage.
- **func7 [6:0]**: Function field from the decode stage.
- **op [6:0]**: Opcode from the decode stage.
- **Rs1D [4:0]**: Source register 1 from the decode stage.
- **Rs2D [4:0]**: Source register 2 from the decode stage.
- **Rs1E [4:0]**: Source register 1 from the execute stage.
- **Rs2E [4:0]**: Source register 2 from the execute stage.
- **RdE [4:0]**: Destination register from the execute stage.
- **RdM [4:0]**: Destination register from the memory stage.
- **RdW [4:0]**: Destination register from the write-back stage.
- **ResultSrcM [1:0]**: Result source select signal for the memory stage.
- **ResultSrcW [1:0]**: Result source select signal for the write-back stage.

## Operation

The `DataPath` module coordinates the flow of data through the CPU, ensuring that instructions are fetched, decoded, executed, and their results are written back to the appropriate registers. It uses several submodules to achieve this:

- **Mux3to1**: Multiplexes three inputs based on a select signal.
- **Register**: Stores the current value of the program counter.
- **InstMemory**: Fetches instructions from memory.
- **Adder**: Calculates the next program counter value.
- **IF_ID_Regs**: Holds values between the fetch and decode stages.
- **RegisterFile**: Manages the CPU's registers.
- **ImmExtend**: Extends immediate values to the correct width.
- **ID_EX_Regs**: Holds values between the decode and execute stages.
- **Mux4to1**: Multiplexes four inputs based on a select signal.
- **ALU**: Performs arithmetic and logic operations.
- **EX_Mem_Regs**: Holds values between the execute and memory stages.
- **DataMem**: Manages data memory access.
- **Mem_WB_Regs**: Holds values between the memory and write-back stages.
- **ResultSrcMux**: Selects the final result to be written back to the registers.
