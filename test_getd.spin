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

	getd	d, s		' TEST INSTRUCTION

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

testc	long	(cnt-tests)/5

	'       d           s            cz  r           rcz
tests	long	$BADD_ECAF, $0000_0000, %00, $0000_0000, %00
	long	$BADD_ECAF, $FFFF_FFFF, %00, $0000_01FF, %00
	long	$BADD_ECAF, $0003_FE00, %00, $0000_01FF, %00

cnt	res	1
d	res	1
s	res	1
cz	res	1
r	res	1
rcz	res	1
