 .MODEL SMALL

    .STACK 100h

    .DATA   
    Finished DB 10, 13, 'Loop x 100 finished.  Congratulations Alex! $', 10, 13
    NotFinished DB 10, 13, 'Loop is not Finished $', 10, 13

    .CODE

    MAIN PROC

            MOV AX, @data            ; Required at the start of every program (inside your main procedure, from what I've seen)
            MOV DS, AX

            MOV CX, 100              ; Set CX to 100
            MOV BX, 0                ; Counter (for double-verification, I guess...lol)

    StrtLoop:                        ; When a loop starts, it does CX-- (subtracts 1 from CX)   

            INC BX
            CMP BX, 100
            JB  DispNotFinished            ; This does BX++, which increments BX by 1

    LOOP StrtLoop                     ; Go back to StrtLoop label

            CMP BX, 100              ; Compare BX to 100...
            JE DispMsg               ; Jump-if-Equal...CMP BX, 100 sets flags, and if they are set,
                                     ;  JE will Jump you to DispMsg (to get "congratulations" message).

            JMP SkipMsg              ; Jump to the SkipMsg label (so you don't see the "congratulations" message).

    DispMsg:                         ; If BX = 100, you JE here.
            MOV AH, 09H              ; Displays the message stored in the defined byte "Finished"
            MOV DX, OFFSET Finished
            INT 21H
    SkipMsg:                         ; If BX != 100, you JMP here.
            MOV AL, 0h               ; Op code to exit to DOS from the assembler.
            MOV AH, 4CH
            INT 21H
            
    DispNotFinished:                         ; If BX = 100, you JE here.
            MOV AH, 09H              ; Displays the message stored in the defined byte "NotFinished"
            MOV DX, OFFSET NotFinished
            INT 21H
            JP StrtLoop

    MAIN ENDP
    END MAIN