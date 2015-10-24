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

	mul	d, s wc, wz	' TEST INSTRUCTION

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
tests	long	$0000_0000, $0000_0000, %10, $0000_0000, %01 ' 0*0 = 0, C = MSB
	long	$0000_FFFF, $0000_0000, %10, $0000_0000, %01 ' n*0 = 0, C = MSB
	long	$0000_0000, $0000_FFFF, %10, $0000_0000, %01 ' 0*n = 0, C = MSB
	long	$0000_0001, $0000_0001, %11, $0000_0001, %00 ' 1*1 = 1, C = MSB
	long	$0000_B505, $0000_B505, %11, $8000_1219, %10 ' C = MSB
	long	$0000_FFFF, $0000_FFFF, %11, $FFFE_0001, %10 ' 65535 * 65535 = 4294836225, C = MSB
	long	$0000_7FFF, $0000_7FFF, %11, $3FFF_0001, %00 ' 32767 * 32767 = 1073676289, C = MSB
	long	$BADD_7FFF, $BADD_7FFF, %11, $3FFF_0001, %00 ' upper 16 bits ignored, C = MSB

cnt	res	1
d	res	1
s	res	1
cz	res	1
r	res	1
rcz	res	1