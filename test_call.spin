dat
		orgh 0
		org 0

		andn	outb, ##$FFFF
		or	dirb, ##$FFFF

'-------------------------------------------------------------------------------
test1		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_call	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#test2
	
		cmp	c, #$1FF wz
	if_nz	jmp	#test2

		cmp	cz, #%11 wz
	if_nz	jmp	#test2

		setb	outb, #0


'-------------------------------------------------------------------------------
test2		setcz	#%01 wc, wz
		mov	d, #test_call
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #test_call wz
	if_nz	jmp	#test3
	
		cmp	c, #$1FF wz
	if_nz	jmp	#test3

		cmp	cz, #%01 wz
	if_nz	jmp	#test3

		setb	outb, #1

'-------------------------------------------------------------------------------
test3		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_hcall	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#test4
	
		cmp	c, #$1FF wz
	if_nz	jmp	#test4

		cmp	cz, #%11 wz
	if_nz	jmp	#test4

		setb	outb, #2


'-------------------------------------------------------------------------------
test4		setcz	#%01 wc, wz
		mov	d, ##test_hcall
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##test_hcall wz
	if_nz	jmp	#test5
	
		cmp	c, #$1FF wz
	if_nz	jmp	#test5

		cmp	cz, #%01 wz
	if_nz	jmp	#test5

		setb	outb, #3

		jmp	#test5

'-------------------------------------------------------------------------------
test_call	mov	c, #$1FF
		ret

'-------------------------------------------------------------------------------
d		res	1
c		res	1
cz		res	1
r		res	1
rc		res	1
rcz		res	1


'===============================================================================
		orgh $403


'-------------------------------------------------------------------------------
test5		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_call	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#test6
	
		cmp	c, #$1FF wz
	if_nz	jmp	#test6

		cmp	cz, #%11 wz
	if_nz	jmp	#test6

		setb	outb, #4

'-------------------------------------------------------------------------------
test6		setcz	#%01 wc, wz
		mov	d, #test_call
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #test_call wz
	if_nz	jmp	#test7
	
		cmp	c, #$1FF wz
	if_nz	jmp	#test7

		cmp	cz, #%01 wz
	if_nz	jmp	#test7

		setb	outb, #5

'-------------------------------------------------------------------------------
test7		setcz	#%11 wc, wz
		mov	d, #0
		mov	c, #0

.loop		call	#test_hcall	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#test8
	
		cmp	c, #$1FF wz
	if_nz	jmp	#test8

		cmp	cz, #%11 wz
	if_nz	jmp	#test8

		setb	outb, #6


'-------------------------------------------------------------------------------
test8		setcz	#%01 wc, wz
		mov	d, ##test_hcall
		mov	c, #0

.loop		call	d	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##test_hcall wz
	if_nz	jmp	#.end
	
		cmp	c, #$1FF wz
	if_nz	jmp	#.end

		cmp	cz, #%01 wz
	if_nz	jmp	#.end

		setb	outb, #7

.end		jmp	#.end

'-------------------------------------------------------------------------------
test_hcall	mov	c, #$1FF
		ret
