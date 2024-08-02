# DFlipFlop Module for D Flip-Flop with Enable and Synchronous Clear

## Overview

The `DFlipFlop` module implements a D flip-flop with enable and synchronous clear functionality.

## Module Interface

### Inputs

- **clk**: Clock signal.
- **en**: Enable signal. When high, the D flip-flop updates its output.
- **sclr**: Synchronous clear signal. When high, the output is reset to 0 on the clock edge.
- **d**: Data input. The value to be stored in the flip-flop when `en` is high and `sclr` is low.

### Outputs

- **q**: Output of the D flip-flop. It holds the stored value.

## Operation

The `DFlipFlop` module updates its output `q` based on the following conditions:

- **Synchronous Clear (sclr)**: If `sclr` is high on the rising edge of the clock, `q` is set to 0.
- **Enable (en)**: If `en` is high on the rising edge of the clock and `sclr` is low, `q` is updated to the value of `d`.
