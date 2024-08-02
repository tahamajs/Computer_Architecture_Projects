# HazardUnit Module for Handling Pipeline Hazards

## Overview

The `HazardUnit` module detects and handles pipeline hazards in a CPU to ensure correct instruction execution.

## Module Interface

### Inputs

- **RegWriteM**: Register write enable signal for the memory stage.
- **RegWriteW**: Register write enable signal for the write-back stage.
- **ResultSrcE [1:0]**: Result source select signal for the execute stage.
- **PCSrcE [1:0]**: Program counter source select signal for the execute stage.
- **ResultSrcM [1:0]**: Result source select signal for the memory stage.
- **ResultSrcW [1:0]**: Result source select signal for the write-back stage.
- **Rs1D [4:0]**: Source register 1 from the decode stage.
- **Rs2D [4:0]**: Source register 2 from the decode stage.
- **Rs1E [4:0]**: Source register 1 from the execute stage.
- **Rs2E [4:0]**: Source register 2 from the execute stage.
- **RdE [4:0]**: Destination register from the execute stage.
- **RdM [4:0]**: Destination register from the memory stage.
- **RdW [4:0]**: Destination register from the write-back stage.

### Outputs

- **StallF**: Stall signal for the fetch stage.
- **StallD**: Stall signal for the decode stage.
- **FlushD**: Flush signal for the decode stage.
- **FlushE**: Flush signal for the execute stage.
- **ForwardAE [1:0]**: Forwarding control signal for ALU source A.
- **ForwardBE [1:0]**: Forwarding control signal for ALU source B.

## Operation

The `HazardUnit` module handles data hazards and control hazards by generating control signals for stalling and flushing the pipeline, as well as forwarding signals for resolving data dependencies.

### Forwarding Logic

- **ForwardAE**: Selects the source for ALU operand A.

  - `2'b10`: Forward from memory stage (`RegWriteM` is set and `Rs1E == RdM`).
  - `2'b01`: Forward from write-back stage (`RegWriteW` is set and `Rs1E == RdW` or `ResultSrcW == 2'b11`).
  - `2'b11`: Forward from memory stage with special handling (`ResultSrcM == 2'b11`).
  - `2'b00`: No forwarding.
- **ForwardBE**: Selects the source for ALU operand B.

  - `2'b10`: Forward from memory stage (`RegWriteM` is set and `Rs2E == RdM`).
  - `2'b01`: Forward from write-back stage (`RegWriteW` is set and `Rs2E == RdW` or `ResultSrcW == 2'b11`).
  - `2'b11`: Forward from memory stage with special handling (`ResultSrcM == 2'b11`).
  - `2'b00`: No forwarding.

### Stalling and Flushing Logic

- **loadStall**: Detects load-use hazards when the result source of the execute stage is a load instruction.

  - `loadStall = ((Rs1D == RdE) || (Rs2D == RdE)) && ResultSrcE == 2'b01`.
- **StallF**: Stalls the fetch stage if there is a load-use hazard.

  - `StallF = loadStall`.
- **StallD**: Stalls the decode stage if there is a load-use hazard.

  - `StallD = loadStall`.
- **FlushE**: Flushes the execute stage on load-use hazards or branch/jump instructions.

  - `FlushE = loadStall || (PCSrcE == 2'b01) || (PCSrcE == 2'b10)`.
- **FlushD**: Flushes the decode stage on branch instructions.

  - `FlushD = (PCSrcE == 2'b01) ? 1 : 0`.
