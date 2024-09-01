# Computer Architecture Course - University of Tehran

## Overview

This repository contains the Verilog code projects developed for the Computer Architecture course taught by Professor Saeed Safari at the University of Tehran. The projects focus on implementing the RISC5 processor in three different types: single cycle, multi-cycle, and pipelined architecture. Each implementation is stored in a separate folder corresponding to the assignment it belongs to.

## Project Structure

- **CA 1**: Implementation of the divider.
- **CA 2**: Implementation of the Single Cycle RISC5 Processor.
- **CA 3**: Implementation of the Multi-Cycle RISC5 Processor.
- **CA 4**: Implementation of the Pipelined RISC5 Processor.
- **EXTRA**: Additional resources, references, or extra work beyond the main projects.
- **Slides**: Lecture slides and presentation materials related to the course.
- **README.md**: This file, providing an overview and guide to the repository.

## Project Descriptions

### CA 1: Single Cycle RISC5 Processor

### Project Description

This project involves the implementation of a single-cycle RISC5 processor in Verilog. The focus is on designing a simple yet functional processor capable of performing basic arithmetic and logical operations, particularly division operations. The processor is designed to execute the division of two 10-bit binary numbers, returning the quotient, and handling overflow conditions.

### Inputs and Outputs

- **Inputs**:

  - `a_in`: A 10-bit binary input representing the dividend.
  - `b_in`: A 10-bit binary input representing the divisor.
  - `start`: A control signal to start the operation.
  - `sclr`: A signal to reset the registers and clear the system.
  - `clk`: The clock signal that synchronizes the operation of the processor.
- **Outputs**:

  - `q_out`: A 10-bit binary output representing the quotient.
  - `dvz`: A signal indicating a division by zero condition.
  - `ovf`: A signal indicating an overflow condition if the result cannot be represented within the available bit-width.
  - `busy`: A signal that indicates the processor is currently busy performing the division.
  - `valid`: A signal that indicates the quotient output is valid and the operation is complete.

### Operation Flow

1. **Start the Operation**: When the `start` signal is activated, the processor begins the division operation.
2. **Clock Signal Processing**: The processor operates synchronously with the provided `clk` signal. The division operation progresses on each clock cycle.
3. **Input Handling**: The `a_in` and `b_in` inputs are loaded into the processor at the start of the operation.
4. **Division Algorithm**: The division algorithm iteratively subtracts the divisor from the dividend, shifting bits as needed to calculate the quotient.
5. **Output**: Once the operation is complete, the quotient is output on the `q_out` line. The `valid` signal is asserted to indicate the result is ready. If an overflow occurs, the `ovf` signal is asserted. If the divisor is zero, the `dvz` signal is asserted.
6. **End of Operation**: The processor asserts the `busy` signal during the operation. When the operation is complete, `busy` is deasserted, and the `valid` signal indicates that the output `q_out` is ready for use.

### Algorithm Implementation

The division algorithm implemented follows these steps:

- Initialize the accumulator (`ACC`) and quotient (`Q`).
- For each iteration (total of 14 iterations):
  - Check if the accumulator is greater than or equal to the divisor.
  - If true, subtract the divisor from the accumulator, and shift the quotient left, inserting a 1 at the least significant bit.
  - If false, shift the quotient left, inserting a 0 at the least significant bit.
  - After 10 iterations, check for overflow; if the upper 6 bits of the quotient are not zero, set the overflow flag.
- Continue until the operation completes, then output the final quotient.

### Grading Criteria

- **Total Points: 100**
  - **25 points**: Correct implementation of the division logic.
  - **15 points**: Proper handling of edge cases, such as division by zero.
  - **40 points**: Overall functionality, including the correct output of signals and handling of the `busy`, `valid`, and `ovf` signals.
  - **20 points**: Code quality and adherence to best practices in Verilog, including proper documentation and structuring of the code.

---

## CA 2: Multi-Cycle RISC5 Processor

### Project Description

In this project, you will extend your work from the first assignment to implement a Multi-Cycle RISC5 processor in Verilog. The multi-cycle design improves upon the single-cycle processor by executing instructions over multiple clock cycles, allowing for more efficient use of resources and reducing the critical path delay.

### Supported Instructions

The processor must support the following RISC-V instruction types:

- **R-Type**:
  - `add`, `sub`, `and`, `or`, `slt`, `sltu`
- **I-Type**:
  - `lw`, `addi`, `xori`, `ori`, `slti`, `sltiu`, `jalr`
