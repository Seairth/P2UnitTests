dat
		orgh 0
		org 0

		andn	outb, ##$FFFF
		or	dirb, ##$FFFF

		call	#test1		' Jump (greater than zero)
		call	#test2		' Don't jump (less than zero)
		call	#test3		' Jump (zero)

.end		jmp	#.end

'-------------------------------------------------------------------------------
test1		setcz	#%01 wc, wz
		mov	d, #1

		tjns	d, #.success	' TEST INSTRUCTION
		
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
test2		setcz	#%01 wc, wz
		mov	d, ##$80_00_00_00

		tjns	d, #.end	' TEST INSTRUCTION

		setbc	cz, #1
		setbz	cz, #0

		cmp	d, ##$80_00_00_00 wz
	if_nz	jmp	#.end

		cmp	cz, #%01 wz
	if_nz	jmp	#.end

		setb	outb, #1

.end		ret

'-------------------------------------------------------------------------------
test3		setcz	#%01 wc, wz
		mov	d, #0

		tjns	d, #.success	' TEST INSTRUCTION
		
		jmp	#.end
.success
		setbc	cz, #1
		setbz	cz, #0

		cmp	d, #0 wz
	if_nz	jmp	#.end

		cmp	cz, #%01 wz
	if_nz	jmp	#.end

		setb	outb, #2

.end		ret



'-------------------------------------------------------------------------------
d		res	1
cz		res	1
