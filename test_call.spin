dat
		orgh 0
		org 0

		andn	outb, ##$FFFF
		or	dirb, ##$FFFF

		setq2	#$1FF
		rdlong	0, ##@ltest1

'-------------------------------------------------------------------------------
ctest1		add	led, #1
		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_call	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#ctest2
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ctest2

		cmp	cz, #%11 wz
	if_nz	jmp	#ctest2

		setb	outb, led


'-------------------------------------------------------------------------------
ctest2		add	led, #1
		setcz	#%01 wc, wz
		mov	d, #test_call
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #test_call wz
	if_nz	jmp	#ctest3
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ctest3

		cmp	cz, #%01 wz
	if_nz	jmp	#ctest3

		setb	outb, led


'-------------------------------------------------------------------------------
ctest3		add	led, #1
		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_hcall	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#ctest4
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ctest4

		cmp	cz, #%11 wz
	if_nz	jmp	#ctest4

		setb	outb, led


'-------------------------------------------------------------------------------
ctest4		add	led, #1
		setcz	#%01 wc, wz
		mov	d, ##test_hcall
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##test_hcall wz
	if_nz	jmp	#ctest5
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ctest5

		cmp	cz, #%01 wz
	if_nz	jmp	#ctest5

		setb	outb, led

'-------------------------------------------------------------------------------
ctest5		add	led, #1
		setcz	#%01 wc, wz
		mov	d, ##test_lcall
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##test_lcall wz
	if_nz	jmp	#ctest6
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ctest6

		cmp	cz, #%01 wz
	if_nz	jmp	#ctest6

		setb	outb, led

'-------------------------------------------------------------------------------
ctest6		add	led, #1
		setcz	#%01 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_lcall	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#ctest7
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ctest7

		cmp	cz, #%01 wz
	if_nz	jmp	#ctest7

		setb	outb, led

'-------------------------------------------------------------------------------
ctest7		jmp	#htest1

'-------------------------------------------------------------------------------
test_call	mov	c, #$1FF
		ret

'-------------------------------------------------------------------------------
led		long	-1
d		res	1
c		res	1
cz		res	1
r		res	1
rc		res	1
rcz		res	1


'===============================================================================
		orgh $400


'-------------------------------------------------------------------------------
htest1		add	led, #1
		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_call	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#htest2
	
		cmp	c, #$1FF wz
	if_nz	jmp	#htest2

		cmp	cz, #%11 wz
	if_nz	jmp	#htest2

		setb	outb, led

'-------------------------------------------------------------------------------
htest2		add	led, #1
		setcz	#%01 wc, wz
		mov	d, #test_call
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #test_call wz
	if_nz	jmp	#htest3
	
		cmp	c, #$1FF wz
	if_nz	jmp	#htest3

		cmp	cz, #%01 wz
	if_nz	jmp	#htest3

		setb	outb, led

'-------------------------------------------------------------------------------
htest3		add	led, #1
		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_hcall	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#htest4
	
		cmp	c, #$1FF wz
	if_nz	jmp	#htest4

		cmp	cz, #%11 wz
	if_nz	jmp	#htest4

		setb	outb, led


'-------------------------------------------------------------------------------
htest4		add	led, #1
		setcz	#%01 wc, wz
		mov	d, ##test_hcall
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##test_hcall wz
	if_nz	jmp	#htest5
	
		cmp	c, #$1FF wz
	if_nz	jmp	#htest5

		cmp	cz, #%01 wz
	if_nz	jmp	#htest5

		setb	outb, led

'-------------------------------------------------------------------------------
htest5		add	led, #1
		setcz	#%01 wc, wz
		mov	d, ##test_lcall
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##test_lcall wz
	if_nz	jmp	#htest6
	
		cmp	c, #$1FF wz
	if_nz	jmp	#htest6

		cmp	cz, #%01 wz
	if_nz	jmp	#htest6

		setb	outb, led

'-------------------------------------------------------------------------------
htest6		add	led, #1
		setcz	#%01 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_lcall	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#htest7
	
		cmp	c, #$1FF wz
	if_nz	jmp	#htest7

		cmp	cz, #%01 wz
	if_nz	jmp	#htest7

		setb	outb, led

'-------------------------------------------------------------------------------
htest7		jmp	#ltest1

'-------------------------------------------------------------------------------
test_hcall	mov	c, #$1FF
		ret

'===============================================================================
		org	$200

'-------------------------------------------------------------------------------
ltest1		add	led, #1
		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_call	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#ltest2
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ltest2

		cmp	cz, #%11 wz
	if_nz	jmp	#ltest2

		setb	outb, led

'-------------------------------------------------------------------------------
ltest2		add	led, #1
		setcz	#%01 wc, wz
		mov	d, #test_call
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #test_call wz
	if_nz	jmp	#ltest3
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ltest3

		cmp	cz, #%01 wz
	if_nz	jmp	#ltest3

		setb	outb, led

'-------------------------------------------------------------------------------
ltest3		add	led, #1
		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_hcall	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#ltest4
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ltest4

		cmp	cz, #%11 wz
	if_nz	jmp	#ltest4

		setb	outb, led


'-------------------------------------------------------------------------------
ltest4		add	led, #1
		setcz	#%01 wc, wz
		mov	d, ##test_hcall
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##test_hcall wz
	if_nz	jmp	#ltest5
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ltest5

		cmp	cz, #%01 wz
	if_nz	jmp	#ltest5

		setb	outb, led

'-------------------------------------------------------------------------------
ltest5		add	led, #1
		setcz	#%01 wc, wz
		mov	d, ##test_lcall
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##test_lcall wz
	if_nz	jmp	#ltest6
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ltest6

		cmp	cz, #%01 wz
	if_nz	jmp	#ltest6

		setb	outb, led

'-------------------------------------------------------------------------------
ltest6		add	led, #1
		setcz	#%01 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_lcall	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#ltest7
	
		cmp	c, #$1FF wz
	if_nz	jmp	#ltest7

		cmp	cz, #%01 wz
	if_nz	jmp	#ltest7

		setb	outb, led

'-------------------------------------------------------------------------------
ltest7
.end		jmp	#.end

'-------------------------------------------------------------------------------
test_lcall	mov	c, #$1FF
		ret