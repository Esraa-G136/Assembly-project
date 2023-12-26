;assembly project by Esraa GamalElsayed Elsayed Salah & Asmaa Yassen Mohamed

.model small
.data
 arr db 1,2,4,0,5,8,9
 msg1 db  "The array of elements we have is :0,1,2,4,5,8,9 ","$"
 msg2 db  "if the result is 1 it means the element is 'found' and 0 is for 'notfound'  ","$"
 msg3 db  "Enter the element you search for  ","$"
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
    
 call BinarySearch

 ; Display the result
 
 MOV AH,02H
 MOV DL ,result
 ADD DL,30H
 INT 21H

 
 ;  user input to close

 
 .exit
 main endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 drawsquare proc near
;display video mode
mov ah,0
mov al,13h
int 10h

;position and color
mov ah,0ch
mov al,10
mov cx ,10
mov dx,50
int 21h


;the length
mov bl,20
;first horizontal line
_1:
int 10h
inc cx
dec bl
jnz _1

;the lenth
mov bl,20
;first vertical line
_2:
int 10h
inc dx
dec bl
jnz _2

;the lenth
mov bl,20
;second horizontal line
_3:
int 10h
dec cx
dec bl
jnz _3

;the lenth
mov bl,20
;second vertical line
_4:
int 10h
dec dx
dec bl
jnz _4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;the 2 square

mov cx ,30
mov dx,50

;the lenth
mov bl,20
;first horizontal line
_1x2:
int 10h
inc cx
dec bl
jnz _1x2

;the lenth
mov bl,20
;first vertical line
_2x2:
int 10h
inc dx
dec bl
jnz _2x2

;the lenth
mov bl,20
;second horizontal line
_3x2:
int 10h
dec cx
dec bl
jnz _3x2

;the lenth
mov bl,20
;second vertical line
_4x2:
int 10h
dec dx
dec bl
jnz _4x2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;the 3 square

mov cx ,50
mov dx,50

;the lenth
mov bl,20
;first horizontal line
_1x3:
int 10h
inc cx
dec bl
jnz _1x3

;the lenth
mov bl,20
;first vertical line
_2x3:
int 10h
inc dx
dec bl
jnz _2x3

;the lenth
mov bl,20
;second horizontal line
_3x3:
int 10h
dec cx
dec bl
jnz _3x3

;the lenth
mov bl,20
;second vertical line
_4x3:
int 10h
dec dx
dec bl
jnz _4x3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;the 4 square

mov cx ,70
mov dx,50

;the lenth
mov bl,20
;first horizental line
_1x4:
int 10h
inc cx
dec bl
jnz _1x4

;the lenth
mov bl,20
;first vertical line
_2x4:
int 10h
inc dx
dec bl
jnz _2x4

;the lenth
mov bl,20
;second horizental line
_3x4:
int 10h
dec cx
dec bl
jnz _3x4

;the lenth
mov bl,20
;second vertical line
_4x4:
int 10h
dec dx
dec bl
jnz _4x4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;the 5 square

mov cx ,90
mov dx,50

;the lenth
mov bl,20
;first horizental line
_1x5:
int 10h
inc cx
dec bl
jnz _1x5

;the lenth
mov bl,20
;first vertical line
_2x5:
int 10h
inc dx
dec bl
jnz _2x5

;the lenth
mov bl,20
;second horizental line
_3x5:
int 10h
dec cx
dec bl
jnz _3x5

;the lenth
mov bl,20
;second vertical line
_4x5:
int 10h
dec dx
dec bl
jnz _4x5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;the 6 square

mov cx ,110
mov dx,50

;the lenth
mov bl,20
;first horizental line
_1x6:
int 10h
inc cx
dec bl
jnz _1x6

;the lenth
mov bl,20
;first vertical line
_2x6:
int 10h
inc dx
dec bl
jnz _2x6

;the lenth
mov bl,20
;second horizental line
_3x6:
int 10h
dec cx
dec bl
jnz _3x6

;the lenth
mov bl,20
;second vertical line
_4x6:
int 10h
dec dx
dec bl
jnz _4x6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;the 7 square

mov cx ,130
mov dx,50

;the lenth
mov bl,20
;first horizental line
_1x7:
int 10h
inc cx
dec bl
jnz _1x7

;the lenth
mov bl,20
;first vertical line
_2x7:
int 10h
inc dx
dec bl
jnz _2x7

;the lenth
mov bl,20
;second horizental line
_3x7:
int 10h
dec cx
dec bl
jnz _3x7

;the lenth
mov bl,20
;second vertical line
_4x7:
int 10h
dec dx
dec bl
jnz _4x7


ret

drawsquare endp
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
 BinarySearch proc near
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
        
    
    less_than_target:
    mov si , bx  ; Move to the right half
    inc si  
    jmp while_loop

    greater_than_target:
    mov di, bx   ; Move to the left half
    dec di 
    jmp while_loop

    done:
    mov result,0
    ret

    found:
    mov result,1
    ret

BinarySearch endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
newline proc near 
    lea dx,line
    mov ah,09h
    int 21h
    ret
newline endp
end main

