# Pipeline Register Modules for CPU Data Path

## Overview

The following modules implement pipeline registers for different stages of a CPU data path: `IF_ID_Regs`, `ID_EX_Regs`, `EX_Mem_Regs`, and `Mem_WB_Regs`.

## IF_ID_Regs Module

### Inputs

- **clk**: Clock signal.
- **sclr**: Synchronous clear signal.
- **en**: Enable signal.
- **InstrF [31:0]**: Instruction fetched.
- **PCF [31:0]**: Program counter value.
- **PCPlus4F [31:0]**: Program counter plus 4 value.

### Outputs

- **InstrD [31:0]**: Instruction decoded.
- **PCD [31:0]**: Program counter value.
- **PCPlus4D [31:0]**: Program counter plus 4 value.

### Functionality

This module transfers values from the instruction fetch stage to the instruction decode stage.

## ID_EX_Regs Module

### Inputs

- **clk**: Clock signal.
- **sclr**: Synchronous clear signal.
- **RegWriteD**: Register write enable signal.
- **MemWriteD**: Memory write enable signal.
- **ALUSrcD**: ALU source select signal.
- **JumpD**: Jump signal.
- **BranchD**: Branch signal.
- **JalrD**: JALR signal.
- **ResultSrcD [1:0]**: Result source select signal.
- **ALUControlD [2:0]**: ALU control signal.
- **func3D [2:0]**: Function code.
- **Rs1D [4:0]**: Source register 1.
- **Rs2D [4:0]**: Source register 2.
- **RdD [4:0]**: Destination register.
- **PCD [31:0]**: Program counter value.
- **ExtImmD [31:0]**: Extended immediate value.
- **PCPlus4D [31:0]**: Program counter plus 4 value.
- **RD1D [31:0]**: Register data 1.
- **RD2D [31:0]**: Register data 2.

### Outputs

- **RegWriteE**: Register write enable signal.
- **MemWriteE**: Memory write enable signal.
- **ALUSrcE**: ALU source select signal.
- **JumpE**: Jump signal.
- **BranchE**: Branch signal.
- **JalrE**: JALR signal.
- **ResultSrcE [1:0]**: Result source select signal.
- **ALUControlE [2:0]**: ALU control signal.
- **func3E [2:0]**: Function code.
- **Rs1E [4:0]**: Source register 1.
- **Rs2E [4:0]**: Source register 2.
- **RdE [4:0]**: Destination register.
- **PCE [31:0]**: Program counter value.
- **ExtImmE [31:0]**: Extended immediate value.
- **PCPlus4E [31:0]**: Program counter plus 4 value.
- **RD1E [31:0]**: Register data 1.
- **RD2E [31:0]**: Register data 2.

### Functionality

This module transfers values from the instruction decode stage to the execution stage.

## EX_Mem_Regs Module

### Inputs

- **clk**: Clock signal.
- **RegWriteE**: Register write enable signal.
- **MemWriteE**: Memory write enable signal.
- **ResultSrcE [1:0]**: Result source select signal.
- **RdE [4:0]**: Destination register.
- **ALUResultE [31:0]**: ALU result.
- **WriteDataE [31:0]**: Write data.
- **ExtImmE [31:0]**: Extended immediate value.
- **PCPlus4E [31:0]**: Program counter plus 4 value.

### Outputs

- **RegWriteM**: Register write enable signal.
- **MemWriteM**: Memory write enable signal.
- **ResultSrcM [1:0]**: Result source select signal.
- **RdM [4:0]**: Destination register.
- **ALUResultM [31:0]**: ALU result.
- **WriteDataM [31:0]**: Write data.
- **ExtImmM [31:0]**: Extended immediate value.
- **PCPlus4M [31:0]**: Program counter plus 4 value.

### Functionality

This module transfers values from the execution stage to the memory stage.

## Mem_WB_Regs Module

### Inputs

- **clk**: Clock signal.
- **RegWriteM**: Register write enable signal.
- **ResultSrcM [1:0]**: Result source select signal.
- **RdM [4:0]**: Destination register.
- **ALUResultM [31:0]**: ALU result.
- **ReadDataM [31:0]**: Read data.
- **ExtImmM [31:0]**: Extended immediate value.
- **PCPlus4M [31:0]**: Program counter plus 4 value.

### Outputs

- **RegWriteW**: Register write enable signal.
- **ResultSrcW [1:0]**: Result source select signal.
- **RdW [4:0]**: Destination register.
- **ALUResultW [31:0]**: ALU result.
- **ReadDataW [31:0]**: Read data.
- **ExtImmW [31:0]**: Extended immediate value.
- **PCPlus4W [31:0]**: Program counter plus 4 value.

### Functionality

This module transfers values from the memory stage to the write-back stage.
