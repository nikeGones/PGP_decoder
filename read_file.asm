section .data
    filename db "message_1.txt", 0
    read_msg db "Lecture du fichier...", 10, 0
    buffer times 64 db 0

section .text
    global _start

_start:
    ; Affiche un message de lecture
    mov eax, 4
    mov ebx, 1
    mov ecx, read_msg
    mov edx, 20
    int 0x80

    ; Ouvre le fichier
    mov eax, 5
    mov ebx, filename
    mov ecx, 0
    int 0x80
    mov ebx, eax          ; sauvegarde le descripteur de fichier

    ; Lit le fichier
    mov eax, 3
    mov ecx, buffer
    mov edx, 64
    int 0x80

    ; Affiche le contenu lu
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    int 0x80

    ; Fermeture du programme
    mov eax, 1
    xor ebx, ebx
    int 0x80
