dat
		orgh 0
		org 0

		andn	outb, ##$FFFF
		or	dirb, ##$FFFF

		call	#test1		' Normal decrement from non-zero start
		call	#test2		' Decrement starting at zero
		call	#test3		' Decrement starting from -1

.end		jmp	#.end

'-------------------------------------------------------------------------------
test1		setcz	#%01 wc, wz
		mov	d, #10
		mov	c, #0

.loop		add	c, #1
		djns	d, #.loop	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##-1 wz
	if_nz	jmp	#.end
	
		cmp	c, #11 wz
	if_nz	jmp	#.end

		cmp	cz, #%01 wz
	if_nz	jmp	#.end

		setb	outb, #0

.end		ret


'-------------------------------------------------------------------------------
test2		setcz	#%01 wc, wz
		mov	d, #0
		mov	c, #0

.loop		add	c, #1
		djns	d, #.loop	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##-1 wz
	if_nz	jmp	#.end
	
		cmp	c, #1 wz
	if_nz	jmp	#.end

		cmp	cz, #%01 wz
	if_nz	jmp	#.end

		setb	outb, #1

.end		ret

'-------------------------------------------------------------------------------
test3		setcz	#%01 wc, wz
		mov	d, ##-1
		mov	c, #0

.loop		add	c, #1
		djns	d, #.loop	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##-2 wz
	if_nz	jmp	#.end
	
		cmp	c, #1 wz
	if_nz	jmp	#.end

		cmp	cz, #%01 wz
	if_nz	jmp	#.end

		setb	outb, #2

.end		ret



'-------------------------------------------------------------------------------
d		res	1
c		res	1
cz		res	1
r		res	1
rc		res	1
rcz		res	1