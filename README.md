# FPGA Digital Stopwatch ⏱️

This project implements a modular, finite state machine (FSM)-based digital stopwatch in Verilog for FPGA development boards (e.g., Xilinx Spartan-5).

## Features

- **FSM-based core:** Explicit control states for Start, Pause, and Reset.
- **Modular design:** Separate FSM and synchronous counter modules.
- **Parametric counters:** Easily extend seconds/minutes range.
- **Simulation ready:** Comprehensive SystemVerilog testbench.
- **FPGA ready:** Synthesizable for popular Xilinx boards.

## State Diagram

The stopwatch FSM logic is illustrated below:

[image:1]

**States & Transitions:**
- `IDLE` (reset state): Waits for start command.
- `RUN` (counting): Counts up in seconds/minutes.
- `PAUSE` (hold): Freezes current count until resumed or reset.
- `rst=1` (reset): Returns system to `IDLE` from any state.
- Transitions controlled by `start`, `pause` (or `stop`) inputs.

## Directory Structure

digital_stopwatch/
│
├── src/
│ ├── stopwatch_fsm.v
│ ├── sync_counter.v
│ └── stopwatch_top.v
├── tb/
│ └── stopwatch_tb.sv
├── constraints/
│ └── stopwatch.ucf // Example (FPGA pin mappings)
└── doc/
└── fsm_diagram.png // Provided above

## Getting Started

1. **Simulate:**  
   Use `iverilog`, Vivado, or your preferred simulator with the testbench in `/tb`.

2. **Synthesize on FPGA:**  
   Import sources from `/src` and constraints from `/constraints` into Xilinx ISE or Vivado. Adjust for your specific Spartan-5 board pins as needed.

3. **Test and Extend:**  
   Wire inputs to pushbuttons/switches and outputs to 7-segment or LED display logic of your choice.

---

For more details, see device-specific notes or open an issue in the repository!