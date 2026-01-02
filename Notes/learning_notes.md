# Learning Notes

## Digital Design Concepts

### Combinational vs Sequential Logic

- **Combinational**: Output depends only on current inputs (Adders, MUX, Decoders)
- **Sequential**: Output depends on current inputs + previous state (FSM, Counters)

### Key Modules

| Module     | Type          | Description              |
| ---------- | ------------- | ------------------------ |
| Half Adder | Combinational | Adds 2 bits              |
| Full Adder | Combinational | Adds 3 bits (with carry) |
| MUX        | Combinational | Selects one of N inputs  |
| Decoder    | Combinational | Binary to one-hot        |
| GCD FSM    | Sequential    | Computes GCD using FSM   |

### VHDL Tips

- Use `STD_LOGIC` for single bits
- Use `STD_LOGIC_VECTOR` for buses
- Use `WITH-SELECT` for MUX behavior
- Use `PROCESS` for sequential logic
