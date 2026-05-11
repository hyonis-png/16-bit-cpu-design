16bitpipelined contains the core CPU logic with basic pipelining in Vivado. propa16bitpipelined is the top-level module specifically configured for the Arty S7 hardware demo

image of waveform
<img width="1061" height="702" alt="image" src="https://github.com/user-attachments/assets/d622fa4e-7d64-4904-b3d7-68901d5031c2" />

## CPU Simulation Waveform Verification

The waveform below verifies the correct operation of the custom 16-bit pipelined CPU before FPGA deployment.

### Observed Signals

**Program Counter (PC)**
The program counter increments correctly, confirming that the instruction fetch stage is operating as expected.

```text
PC = 0x02
```

This indicates that the processor has successfully advanced through multiple instruction cycles.

---

**Instruction Fetch vs Pipeline Register**
Two different instruction values are visible:

```text
instruction = 0x0688
IF_ID_instruction = 0x0448
```

This confirms proper pipelined behavior. The instruction memory output (`instruction`) represents the currently fetched instruction, while `IF_ID_instruction` contains the previously latched instruction in the fetch/decode pipeline register.

This demonstrates correct stage separation between:

* Instruction Fetch (IF)
* Instruction Decode (ID)

---

**Register File Reads**
The ALU input operands are:

```text
ID_EX_A = 0x0005
ID_EX_B = 0x0005
```

This verifies that the register file is correctly reading source operands and passing them into the execute stage.

---

**ALU Execution Result**
The ALU output is:

```text
writevalue = 0x000A
```

Hexadecimal `0x000A` corresponds to decimal `10`, confirming successful arithmetic execution:

```text
5 + 5 = 10
```

This validates:

* operand forwarding into execute stage
* ALU arithmetic correctness
* execute stage functionality

---

**Reset Behavior**
Reset is inactive:

```text
reset = 0
```

This confirms that the processor is running normally rather than being held in reset.

---

## Verification Summary

This waveform confirms correct operation of the major CPU subsystems:

✅ Program Counter incrementing
✅ Instruction fetch from ROM
✅ Pipeline register staging (IF → ID → EX)
✅ Register file operand reads
✅ ALU execution correctness
✅ End-to-end datapath functionality

This simulation served as the primary functional verification step before deploying the processor to the Digilent Arty S7 FPGA for live hardware testing.
