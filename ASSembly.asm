;assembly project by Esraa GamalElsayed Elsayed Salah & Asmaa Yassen Mohamed

.model small
.data
 arr db 1,2,4,0,5,8,9
 msg1 db  "The array of elements we have is :1,2,4,0,5,8,9 ","$"
 msg2 db  "if the result is 1 it means the element is 'found' and 0 is for 'not found'  ","$"
 msg3 db  "Emter the element you search for  ","$"
 line db 0dh,0ah ,"$"
 target db ?
 result db ?
 
.code
 main proc far
 .startup
 lea dx,msg1
 mov ah,09h
 int 21h
 
 call newline
 call newline
 
 lea dx,msg2
 mov ah,09h
 int 21h
 
 call newline
 call newline
 
 lea dx,msg3
 mov ah,09h
 int 21h
 
 mov ah,01h
 int 21h
 
 call newline
 call newline
 
 mov target,al
 
 ; Initialize binary search
 mov cl, target
 mov si, 0
 mov di, 6
    
 call binarysearch

 ; Display the result
 
 MOV AH,02H
 MOV DL ,result
 ADD DL,30H
 INT 21H

 
 ;  user input to close

 
 .exit
 main endp
 
 
 binarysearch proc near
 ; Binary Search Algorithm
 
 while_loop:
    cmp si, di
    jg  done; if si > di, search is complete and the element is not found
   
   
    ; Calculate middle index
    mov bx, si
    add bx, di
    shr bx, 1 ;to div the sum by 2

    ; comparing the array element wz z middle index one
    mov al, arr[bx]

    cmp al, cl
    je found
    jb less_than_target ; if array[mid] < target, search right half
    ja greater_than_target ; if array[mid] > target, search left half
    
    
    found:
    mov result,1
    ret

    less_than_target:
    inc arr[bx]   ; Move to the right half
    mov si , word ptr arr[bx]
    jmp while_loop

    greater_than_target:
    dec di ; Move to the left half
    jmp while_loop

    done:
    mov result,0
    ret
BinarySearch endp

newline proc near 
    lea dx,line
    mov ah,09h
    int 21h
    ret
newline endp
end main

