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

.i	getword	d, s, #0	' TEST INSTRUCTION

	setbc	cz, #1		' store C/Z
	setbz	cz, #0

	add	.i, index	' increment the GETxxx index

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

index	long	%10_000000000_000000000

testc	long	(cnt-tests)/5
	'       d           s            cz  r           rcz
tests	long	$BADD_ECAF, $1234_5678, %11, $0000_5678, %11
	long	$BADD_ECAF, $1234_5678, %11, $0000_1234, %11

cnt	res	1
d	res	1
s	res	1
cz	res	1
r	res	1
rcz	res	1