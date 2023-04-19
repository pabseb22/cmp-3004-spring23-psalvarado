DATA SEGMENT USE16
MESG DB 'Hello word','$'
myArray dd 1, 2, 3, 4, 5   ; example array
N equ 5                    ; number of elements in the array
DATA ENDS

CODE SEGMENT USE16
    ASSUME CS:CODE,DS:DATA
BEG:
    MOV AX,DATA
    MOV DS,AX
    MOV AH,9
    MOV DX, OFFSET MESG
    INT 21H
    MOV AH,4CH
    INT 21H;back to dos

    ; Initialize the sum to zero
    xor eax, eax
    mov dword [sum], eax

    ; Loop over the array elements and add them to the sum
    mov ecx, N              ; ecx = number of iterations
    mov esi, myArray        ; esi = pointer to the array
loop_start:
    cmp ecx, 0              ; check if we've reached the end of the loop
    je loop_end
    add eax, dword [esi]    ; add the current array element to the sum
    add esi, 4              ; move the pointer to the next element
    dec ecx                 ; decrement the iteration counter
    jmp loop_start
loop_end
    ; Store the result in the sum variable
    mov dword [sum], eax

CODE ENDS
END BEG
