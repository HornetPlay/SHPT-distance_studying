section .text
   global _start        ; должно быть объявлено для использования gcc
	
_start:                 ; сообщаем линкеру входную точку
mov ax, 5h
mov bx, 5h

CMP AX,	BX    
JE OUTEQ    ; если AX равно BX
CMP AX,	BX    
JG OUTGR    ; если AX больше BX
CMP AX,	BX    
JL OUTLS    ; если AX меньше BX


OUTEQ:
    mov	edx,len_eq       
    mov	ecx,eq_msg      
    mov	ebx,1           
    mov	eax,4           
    int	0x80            

    mov	eax,1           
    int	0x80             

OUTGR:
    mov	edx,len_gr      
    mov	ecx,gr_msg      
    mov	ebx,1           
    mov	eax,4           
    int	0x80            
	
    mov	eax,1           
    int	0x80             

OUTLS:
    mov	edx,len_ls      ; длина строки 
    mov	ecx,ls_msg      ; строка
    mov	ebx,1           ; дескриптор файла (stdout)
    mov	eax,4           ; номер системного вызова (sys_write)
    int	0x80            ; вызов ядра

    mov	eax,1           ; номер системного вызова (sys_exit)
    int	0x80            ; вызов ядра 


section   .data

    eq_msg db  '(OUTEQ) АХ equals ВХ!'    ; сообщение если равно
    len_eq  equ  $ - eq_msg

    gr_msg db  '(OUTGR) АХ is greater than ВХ!'    ; сообщение если больше
    len_gr  equ  $ - gr_msg

    ls_msg db  '(OUTLS) АХ is less than ВХ!'    ; сообщение если меньше
    len_ls  equ  $ - ls_msg