- **S-Type**:
  - `sw`
- **J-Type**:
  - `jal`
- **B-Type**:
  - `beq`, `bne`, `blt`, `bge`
- **U-Type**:
  - `lui`

### Inputs and Outputs

- **Inputs**:

  - `clk`: The clock signal that drives the processor's state machine.
  - `reset`: A signal to reset the processor and all its internal registers.
  - `instr_in`: The 32-bit instruction fetched from memory.
  - `data_in`: The data input from memory (used for load instructions).
  - `start`: Signal to initiate the operation.
- **Outputs**:

  - `instr_addr`: The address of the instruction to be fetched from memory.
  - `data_out`: The data to be written to memory (used for store instructions).
  - `mem_addr`: The address of the memory location to be accessed.
  - `mem_write`: A control signal indicating a memory write operation.
  - `mem_read`: A control signal indicating a memory read operation.
  - `done`: A signal indicating the completion of the instruction execution.

### Operation Flow

1. **Instruction Fetch (IF)**:

   - The processor fetches the instruction from memory using the `instr_addr` output. The instruction is then loaded into the `instr_in` input.
2. **Instruction Decode (ID)**:

   - The fetched instruction is decoded to identify the operation type, source registers, and destination register. Control signals are generated based on the instruction type.
3. **Execute (EX)**:

   - The appropriate operation is performed based on the decoded instruction. For example, arithmetic and logical operations are carried out in the ALU, and memory addresses are calculated for load and store instructions.
4. **Memory Access (MEM)**:

   - For load (`lw`) and store (`sw`) instructions, memory is accessed using the calculated address. Data is either read from or written to memory.
5. **Write Back (WB)**:

   - The result of the instruction is written back to the destination register, completing the execution of the instruction.
6. **Cycle Control**:

   - Each instruction type takes a different number of cycles to complete. The processor uses a finite state machine (FSM) to manage the transitions between the different stages (IF, ID, EX, MEM, WB) and ensures that the appropriate signals are asserted at the correct times.

### Grading Criteria

- **Total Points: 100**
  - **25 points**: Correct implementation and execution of the supported instruction set.
  - **15 points**: Efficient use of clock cycles and proper multi-cycle execution.
  - **40 points**: Overall design functionality, including accurate memory access and proper instruction sequencing.
  - **20 points**: Code quality and adherence to Verilog best practices, including proper use of state machines and modular design.

---

## CA 3: Pipelined RISC5 Processor

### Project Description

This project involves the implementation of a pipelined RISC5 processor in Verilog. Pipelining is a technique used in processor design to increase instruction throughput by overlapping the execution of multiple instructions. In this project, you will extend your previous multi-cycle implementation to a pipelined architecture, allowing the processor to execute multiple instructions simultaneously, each at a different stage of completion.

### Supported Instructions

The processor must support the following RISC-V instruction types:

- **R-Type**:
  - `add`, `sub`, `and`, `or`, `slt`, `sltu`
- **I-Type**:
  - `lw`, `addi`, `xori`, `ori`, `slti`, `sltiu`, `jalr`
- **S-Type**:
  - `sw`
- **J-Type**:
  - `jal`
- **B-Type**:
  - `beq`, `bne`, `blt`, `bge`
- **U-Type**:
  - `lui`

### Inputs and Outputs

- **Inputs**:

  - `clk`: The clock signal that drives the processor's state machine.
  - `reset`: A signal to reset the processor and all its internal registers.
  - `instr_in`: The 32-bit instruction fetched from memory.
  - `data_in`: The data input from memory (used for load instructions).
  - `start`: Signal to initiate the operation.
- **Outputs**:

  - `instr_addr`: The address of the instruction to be fetched from memory.
  - `data_out`: The data to be written to memory (used for store instructions).
  - `mem_addr`: The address of the memory location to be accessed.
  - `mem_write`: A control signal indicating a memory write operation.
  - `mem_read`: A control signal indicating a memory read operation.
  - `done`: A signal indicating the completion of the instruction execution.

### Pipelining Stages

1. **Instruction Fetch (IF)**:

   - The instruction is fetched from memory based on the `instr_addr` output. In this stage, the instruction is loaded into the pipeline and passed to the next stage.
2. **Instruction Decode (ID)**:

   - The fetched instruction is decoded to determine the operation type, source and destination registers, and immediate values. Control signals are generated to guide the instruction through the subsequent stages.
