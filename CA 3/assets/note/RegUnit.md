# Register Unit for Multi-Cycle RISC-V Processor

## Overview

This module implements a register unit for a multi-cycle RISC-V processor. The register unit stores a 32-bit input value and updates its output based on the enable and reset signals.

## Module Interface

### Inputs

- **dataIn [31:0]**: The 32-bit input data to be stored in the register.
- **enable**: A signal indicating whether the register should update its value.
- **reset**: A signal indicating whether the register should be reset to zero.
- **clock**: The clock signal for synchronizing the register operations.

### Outputs

- **dataOut [31:0]**: The 32-bit output data stored in the register.

## Operation

The register updates its value on the rising edge of the `clock` signal. If the `reset` signal is high, the register is reset to zero. If the `enable` signal is high and `reset` is low, the register updates its value to `dataIn`.
