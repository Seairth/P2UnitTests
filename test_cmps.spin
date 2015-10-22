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

	cmps	d, s wc, wz	' TEST INSTRUCTION

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
tests	long	$0000_0003, $0000_0002, %00, $0000_0003, %00
	long	$0000_0003, $0000_0003, %00, $0000_0003, %01
	long	$0000_0003, $0000_0004, %00, $0000_0003, %10
	long	$8000_0000, $7FFF_FFFF, %00, $8000_0000, %10
	long	$7FFF_FFFF, $8000_0000, %00, $7FFF_FFFF, %00
	long	$8000_0000, $0000_0001, %00, $8000_0000, %10
	long	$7FFF_FFFF, $FFFF_FFFF, %00, $7FFF_FFFF, %00
	long	$FFFF_FFFE, $FFFF_FFFF, %00, $FFFF_FFFE, %10
	long	$FFFF_FFFE, $FFFF_FFFE, %00, $FFFF_FFFE, %01
	long	$FFFF_FFFE, $FFFF_FFFD, %00, $FFFF_FFFE, %00

cnt	res	1
d	res	1
s	res	1
cz	res	1
r	res	1
rcz	res	1