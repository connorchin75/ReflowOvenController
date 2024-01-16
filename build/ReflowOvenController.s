	// .file	"C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/ReflowOvenController.opt"
//	.section	//.text,"xr"
//align
@ = (@ + 1-1)  & -1
sxc__Z12wait_secondsj:                  // @_Z12wait_secondsj
// BB#0:
	mov	r0, 0x0
	mov	r2, 0x4350
	mov	r3, 0x3cb0
BB0_1:                                  // %.preheader.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_2 Depth 2
                                        //       Child Loop BB0_3 Depth 3
                                        //       Child Loop BB0_5 Depth 3
	mov	r4, 0x0
BB0_2:                                  //   Parent Loop BB0_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_3 Depth 3
                                        //       Child Loop BB0_5 Depth 3
	inp	r1, 0x3
	sub	r5, r2, r1
BB0_3:                                  //   Parent Loop BB0_1 Depth=1
                                        //     Parent Loop BB0_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	inp	r1, 0x3
	add	r1, r5, r1
	//cmp	r1, 0x0
	bc	LT0, BB0_3
// BB#4:                                // %_Z14sys_clock_waitj.exit.i
                                        //   in Loop: Header=BB0_2 Depth=2
	inp	r1, 0x3
	sub	r5, r3, r1
BB0_5:                                  //   Parent Loop BB0_1 Depth=1
                                        //     Parent Loop BB0_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	inp	r1, 0x3
	add	r1, r5, r1
	//cmp	r1, 0x0
	bc	LT0, BB0_5
// BB#6:                                // %_Z14sys_clock_waitj.exit5.i
                                        //   in Loop: Header=BB0_2 Depth=2
	add	r4, r4, 0x1
	sub	r1, r4, 0x3e8
	bc	NE, BB0_2
// BB#7:                                //   in Loop: Header=BB0_1 Depth=1
	add	r0, r0, 0x1
	sub	r1, r0, 0x3e8
	bc	NE, BB0_1
// BB#8:                                // %._crit_edge
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z15ButtonLEDThreadPv:              // @_Z15ButtonLEDThreadPv
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
BB1_1:                                  // =>This Inner Loop Header: Depth=1
	inp	r0, 0x20
	ior	r0, r0, 0x20
	outp	r0, 0x20
	jsr	r6, sxc__Z12wait_secondsj
	inp	r0, 0x20
	and	r0, r0, 0xffdf
	outp	r0, 0x20
	jsr	r6, sxc__Z12wait_secondsj
	bra	BB1_1

//sxc_main
//align
@ = (@ + 1-1)  & -1
sxc_main:                               // @main
// BB#0:
	mov	r0, 0x16
	outp	r0, 0x70
	mov	r0, 0x73
	outp	r0, 0x71
	inp	r0, 0x72
	and	r0, r0, 0xfbff
	outp	r0, 0x72
BB2_1:                                  // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	LT0, BB2_1
// BB#2:
	mov	r0, 0x1
	outp	r0, 0x75
	mov	r0, 0x805
	outp	r0, 0x74
	inp	r0, 0x72
	and	r0, r0, 0xfbff
	outp	r0, 0x72
BB2_3:                                  // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	LT0, BB2_3
// BB#4:
	inp	r0, 0x72
	ior	r0, r0, 0xc00
	outp	r0, 0x72
BB2_5:                                  // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	NC, BB2_5
// BB#6:                                // %_Z8InitGPIOv.exit
	mov	r0, 0x8183
	outp	r0, 0x73
	mov	r0, 0xf
	outp	r0, 0x70
	mov	r1, 0xe
	outp	r1, 0x71
	mov	r1, 0x800
	outp	r1, 0x27
	mov	r1, 0xe000
	outp	r1, 0x21
	outp	r0, 0x37
	mov	r0, 0x80
	outp	r0, 0x20
	mov	r0, 0x8000
	outp	r0, 0x7
	mov	r1, 0xa
	outp	r1, 0x3
	mov	r1, 0x0
	outp	r1, 0x0
	mov	r1, sxc__Z15ButtonLEDThreadPv
	outp	r1, 0x1
	outp	r0, 0x6
	outp	r0, 0x7
	ld	r1, thrds_vector
	and	r1, r1, 0xfffd
	st	r1, thrds_vector
	outp	r1, 0x4
	outp	r0, 0x6
	mov	r0, 0x0
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc___xinc_udiv:                        // @__xinc_udiv
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
	add	r1, r2, 0x0
	add	r2, r3, 0x0
	//APP
	jsr	r6, UnsignedDivide
	//NO_APP
	add	r0, r1, 0x0
	ld	r6, sp, 0xffff          // 1-byte Folded Reload
	sub	sp, sp, 0x1
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc___xinc_umod:                        // @__xinc_umod
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
	add	r1, r2, 0x0
	add	r2, r3, 0x0
	//APP
	jsr	r6, UnsignedDivide
	//NO_APP
	add	r0, r2, 0x0
	ld	r6, sp, 0xffff          // 1-byte Folded Reload
	sub	sp, sp, 0x1
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc_memset:                             // @memset
// BB#0:
	sub	r1, r4, 0x0
	bc	EQ, BB5_3
// BB#1:
	add	r0, r2, 0x0
BB5_2:                                  // %.lr.ph
                                        // =>This Inner Loop Header: Depth=1
	st	r3, r0, 0x0
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB5_2
BB5_3:                                  // %._crit_edge
	add	r0, r2, 0x0
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc_memcpy:                             // @memcpy
// BB#0:
	sub	r1, r2, r3
	bc	EQ, BB6_4
// BB#1:
	sub	r1, r4, 0x0
	bc	EQ, BB6_4
// BB#2:
	add	r0, r2, 0x0
BB6_3:                                  // %.lr.ph.i
                                        // =>This Inner Loop Header: Depth=1
	ld	r1, r3, 0x0
	st	r1, r0, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB6_3
BB6_4:                                  // %memcpy_base.exit
	add	r0, r2, 0x0
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc_memmove:                            // @memmove
// BB#0:
	mov	r0, 0x1
	mov	r5, 0x1
	sub	r1, r4, 0x0
	bc	EQ, @ + 1 + 0x1
	mov	r5, 0x0 //Select--False
	sub	r1, r2, r3
	bc	EQ, @ + 1 + 0x1
	mov	r0, 0x0 //Select--False
	ior	r0, r0, r5
	sub	r1, r3, r2
	bc	UGE, BB7_1
// BB#4:
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB7_7
// BB#5:                                // %.lr.ph23.i.preheader
	mov	r0, 0x1
	sub	r0, r0, r4
BB7_6:                                  // %.lr.ph23.i
                                        // =>This Inner Loop Header: Depth=1
	sub	r1, r2, r0
	sub	r4, r3, r0
	ld	r4, r4, 0x0
	st	r4, r1, 0x0
	add	r0, r0, 0x1
	sub	r1, r0, 0x1
	bc	NE, BB7_6
	bra	BB7_7
BB7_1:
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB7_7
// BB#2:
	add	r0, r2, 0x0
BB7_3:                                  // %.lr.ph.i
                                        // =>This Inner Loop Header: Depth=1
	ld	r1, r3, 0x0
	st	r1, r0, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB7_3
BB7_7:                                  // %memcpy_base.exit
	add	r0, r2, 0x0
	jsr	r6, r6


