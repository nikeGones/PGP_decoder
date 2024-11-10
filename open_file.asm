section .data
    filename db "message_1.txt", 0
    open_msg db "Ouverture du fichier...", 10, 0

section .text
    global _start

_start:
    ; Affiche un message d'ouverture
    mov eax, 4              ; syscall pour écrire
    mov ebx, 1              ; écriture sur la sortie standard
    mov ecx, open_msg       ; adresse du message
    mov edx, 20             ; taille du message
    int 0x80                ; appel système

    ; Tente d'ouvrir le fichier en lecture seule
    mov eax, 5              ; syscall pour open
    mov ebx, filename       ; nom du fichier
    mov ecx, 0              ; lecture seule
    int 0x80                ; appel système

    ; Fermeture du programme
    mov eax, 1              ; syscall pour exit
    xor ebx, ebx            ; code de sortie 0
    int 0x80
