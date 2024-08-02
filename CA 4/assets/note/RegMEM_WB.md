# Register MEM/WB Module for Pipelined Processor

## Overview

The `RegMEM_WB` module is a pipeline register that holds the state between the Memory (MEM) and Write-Back (WB) stages of a pipelined processor. It stores intermediate values and control signals to be used in the WB stage.

## Module Interface

### Inputs

- **clk**: The clock signal.
- **rst**: The reset signal.
- **regWriteM**: Register write enable signal from the MEM stage.
- **resultSrcM [1:0]**: Result source control signal from the MEM stage.
- **RdM [4:0]**: Destination register address from the MEM stage.
- **ALUResultM [31:0]**: ALU result from the MEM stage.
- **RDM [31:0]**: Data read from memory in the MEM stage.
- **PCPlus4M [31:0]**: PC + 4 value from the MEM stage.
- **extImmM [31:0]**: Extended immediate value from the MEM stage.

### Outputs

- **regWriteW**: Register write enable signal for the WB stage.
- **resultSrcW [1:0]**: Result source control signal for the WB stage.
- **RdW [4:0]**: Destination register address for the WB stage.
- **ALUResultW [31:0]**: ALU result for the WB stage.
- **RDW [31:0]**: Data read from memory for the WB stage.
- **PCPlus4W [31:0]**: PC + 4 value for the WB stage.
- **extImmW [31:0]**: Extended immediate value for the WB stage.

## Operation

The `RegMEM_WB` module captures the values of the input signals on the rising edge of the clock or when the reset signal is asserted. When the reset signal is high, all outputs are cleared to their default values. On the rising edge of the clock, the values from the MEM stage are transferred to the corresponding WB stage signals.
