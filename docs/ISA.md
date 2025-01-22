
# Instruction Set

|Hex|Opcode    |Notes                               |
|---|----------|------------------------------------|
|0x0|HALT      |Halts the Computer                  |
|0x1|LOAD_A    |Loads A from IMM                    |
|0x2|LOAD_B    |Loads B from IMM                    |
|0x3|LOAD_OUT  |Loads OUT from IMM                  |
|0x4|STORE_A   |Stores A from IMM                   |
|0x5|ADD       |A := A + B                          |
|0x6|SUB       |A := A - B                          |
|0x7|JUMP      |Jumps to IMM                        |
|0x8|JUMP_ZERO |Jumps to IMM if zero-flag is on     |
|0x9|JUMP_NEGA |Jumps to IMM if negative-flag is on |
