# Multi-Cycle RISC-V Processor Project

This project involves designing a multi-cycle RISC-V processor in Verilog. The processor supports various instruction types, including R-Type, I-Type, S-Type, J-Type, B-Type, and U-Type. The following sections provide detailed descriptions of the supported instructions and the design methodology.

## Supported Instructions

### R-Type Instructions

- **add**: Addition
- **sub**: Subtraction
- **and**: Bitwise AND
- **or**: Bitwise OR
- **slt**: Set less than (signed)
- **sltu**: Set less than (unsigned)

### I-Type Instructions

- **lw**: Load word
- **addi**: Add immediate
- **xori**: Bitwise XOR immediate
- **ori**: Bitwise OR immediate
- **slti**: Set less than immediate (signed)
- **sltiu**: Set less than immediate (unsigned)
- **jalr**: Jump and link register

### S-Type Instruction

- **sw**: Store word

### J-Type Instruction

- **jal**: Jump and link

### B-Type Instructions

- **beq**: Branch if equal
- **bne**: Branch if not equal
- **blt**: Branch if less than (signed)
- **bge**: Branch if greater than or equal (signed)

### U-Type Instruction

- **lui**: Load upper immediate

## Project Structure

### 1. Design Overview

The processor is designed using a multi-cycle approach, where each instruction is executed over multiple clock cycles. This allows for efficient use of resources and simplifies control logic.

### 2. Processor Components

The main components of the processor include:

- **Instruction Fetch Unit**: Fetches instructions from memory.
- **Instruction Decode Unit**: Decodes instructions and generates control signals.
- **Execution Unit**: Performs arithmetic and logical operations.
- **Memory Access Unit**: Handles memory read and write operations.
- **Write-Back Unit**: Writes results back to the register file.

### 3. Multi-Cycle Operation

In a multi-cycle processor, an instruction is divided into multiple steps, each executed in a separate clock cycle. The typical steps include:

1. **Instruction Fetch (IF)**: Fetch the instruction from memory.
2. **Instruction Decode/Register Fetch (ID)**: Decode the instruction and read operands from the register file.
3. **Execution/Effective Address (EX)**: Perform the operation specified by the instruction or calculate the effective address.
4. **Memory Access (MEM)**: Access memory if required (for load/store instructions).
5. **Write-Back (WB)**: Write the result back to the register file.

### 4. Control Unit

The control unit generates the necessary control signals to manage the flow of data and control through the different stages of instruction execution. It ensures proper sequencing and timing of operations for each instruction type.

### 5. Verilog Modules

The processor is implemented using several Verilog modules, each corresponding to a component or stage of the multi-cycle operation. Key modules include:

- `InstructionFetch.v`: Handles instruction fetching.
- `InstructionDecode.v`: Handles instruction decoding and register file operations.
- `ExecutionUnit.v`: Handles arithmetic and logical operations.
- `MemoryAccess.v`: Handles memory operations.
- `WriteBack.v`: Handles writing results back to the register file.
- `ControlUnit.v`: Generates control signals for all stages.

### 6. Simulation and Testing

Simulation and testing are conducted using a testbench that verifies the functionality of the processor. The testbench includes a set of test cases covering all supported instructions and various edge cases.

## Getting Started

### Prerequisites

- Verilog HDL simulator (e.g., ModelSim, VCS)
- RISC-V toolchain (for generating machine code)

### Compilation and Simulation

1. Clone the project repository.
2. Compile the Verilog files using your simulator.
3. Run the simulation to verify the processor's functionality.
