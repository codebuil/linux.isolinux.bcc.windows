bits 32
org 101000h
mov eax,21cd4cffh
mov edi,0b8000h
mov ax,0
mov ds,ax
mov ah,17h
fors:
	call check
	cmp al,0
	jnz fors	
forss:
	mov esi,kemap
	call key
	cmp al,1
	jz forssss
	mov edx,0
	mov dl,al
	add esi,edx
	ds	
	mov al,[esi] 
	ds
	mov [edi],ax
	inc edi
	inc edi
forsss:
	call check
	cmp al,0
	jz forsss
	jmp fors
forssss:
	
ret
ret
ret
check:
	in al,60h
	and al,128
	ret
key:
	in al,60h
	ret
kemap db "==1234567890-===qwertyuiop====asdfghjkl====\zxcvbnm,.;/==== "