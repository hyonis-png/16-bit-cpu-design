This project implements a minimal single-cycle 16-bit CPU in Verilog. The goal of the design is to demonstrate clean RTL structure, modular design, and correct system-level integration, rather than instruction-set complexity or performance optimization.

The CPU follows a simple fetch → decode → execute → write-back datapath and is built from independently testable modules that are wired together in a top-level design.
