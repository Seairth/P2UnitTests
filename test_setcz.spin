dat
	orgh 0
	org 0

	andn	outb, ##$FFFF
	or	dirb, ##$FFFF

	mov	cnt, testc
	mov	ptra, #@tests

_test	rdlong	d, ptra++
	rdlong	cz, ptra++

	setcz	cz wc, wz

	setcz	d  wc, wz	' TEST INSTRUCTION

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

testc	long	(cnt-tests)/4

	'       d     cz  r    rcz
tests	long	%00, %11, %00, %00
	long	%01, %10, %01, %01
	long	%10, %10, %10, %10
	long	%11, %00, %11, %11
	long	$FD, %10, $FD, %01

cnt	res	1
d	res	1
s	res	1
cz	res	1
r	res	1
rcz	res	1
