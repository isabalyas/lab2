.section .note.GNU-stack,"",@progbits.
text
.LC0:
    .string "%u"
.LC1:
    .string "%u %u %u\n"
    
.globl main
.type main, @function

main:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $48, %rsp
    
    # Ввод n
    leaq    -4(%rbp), %rsi
    leaq    .LC0(%rip), %rdi
    movl    $0, %eax
    call    scanf
    
    movl    $0, -8(%rbp)        # i = 0
    
.L0:
    movl    -8(%rbp), %eax
    cmpl    -4(%rbp), %eax
    jge     .L3
    
    # Ввод числа
    leaq    -12(%rbp), %rsi
    leaq    .LC0(%rip), %rdi
    movl    $0, %eax
    call    scanf
    
    # sum = 0, product = 1
    movl    $0, -16(%rbp)
    movl    $1, -20(%rbp)
    movl    -12(%rbp), %eax
    movl    %eax, -24(%rbp)     # temp = число
    
    # Если число 0
    cmpl    $0, -24(%rbp)
    jne     .L1
    movl    $0, -20(%rbp)
    jmp     .L2
    
.L1:
    cmpl    $0, -24(%rbp)
    je      .L2
    
    movl    -24(%rbp), %eax
    movl    $10, %ecx
    movl    $0, %edx
    divl    %ecx                # eax = temp/10, edx = temp%10
    
    addl    %edx, -16(%rbp)     # sum += digit
    
    # Умножение
    movl    -20(%rbp), %r8d
    imull   %edx, %r8d
    movl    %r8d, -20(%rbp)
    
    movl    %eax, -24(%rbp)     # temp = temp/10
    jmp     .L1
    
.L2:
    # |sum - product|
    movl    -16(%rbp), %eax
    subl    -20(%rbp), %eax
    movl    %eax, %edx
    negl    %edx
    testl   %eax, %eax
    cmovs   %edx, %eax
    movl    %eax, -28(%rbp)
    
    # Вывод
    movl    -28(%rbp), %ecx
    movl    -20(%rbp), %edx
    movl    -16(%rbp), %esi
    leaq    .LC1(%rip), %rdi
    movl    $0, %eax
    call    printf
    
    addl    $1, -8(%rbp)
    jmp     .L0

.L3:
    movl    $0, %eax
    leave
    ret