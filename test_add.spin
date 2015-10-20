dat
	orgh 0
	org 0

	andn	outb, ##$FFFF
	or	dirb, ##$FFFF

	mov	cnt, testc
	mov	ptra, #@tests

_test	rdlong	d, ptra++
	rdlong	s, ptra++
	rdlong	cz, ptra++

	setcz	cz wc, wz

	add	d, s wc, wz	' TEST INSTRUCTION

	setbc	cz, #1		' store C/Z
	setbz	cz, #0

	rdlong	r, ptra++	' get the expected result
	rdlong	rcz, ptra++	' get the expected flags

	cmp	d, r wz
  if_nz	jmp	#_next

	cmp	cz, rcz wz
  if_nz	jmp	#_next
	
	mov	d, testc	' set LED 0 to N
	sub	d, cnt
	setb	outb, d
	
_next
	djnz	cnt, #_test
	
end	jmp	#end


testc	long	3
	'       d           s            cz  r           rcz
tests	long	$FFFF_FFFE, $0000_0001, %00, $FFFF_FFFF, %00
	long	$FFFF_FFFE, $0000_0002, %00, $0000_0000, %11
	long	$FFFF_FFFE, $0000_0003, %00, $0000_0001, %10

cnt	res	1
d	res	1
s	res	1
cz	res	1
r	res	1
rcz	res	1