.orig x3000

	lea r0, intro
	puts
	ld r0, enter
userloop
	getc
	putc
	add r1, r0, #-10
	brz function
	add r5, r0, #0
	brnzp userloop
function
	add r0, r5, #0

	and r5, r5, #0
	add r5,r5, r0
	
	and r1,r1, #0
	ld r2, count
	not r2,r2
	add r2,r2, #1

loop	
	add r3,r1,r2
	brz loop_out
	lea r3,binary
	add r3,r3,r1
	ldr r4,r3,#0
	and r4,r4,r5
	brz no_bit
	ld r0, ascii_one
	out
	add r1,r1,#1
	brnzp loop
no_bit
	ld r0, ascii_zero
	out
	add r1,r1,#1
	brnzp loop
loop_out
	halt

binary  .FILL   b0000000000001000
        .FILL   b0000000000000100
        .FILL   b0000000000000010
        .FILL   b0000000000000001
        .FILL   b0000000000000000

enter      .FILL   x0010
ascii_zero  .FILL   x0030
ascii_one   .FILL   x0031
count  .FILL   x04    
intro      .stringz "Enter a digit: "

.END