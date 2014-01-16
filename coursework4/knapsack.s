        b main
list1   defw 10, 25, 13, 44, 9, 15, 6, 27, 36, 42       ;all the test lists from the specification for the ease of use of the marker
list2   defw 4, 15, 47, 23, 18, 10, 22, 6, 37, 28
list3   defw 40, 19, 17, 23, 2, 43, 35, 21, 4, 34
list4   defw 4, 25, 41, 48, 34, 20, 10, 19, 7, 16
list5   defw 39, 6, 10, 34, 8, 17, 23, 49, 38, 12
nl      defb "\n\0"
mesg1   defb "Largest pair is \0"
mesg2   defb " and \0"
mesg3   defb ", with a total of \0"
        align


main    adr r7, list1                   ; load list address to register for easy access ; just change this to use different list
for1    cmp r1, #40                     ; for condition
        bge for1skp                     ; jump to end
        add r2, r1, #4                  ; for2 init
for2            cmp r2, #40             ; cond2
                bge for2skp             ; jump back to first for
                ldr r3, [r7, r1]        ; r3=list[i]; (r3=sum)
                ldr r0, [r7, r2]        ; r0=list[j]
                add r3, r3, r0          ; sum+=r0 ; (r0=list[j])
                cmp r3, r4              ; if(sum > max && ...
                blt ifskip              ; lazy eval
                cmp r3, #50             ; sum <= 50)
                bgt ifskip              ;
                mov r4, r3              ; max = sum
                mov r5, r1              ; pos1 = i
                mov r6, r2              ; pos2 = j
ifskip          add r2, r2, #4          ; increment j
                b for2                  ; loop
for2skp add r1, r1, #4                  ; increment i
        b for1                          ; loop
for1skp adr r0, mesg1                   ; 
        swi 3                           ; print first part of result message
        ldr r0, [r7, r5]                ;
        swi 4                           ; print list[pos1]
        adr r0, mesg2                   ;
        swi 3                           ; print second part of result message
        ldr r0, [r7, r6]                ;
        swi 4                           ; print list[pos2]
        adr r0, mesg3                   ;
        swi 3                           ; print third part of message
        mov r0, r4                      ;
        swi 4                           ; print max
        adr r0, nl                      ;
        swi 3                           ; print newline
        swi 2                           ;