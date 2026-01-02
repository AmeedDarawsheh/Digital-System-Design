# Digital System Design

A collection of RTL designs and digital system modules written in VHDL.

## Structure

```
Digital-System-Design/
├── Adders/          # Arithmetic circuits
├── MUX/             # Multiplexers
├── Decoders/        # Decoder circuits
├── Sequential/      # FSMs and sequential logic
└── Notes/           # Learning notes
```

## Modules

| Folder     | Modules                |
| ---------- | ---------------------- |
| Adders     | Half Adder, Full Adder |
| MUX        | 4-to-1 Multiplexer     |
| Decoders   | 2-to-4 Decoder         |
| Sequential | GCD FSM                |

## Running Simulations

Using GHDL:

```bash
ghdl -a rtl_file.vhd
ghdl -a tb_file.vhd
ghdl -e tb_entity_name
ghdl -r tb_entity_name --vcd=wave.vcd
```

## Author

Ameed Darawsheh