3. **Execute (EX)**:

   - The actual operation specified by the instruction is performed. This includes arithmetic and logical operations in the ALU and address calculation for load and store instructions.
4. **Memory Access (MEM)**:

   - Memory operations are performed in this stage. For `lw` instructions, data is read from memory, and for `sw` instructions, data is written to memory.
5. **Write Back (WB)**:

   - The result of the executed instruction is written back to the destination register, completing the instruction execution.

### Pipeline Hazards and Solutions

- **Data Hazards**:

  - Occur when an instruction depends on the result of a previous instruction still in the pipeline. These are mitigated using forwarding (bypassing) techniques and, if necessary, stalling the pipeline.
- **Control Hazards**:

  - Occur due to branch instructions which can change the flow of execution. Techniques such as branch prediction or stalling until the branch decision is made are used to handle these hazards.
- **Structural Hazards**:

  - Occur when hardware resources are insufficient to handle multiple instructions simultaneously. Careful design and resource allocation are used to minimize these hazards.

### Grading Criteria

- **Total Points: 100**
  - **25 points**: Correct implementation of the pipeline stages and proper instruction handling.
  - **15 points**: Efficient hazard detection and resolution, ensuring smooth pipeline operation.
  - **40 points**: Overall design functionality, including correct execution of all supported instructions and maintaining instruction throughput.
  - **20 points**: Code quality, modularity, and adherence to Verilog best practices, including clear documentation and structured code.

Here's the detailed section for the third project in the `README.md` file based on the provided CA#03 project document:

---

## CA 3: Pipelined RISC5 Processor

### Project Description

This project involves the implementation of a pipelined RISC5 processor in Verilog. Pipelining is a technique used in processor design to increase instruction throughput by overlapping the execution of multiple instructions. In this project, you will extend your previous multi-cycle implementation to a pipelined architecture, allowing the processor to execute multiple instructions simultaneously, each at a different stage of completion.

### Supported Instructions

The processor must support the following RISC-V instruction types:

- **R-Type**:
  - `add`, `sub`, `and`, `or`, `slt`, `sltu`
- **I-Type**:
  - `lw`, `addi`, `xori`, `ori`, `slti`, `sltiu`, `jalr`
- **S-Type**:
  - `sw`
- **J-Type**:
  - `jal`
- **B-Type**:
  - `beq`, `bne`, `blt`, `bge`
- **U-Type**:
  - `lui`

### Inputs and Outputs

- **Inputs**:

  - `clk`: The clock signal that drives the processor's state machine.
  - `reset`: A signal to reset the processor and all its internal registers.
  - `instr_in`: The 32-bit instruction fetched from memory.
  - `data_in`: The data input from memory (used for load instructions).
  - `start`: Signal to initiate the operation.
- **Outputs**:

  - `instr_addr`: The address of the instruction to be fetched from memory.
  - `data_out`: The data to be written to memory (used for store instructions).
  - `mem_addr`: The address of the memory location to be accessed.
  - `mem_write`: A control signal indicating a memory write operation.
  - `mem_read`: A control signal indicating a memory read operation.
  - `done`: A signal indicating the completion of the instruction execution.

### Pipelining Stages

1. **Instruction Fetch (IF)**:

   - The instruction is fetched from memory based on the `instr_addr` output. In this stage, the instruction is loaded into the pipeline and passed to the next stage.
2. **Instruction Decode (ID)**:

   - The fetched instruction is decoded to determine the operation type, source and destination registers, and immediate values. Control signals are generated to guide the instruction through the subsequent stages.
3. **Execute (EX)**:

   - The actual operation specified by the instruction is performed. This includes arithmetic and logical operations in the ALU and address calculation for load and store instructions.
4. **Memory Access (MEM)**:

   - Memory operations are performed in this stage. For `lw` instructions, data is read from memory, and for `sw` instructions, data is written to memory.
5. **Write Back (WB)**:

   - The result of the executed instruction is written back to the destination register, completing the instruction execution.

### Pipeline Hazards and Solutions

- **Data Hazards**:

  - Occur when an instruction depends on the result of a previous instruction still in the pipeline. These are mitigated using forwarding (bypassing) techniques and, if necessary, stalling the pipeline.
- **Control Hazards**:

  - Occur due to branch instructions which can change the flow of execution. Techniques such as branch prediction or stalling until the branch decision is made are used to handle these hazards.
