
# Computer Architecture Course - University of Tehran

## Overview

This repository contains Verilog projects for the Computer Architecture course taught by Professor Saeed Safari at the University of Tehran. The projects focus on implementing the RISC5 processor in three architectures: single cycle, multi-cycle, and pipelined.

## Project Structure

* **CA 1** : Divider implementation.
* **CA 2** : Single Cycle RISC5 Processor.
* **CA 3** : Multi-Cycle RISC5 Processor.
* **CA 4** : Pipelined RISC5 Processor.
* **EXTRA** : Additional resources and extra work.

## Project Descriptions

### CA 1: Single Cycle RISC5 Processor

Implement a single-cycle RISC5 processor in Verilog, focusing on basic arithmetic operations, especially division of 10-bit binary numbers. Handle overflow and division by zero conditions.

### CA 2: Multi-Cycle RISC5 Processor

Extend the single-cycle processor to a multi-cycle RISC5 processor, executing instructions over multiple clock cycles to optimize resource usage and reduce critical path delays. Supports RISC-V instruction types: R, I, S, J, B, and U.

### CA 3: Pipelined RISC5 Processor

Develop a pipelined RISC5 processor to overlap instruction execution stages, increasing throughput. Handle data, control, and structural hazards with techniques like forwarding, stalling, and branch prediction.

### CA 4: Pipelined RISC5 Processor with Enhanced Features

Enhance the pipelined processor with features like branch prediction, memory hierarchy optimizations, and exception handling. Focus on performance improvements and robust pipeline operation under various conditions.

## Running the Simulations

1. Clone the repository:
   <pre><div class="dark bg-gray-950 contain-inline-size rounded-md border-[0.5px] border-token-border-medium"><div class="flex items-center relative text-token-text-secondary bg-token-main-surface-secondary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><div class="flex items-center"><span class="" data-state="closed"><button class="flex gap-1 items-center"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon-sm"><path fill="currentColor" fill-rule="evenodd" d="M7 5a3 3 0 0 1 3-3h9a3 3 0 0 1 3 3v9a3 3 0 0 1-3 3h-2v2a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3v-9a3 3 0 0 1 3-3h2zm2 2h5a3 3 0 0 1 3 3v5h2a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1h-9a1 1 0 0 0-1 1zM5 9a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-9a1 1 0 0 0-1-1z" clip-rule="evenodd"></path></svg>Copy code</button></span></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="!whitespace-pre hljs language-bash">git clone https://github.com/tahamajs/Computer_Architecture_Projects.git
   cd Computer_Architecture_Projects
   </code></div></div></pre>
2. Navigate to the project folder and run simulations using a Verilog simulator like ModelSim or Xilinx ISE.

## Contributing

Contributions are welcome! Fork the repo, create a feature branch, make your changes, and submit a pull request.

## Acknowledgments

Thanks to Professor Saeed Safari and the University of Tehran for their support and resources.

4o

##### You said:

no CA 1: Divider implementation.
 ca1 is Divider implementation

###### ChatGPT said:

My apologies for the mistake. Here's the corrected and shortened version of the README:

---

# Computer Architecture Course - University of Tehran

## Overview

This repository contains Verilog projects for the Computer Architecture course taught by Professor Saeed Safari at the University of Tehran. The projects focus on implementing the RISC5 processor in various architectures: single cycle, multi-cycle, and pipelined.

## Project Structure

* **CA 1** : Divider Implementation.
* **CA 2** : Single Cycle RISC5 Processor.
* **CA 3** : Multi-Cycle RISC5 Processor.
* **CA 4** : Pipelined RISC5 Processor.
* **EXTRA** : Additional resources and work.

## Project Descriptions

### CA 1: Divider Implementation

Implement a divider in Verilog, focusing on dividing two 10-bit binary numbers and handling overflow and division by zero conditions.

### CA 2: Single Cycle RISC5 Processor

Develop a single-cycle RISC5 processor, capable of performing basic arithmetic and logical operations.

### CA 3: Multi-Cycle RISC5 Processor

Extend the processor to a multi-cycle design, executing instructions over multiple clock cycles for efficiency.

### CA 4: Pipelined RISC5 Processor

Implement a pipelined processor to increase instruction throughput by overlapping execution stages, addressing hazards like data and control dependencies.

## Running the Simulations

1. Clone the repository:
   <pre><div class="dark bg-gray-950 contain-inline-size rounded-md border-[0.5px] border-token-border-medium"><div class="flex items-center relative text-token-text-secondary bg-token-main-surface-secondary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><div class="flex items-center"><span class="" data-state="closed"><button class="flex gap-1 items-center"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon-sm"><path fill="currentColor" fill-rule="evenodd" d="M7 5a3 3 0 0 1 3-3h9a3 3 0 0 1 3 3v9a3 3 0 0 1-3 3h-2v2a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3v-9a3 3 0 0 1 3-3h2zm2 2h5a3 3 0 0 1 3 3v5h2a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1h-9a1 1 0 0 0-1 1zM5 9a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-9a1 1 0 0 0-1-1z" clip-rule="evenodd"></path></svg>Copy code</button></span></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="!whitespace-pre hljs language-bash">git clone https://github.com/tahamajs/Computer_Architecture_Projects.git
   cd Computer_Architecture_Projects
   </code></div></div></pre>
2. Use a Verilog simulator (e.g., ModelSim, Xilinx ISE) to run simulations.
