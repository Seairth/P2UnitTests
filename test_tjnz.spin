dat
		orgh 0
		org 0

		andn	outb, ##$FFFF
		or	dirb, ##$FFFF

		call	#test1		' Jump
		call	#test2		' Don't jump

.end		jmp	#.end

'-------------------------------------------------------------------------------
test1		setcz	#%01 wc, wz
		mov	d, #1

		tjnz	d, #.success	' TEST INSTRUCTION
		
		jmp	#.end
.success
		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #1 wz
	if_nz	jmp	#.end

		cmp	cz, #%01 wz
	if_nz	jmp	#.end

		setb	outb, #0

.end		ret


'-------------------------------------------------------------------------------
test2		setcz	#%10 wc, wz
		mov	d, #0

		tjnz	d, #.end	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#.end

		cmp	cz, #%10 wz
	if_nz	jmp	#.end

		setb	outb, #1

.end		ret



'-------------------------------------------------------------------------------
d		res	1
cz		res	1
