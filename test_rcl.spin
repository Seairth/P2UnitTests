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

	rcl	d, s wc, wz	' TEST INSTRUCTION

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
tests	long	$8000_0000, $0000_0000, %01, $8000_0000, %10
	long	$8000_0000, $0000_0001, %00, $0000_0000, %11
	long	$8000_0000, $0000_0001, %11, $0000_0001, %10
	long	$2108_4048, $0000_0002, %01, $8421_0120, %00
	long	$2108_4048, $0000_0002, %11, $8421_0123, %00
	long	$8765_4321, $0000_0004, %01, $7654_3210, %00
	long	$8765_4321, $0000_0004, %11, $7654_321F, %00

cnt	res	1
d	res	1
s	res	1
cz	res	1
r	res	1
rcz	res	1