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

![FSM State Diagram](img/statediagram.jpg)

**States & Transitions:**
- `IDLE` (reset state): Waits for start command.
- `RUN` (counting): Counts up in seconds/minutes.
- `PAUSE` (hold): Freezes current count until resumed or reset.
- `rst=1` (reset): Returns system to `IDLE` from any state.
- Transitions controlled by `start`, `pause` (or `stop`) inputs.

## Directory Structure

digital_stopwatch/
│
├── README.md
├── src/
│   ├── stopwatch_fsm.v
│   ├── sync_counter.v
│   └── stopwatch_top.v
├── tb/
│   └── stopwatch_tb.sv
└── img/
    └── statediagram.jpg

---

For more details, see device-specific notes or open an issue in the repository!