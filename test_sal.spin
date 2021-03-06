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

	sal	d, s wc, wz	' TEST INSTRUCTION

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
tests	long	$FFFF_FF9C, $0000_0001, %00, $FFFF_FF38, %10
	long	$FFFF_FF9C, $0000_0002, %00, $FFFF_FE70, %10
	long	$FFFF_FF9C, $0000_0003, %00, $FFFF_FCE0, %10
	long	$FFFF_FFF3, $0000_0001, %00, $FFFF_FFE7, %10
	long	$FFFF_FFF3, $0000_0002, %00, $FFFF_FFCF, %10
	long	$FFFF_FFF3, $0000_0003, %00, $FFFF_FF9F, %10
	long	$0000_0006, $0000_0001, %00, $0000_000C, %00
	long	$0000_0006, $0000_0002, %00, $0000_0018, %00
	long	$0000_0006, $0000_0003, %00, $0000_0030, %00
	long	$0000_0006, $0000_0000, %00, $0000_0006, %00
	long	$FFFF_FFFC, $0000_0000, %00, $FFFF_FFFC, %10
	long	$8000_0000, $0000_0001, %00, $0000_0000, %11

cnt	res	1
d	res	1
s	res	1
cz	res	1
r	res	1
rcz	res	1