
global _start

section .text

_start:
  LOAD_A_IMM 0x10      ; Load A with value at memory address 0x10
  LOAD_B 0x11          ; Load B with value at memory address 0x11
  ADD                  ; A = A + B
  STORE_A 0x12         ; Store result in memory address 0x12
  SUB                  ; A = A - B (restoring original value of A)
  STORE_A_IMM 0x13     ; Store A at memory address 0x13
  NAND                 ; A = ~(A and B)
  STORE_A 0x14         ; Store result in memory address 0x14
  XOR                  ; A = A XOR B
  STORE_A 0x15         ; Store result in memory address 0x15

  DEVICE_IN 0x01       ; Read input from device 0x01 into A
  STORE_A 0x16         ; Store input value at memory address 0x16
  DEVICE_OUT 0x02      ; Output A value to device 0x02

  JUMP_IMM 0x05        ; Jump forward 5 instructions
  HALT                 ; (This should be skipped due to jump)
  LOAD_A 0x17          ; Load A from memory address 0x17 (placeholder instruction)
  JUMP 0x17            ; Jump to address stored in 0x17 (not executed due to previous jump)

  JUMP_ZERO 0x02       ; Jump forward 2 instructions if A is zero
  JUMP_NEGA 0x02       ; Jump forward 2 instructions if A is negative
  HALT                 ; Halt the program