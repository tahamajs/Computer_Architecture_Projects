# Register Module for Parameterized Register with Enable and Synchronous Clear

## Overview

The `Register` module implements a parameterized register with enable and synchronous clear functionality.

## Module Interface

### Parameters

- **N**: Width of the register. Default is 32 bits.

### Inputs

- **clk**: Clock signal.
- **en**: Enable signal. When high, the register updates its output.
- **sclr**: Synchronous clear signal. When high, the output is reset to 0 on the clock edge.
- **d [N-1:0]**: Data input. The value to be stored in the register when `en` is high and `sclr` is low.

### Outputs

- **q [N-1:0]**: Output of the register. It holds the stored value.

## Operation

The `Register` module updates its output `q` based on the following conditions:

- **Synchronous Clear (sclr)**: If `sclr` is high on the rising edge of the clock, `q` is set to 0.
- **Enable (en)**: If `en` is high on the rising edge of the clock and `sclr` is low, `q` is updated to the value of `d`.
