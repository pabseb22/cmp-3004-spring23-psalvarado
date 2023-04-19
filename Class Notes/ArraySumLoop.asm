; Program to Perfom the Array Sum in Assembly using a loop

section .data
array dd 1, 2, 4, 8, 16   ; Random Values of the array to be sum (Int of 4 bytes)
len_array equ 5           ; number of elements in the array

;Info to print the result:
msg db  "Sum of the array is: "
len equ $ - msg

section .bss
sum resd 1                 ; 4 bytes for the sum variable

section .text

global _start

_start:
    xor eax, eax          ; We first need to initialize the sum to zero
    mov dword [sum], eax

    ; Data to estart the loop:
    mov ecx, len_array    ; Account for the number of iterations
    mov esi, array        ; esi = pointer to the array

loop_beginning:
    cmp ecx, 0              ; To check if we've reached the end of the loop
    je loop_end             ; Simulates the End Of the loop if reached by juming to loop_end

    add eax, dword [esi]    ; To add the array element to the sum
    add esi, 4              ; Move the pointer to the next element by 4 bytes since they are dd
    dec ecx                 ; decrement the iteration counter
    jmp loop_start          ; Jumps back to the loop beginning

loop_end:

    ; Save the result in the sum variable
    mov dword [sum], eax

    ;Printing the final result of the sum
    mov     ecx, msg
    mov     edx, len
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     ecx, sum
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Exit the program
    mov eax, 1              ; system call code for exit
    xor ebx, ebx            
    int 0x80                
