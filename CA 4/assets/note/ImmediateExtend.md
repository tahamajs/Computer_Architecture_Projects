# ImmediateExtend Module for Immediate Value Extension

## Overview

The `ImmediateExtend` module extends various types of immediate values from the instruction based on the selected type.

## Module Interface

### Inputs

- **immSelect [2:0]**: Immediate type selection signal.
- **instructionPart [31:7]**: The part of the instruction containing the immediate value to be extended.

### Outputs

- **extendedImmediate [31:0]**: The 32-bit extended immediate value.

## Operation

The `ImmediateExtend` module extends immediate values based on the `immSelect` signal. The following types of immediate values are supported:

- **I_TYPE (3'b000)**: Sign-extends bits [31:20] to form a 32-bit immediate.
- **S_TYPE (3'b001)**: Sign-extends bits [31:25] and [11:7] to form a 32-bit immediate.
- **J_TYPE (3'b010)**: Sign-extends bits [31], [19:12], [20], [30:21], and appends a 0 bit at the end to form a 32-bit immediate.
- **B_TYPE (3'b011)**: Sign-extends bits [31], [7], [30:25], [11:8], and appends a 0 bit at the end to form a 32-bit immediate.
- **U_TYPE (3'b100)**: Zero-extends bits [31:12] and appends 12 zero bits to form a 32-bit immediate.

### Example Usage

Below is an example of how the `ImmediateExtend` module can be instantiated and used in a higher-level Verilog module.

```verilog
module TopModule;
    reg [2:0] immSelect;
    reg [31:7] instructionPart;
    wire [31:0] extendedImmediate;

    // Instantiate the ImmediateExtend
    ImmediateExtend immediate_extend_instance(
        .immSelect(immSelect),
        .instructionPart(instructionPart),
        .extendedImmediate(extendedImmediate)
    );

    initial begin
        // Example inputs
        immSelect = `I_TYPE;
        instructionPart = 25'b1010101010101010101010101;

        // Simulate some time for the operation
        #10;
        $display("Extended Immediate: %h", extendedImmediate);
    end
endmodule
```
