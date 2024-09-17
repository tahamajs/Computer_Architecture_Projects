
# Computer Architecture Projects

This repository contains four Verilog-based projects completed as part of the **Computer Architecture** course at the **University of Tehran**. These projects gradually build up the complexity of processor design, starting from a simple arithmetic unit (divider) and advancing to multi-cycle and pipelined RISC5 processor designs.

---

## Project Structure

### CA 1: Divider Implementation

In this project, a **binary divider** is implemented using Verilog to perform division on two 10-bit binary numbers.

#### Key Concepts:

- **Binary Division**: The project implements the classic algorithm for division in binary, where a dividend is divided by a divisor, producing a quotient.
- **Overflow Handling**: Careful consideration is given to prevent overflow errors, which occur when the result exceeds the number of bits allocated.
- **Division by Zero**: A specific mechanism is designed to handle the division by zero, setting a flag or returning a predefined error code.
- **Synchronous Design**: The division logic is implemented synchronously, where the operations are governed by a clock signal, ensuring consistent timing.

#### Learning Outcomes:

- Understanding the basics of **binary arithmetic** and how division differs from addition and multiplication.
- Exploring edge cases such as **overflow** and **division by zero** that need to be handled in hardware logic.
- Learning how to use **control signals** in Verilog for managing different stages of a division process.

---

### CA 2: Single-Cycle RISC5 Processor

In this project, you will design a **single-cycle RISC5 processor** that executes each instruction within a single clock cycle. A single-cycle processor completes an entire instruction, from fetch to write-back, in one cycle.

#### Key Concepts:

- **Single-Cycle Architecture**: The processor fetches, decodes, executes, accesses memory, and writes back results in a single clock cycle, requiring each instruction to complete in one go.
- **Instruction Set Architecture (ISA)**: The processor supports the RISC5 instruction set, which includes:

  - **R-Type** (register-register operations like `add`, `sub`, `and`, `or`)
  - **I-Type** (immediate operations like `addi`, `lw`)
  - **S-Type** (store operations like `sw`)
  - **B-Type** (branch operations like `beq`, `bne`)
  - **U-Type** (upper immediate operations like `lui`)
  - **J-Type** (jump operations like `jal`)
- **Datapath Design**: The single-cycle processor has a datapath that connects various functional units (ALU, register file, memory), ensuring each unit operates within one clock cycle.
- **Control Unit**: A control unit is designed to generate appropriate control signals that direct the operations of the processor for each instruction.

#### Learning Outcomes:

- Understanding how to implement **control signals** for a simple instruction set.
- Learning the limitations of **single-cycle processors**, such as the need for all instructions to take the same amount of time, which can lead to inefficient clock speeds for complex operations.
- Gaining practical knowledge of **datapath design** for processors.

---

### CA 3: Multi-Cycle RISC5 Processor

This project builds upon the single-cycle design by implementing a **multi-cycle RISC5 processor**. In a multi-cycle processor, instructions are broken down into multiple steps, each taking one or more clock cycles, allowing for more efficient resource use and shorter cycle times.

#### Key Concepts:

- **Multi-Cycle Architecture**: Unlike the single-cycle design, where each instruction must complete in one clock cycle, the multi-cycle processor allows each instruction to be broken down into several stages, such as instruction fetch, decode, execution, memory access, and write-back, each taking a cycle or more.
- **Cycle Efficiency**: By spreading an instruction over multiple cycles, the critical path (the longest delay in the datapath) is shortened, allowing the clock to run faster, improving overall efficiency.
- **Resource Sharing**: Multi-cycle processors reuse hardware resources like the ALU or memory over several cycles, which reduces hardware complexity.

#### Learning Outcomes:

- Gaining a deep understanding of **control sequencing** in a multi-cycle processor, as different stages need to be carefully orchestrated over time.
- Learning about **resource efficiency** in hardware design, as resources are shared across different stages rather than being duplicated for each cycle.
- Implementing state machines to manage the transitions between stages of instruction execution.

---

### CA 4: Pipelined RISC5 Processor

In this project, the processor is extended to include **pipelining**, a technique used in most modern processors to improve instruction throughput by overlapping the execution of multiple instructions.

#### Key Concepts:

- **Pipelining**: This concept allows the processor to start executing a new instruction before the previous one has finished, by dividing the processor into stages (fetch, decode, execute, memory access, write-back) and passing instructions through these stages in parallel.
- **Hazards**: Pipelining introduces hazards such as:
  - **Data Hazards**: Occur when instructions depend on the results of previous instructions still in the pipeline. Solutions include **data forwarding** and **stalling**.
  - **Control Hazards**: Occur when the pipeline makes decisions based on branch instructions. Solutions include **branch prediction** and **delayed branching**.
- **Instruction Throughput**: The benefit of pipelining is that the instruction throughput increases, meaning that the processor can complete more instructions per unit of time.

#### Learning Outcomes:

- Understanding how to implement **pipelining** in a processor design, dividing instructions into distinct stages that operate in parallel.
- Learning how to manage **pipeline hazards** (data hazards, control hazards) through techniques such as **stalling, forwarding, and branch prediction**.
- Gaining insights into how **modern CPUs** leverage pipelining to maximize instruction throughput and overall performance.

---

## How to Run

1. Clone the repository to your local machine.
2. Navigate to the appropriate project directory (CA1, CA2, CA3, or CA4).
3. Compile and simulate the Verilog code using your preferred Verilog simulator (e.g., ModelSim, Verilator).
4. Follow the specific instructions in each project folder for running the test cases and observing the outputs.

---

## Directory Structure

- **CA 1/**: Contains Verilog code and documentation for the binary divider.
- **CA 2/**: Contains Verilog code and documentation for the single-cycle RISC5 processor.
- **CA 3/**: Contains Verilog code and documentation for the multi-cycle RISC5 processor.
- **CA 4/**: Contains Verilog code and documentation for the pipelined RISC5 processor.
- **EXTRA/**: Additional resources and reports.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Let me know if you need further revisions or any additional details!
