%include "asm_io.inc"
global  _main
    section .text

_main:
   MOV EBX, 2
   MOV ECX, 0
   MOV EAX, 5
RPT:
	ADD ECX, EAX
	SUB EBX, 1
	JNZ RPT
	MOV EAX, ECX
	call print_int
	RET