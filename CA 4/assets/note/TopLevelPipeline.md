# TopLevelPipeline Module for CPU Pipeline Integration

## Overview

The `TopLevelPipeline` module integrates various control, hazard detection, and data path modules to implement a complete CPU pipeline.

## Module Interface

### Inputs

- **clk**: Clock signal.

### Internal Signals

- **Control Signals**: Signals for memory write, ALU source, register write, jump, branch, and JALR operations.
  - `memWriteD`, `aluSrcD`, `regWriteD`, `jumpD`, `branchD`, `jalrD`
  - `regWriteM`, `regWriteW`, `jalrE`, `jumpE`, `branchE`, `zeroE`, `aluResult0`
- **Hazard Signals**: Signals for stalling, flushing, and forwarding.
  - `stallF`, `stallD`, `flushD`, `flushE`
  - `forwardAE`, `forwardBE`
- **Result Source Signals**: Signals for selecting the result source.
  - `resultSrcD`, `resultSrcE`, `pcSrcE`
  - `resultSrcM`, `resultSrcW`
- **Function and Opcode Signals**: Signals for function codes and opcode.
  - `func3D`, `func3E`, `aluControlD`, `immSrcD`
  - `rs1D`, `rs2D`, `rs1E`, `rs2E`, `rdE`, `rdM`, `rdW`
  - `func7`, `opcode`

## Components

### Control Unit

The `ControlUnit` module generates control signals based on the instruction's function codes and opcode.

### Hazard Unit

The `HazardUnit` module detects and handles pipeline hazards by generating control signals for stalling, flushing, and forwarding.

### Control Decoder

The `ControlDecoder` module determines the source for the program counter (`pcSrcE`) based on various control signals and the function code.

### Data Path

The `DataPath` module handles the flow of data through the CPU pipeline stages: instruction fetch, decode, execute, memory access, and write-back.