- **Structural Hazards**:

  - Occur when hardware resources are insufficient to handle multiple instructions simultaneously. Careful design and resource allocation are used to minimize these hazards.

---

## CA 4: Pipelined RISC5 Processor with Enhanced Features

### Project Description

The final project for this course extends the pipelined RISC5 processor developed in the previous assignments by adding advanced features and optimizations. The focus is on refining the pipelined architecture to improve performance, handle complex control flows, and ensure efficient execution across various instruction types.

### Supported Instructions

The processor continues to support the complete set of RISC-V instructions, including:

- **R-Type**:
  - `add`, `sub`, `and`, `or`, `slt`, `sltu`
- **I-Type**:
  - `lw`, `addi`, `xori`, `ori`, `slti`, `sltiu`, `jalr`
- **S-Type**:
  - `sw`
- **J-Type**:
  - `jal`
- **B-Type**:
  - `beq`, `bne`, `blt`, `bge`
- **U-Type**:
  - `lui`

### Enhanced Features

1. **Optimized Pipeline Design**:

   - Refined pipeline stages to minimize latency and maximize instruction throughput.
   - Enhanced handling of pipeline hazards, including data, control, and structural hazards, with advanced techniques like out-of-order execution or dynamic scheduling if applicable.
2. **Branch Prediction**:

   - Implementation of a branch prediction unit to reduce the performance penalties associated with control hazards.
   - Techniques such as static prediction, dynamic prediction with history tables, or even speculative execution may be applied.
3. **Memory Hierarchy Integration**:

   - Improved memory access strategies, potentially involving caching mechanisms or memory interleaving to reduce access delays for `lw` and `sw` instructions.
4. **Exception and Interrupt Handling**:

   - Integration of mechanisms to handle exceptions (like division by zero) and interrupts, ensuring the processor can deal with unexpected events and maintain stability.
5. **Extended Testing and Verification**:

   - Comprehensive testbenches designed to rigorously test the processor under various scenarios, including stress tests to evaluate the robustness of the pipeline and associated enhancements.

### Inputs and Outputs

The inputs and outputs remain consistent with the previous designs, ensuring backward compatibility while incorporating the new features.

- **Inputs**:

  - `clk`: The clock signal driving the processor’s operations.
  - `reset`: A signal to reset the processor and its state.
  - `instr_in`: The 32-bit instruction input fetched from memory.
  - `data_in`: The data input from memory (for load instructions).
  - `start`: Signal to initiate processor operation.
- **Outputs**:

  - `instr_addr`: The address of the instruction being fetched.
  - `data_out`: Data output to be written to memory (for store instructions).
  - `mem_addr`: The memory address to be accessed.
  - `mem_write`: Control signal for writing data to memory.
  - `mem_read`: Control signal for reading data from memory.
  - `done`: Signal indicating the completion of an instruction execution.

### Project Challenges and Considerations

- **Balancing Performance and Complexity**:

  - The introduction of advanced features like branch prediction and caching adds complexity to the processor’s design. Careful consideration is needed to ensure that these features do not adversely impact the overall performance or introduce new hazards.
- **Ensuring Pipeline Integrity**:

  - With the added complexity, ensuring that the pipeline operates correctly under all conditions is critical. This includes thorough testing for edge cases and unusual instruction sequences that could potentially disrupt the pipeline’s flow.
- **Maintaining Compatibility**:

  - Despite the enhancements, the processor should remain compatible with the original RISC5 instruction set and the basic operations as defined in the earlier assignments.


### Getting Started

### Prerequisites

To run the Verilog simulations, you will need a Verilog simulator such as ModelSim, Xilinx ISE, or any other tool that supports Verilog HDL.

### Running the Simulations

1. **Clone the repository**:

   ```bash
   git clone https://github.com/tahamajs/Computer_Architecture_Projects.git>\
   cd Computer_Architecture_Projects
   ```
2. **Navigate to the project folder**:

   ```bash
   cd Computer_Architecture_Projects
   ```
3. **Run the simulation**:

   - Open your Verilog simulator.
   - Load the project files.
   - Compile and run the simulation to observe the behavior of the RISC5 processor.
4. **Analyze the results**:

   - Review the waveforms or output logs generated by the simulation.
   - Compare the results with the expected outcomes provided in the project descriptions.

## Contributing

Contributions to improve the code or add new features are welcome. Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## Acknowledgments

- Professor Saeed Safari, for his guidance and teaching throughout the course.
- University of Tehran, for providing the resources and environment to carry out this work.
