	// .file	"C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/ReflowOvenController.opt"
//	.section	//.text,"xr"
//align
@ = (@ + 1-1)  & -1
sxc__Z7wait_msj:                        // @_Z7wait_msj
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
	sub	r1, r2, 0x0
	bc	EQ, BB0_9
// BB#1:
	mov	r0, 0x0
	mov	r3, 0x4350
	mov	r4, 0x3cb0
BB0_2:                                  // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_3 Depth 2
                                        //       Child Loop BB0_4 Depth 3
                                        //       Child Loop BB0_6 Depth 3
	mov	r5, 0x0
BB0_3:                                  //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_4 Depth 3
                                        //       Child Loop BB0_6 Depth 3
	inp	r1, 0x3
	sub	r6, r3, r1
BB0_4:                                  //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_3 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	inp	r1, 0x3
	add	r1, r6, r1
	//cmp	r1, 0x0
	bc	LT0, BB0_4
// BB#5:                                // %_Z14sys_clock_waitj.exit
                                        //   in Loop: Header=BB0_3 Depth=2
	inp	r1, 0x3
	sub	r6, r4, r1
BB0_6:                                  //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_3 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	inp	r1, 0x3
	add	r1, r6, r1
	//cmp	r1, 0x0
	bc	LT0, BB0_6
// BB#7:                                // %_Z14sys_clock_waitj.exit5
                                        //   in Loop: Header=BB0_3 Depth=2
	add	r5, r5, 0x1
	sub	r1, r5, 0x3e8
	bc	NE, BB0_3
// BB#8:                                //   in Loop: Header=BB0_2 Depth=1
	add	r0, r0, 0x1
	sub	r1, r0, r2
	bc	NE, BB0_2
BB0_9:                                  // %._crit_edge
	ld	r6, sp, 0xffff          // 1-byte Folded Reload
	sub	sp, sp, 0x1
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z12Num_To_ASCIIj:                  // @_Z12Num_To_ASCIIj
// BB#0:
	mov	r0, 0x64
	mov	r1, 0x9
	sub	r1, r2, r1
	bc	UGT, BB1_12
// BB#1:
	ld	r1, r2,JTI1_0
	jsr	r1, r1
BB1_2:
	mov	r0, 0x10
	jsr	r6, r6
BB1_3:
	mov	r0, 0x11
	jsr	r6, r6
BB1_4:
	mov	r0, 0x12
	jsr	r6, r6
BB1_5:
	mov	r0, 0x13
	jsr	r6, r6
BB1_6:
	mov	r0, 0x14
	jsr	r6, r6
BB1_7:
	mov	r0, 0x15
	jsr	r6, r6
BB1_8:
	mov	r0, 0x16
	jsr	r6, r6
BB1_9:
	mov	r0, 0x17
	jsr	r6, r6
BB1_10:
	mov	r0, 0x18
	jsr	r6, r6
BB1_11:
	mov	r0, 0x19
BB1_12:
	jsr	r6, r6
//	.section	.rdata,"r"
JTI1_0:
		BB1_2
		BB1_3
		BB1_4
		BB1_5
		BB1_6
		BB1_7
		BB1_8
		BB1_9
		BB1_10
		BB1_11

//	.section	//.text,"xr"
//align
@ = (@ + 1-1)  & -1
sxc__Z13char_to_ASCIIc:                 // @_Z13char_to_ASCIIc
// BB#0:
	add	r1, r2, 0xff9f
	mov	r0, 0x19
	sub	r1, r1, r0
	bc	UGT, BB2_2
// BB#1:
	add	r0, r2, 0xffe0
	jsr	r6, r6
BB2_2:
	add	r1, r2, 0xffbf
	sub	r1, r1, r0
	bc	UGT, BB2_4
// BB#3:
	add	r0, r2, 0xffe0
	jsr	r6, r6
BB2_4:
	add	r0, r2, 0xffd0
	mov	r1, 0x9
	sub	r1, r0, r1
	bc	UGT, BB2_6
// BB#5:
	add	r0, r2, 0xffe0
	jsr	r6, r6
BB2_6:
	mov	r0, 0x1a
	sub	r1, r2, 0x39
	bc	GT, BB2_8
// BB#7:
	add	r1, r2, 0xffe0
	mov	r2, 0x10
	add	r0, r1, 0x0
	sub	r1, r1, r2
	bc	ULT, @ + 1 + 0x2
	mov	r0, 0x63 //Select--False
BB2_8:
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z22OLED_Command_160128RGBh:        // @_Z22OLED_Command_160128RGBh
// BB#0:
	inp	r0, 0x20
	and	r0, r0, 0xfffb
	outp	r0, 0x20
	inp	r0, 0x20
	and	r0, r0, 0xfffd
	outp	r0, 0x20
	outp	r2, 0x36
	inp	r0, 0x36
	inp	r0, 0x20
	ior	r0, r0, 0x4
	outp	r0, 0x20
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z19OLED_Data_160128RGBh:           // @_Z19OLED_Data_160128RGBh
// BB#0:
	inp	r0, 0x20
	and	r0, r0, 0xfffb
	outp	r0, 0x20
	inp	r0, 0x20
	ior	r0, r0, 0x2
	outp	r0, 0x20
	outp	r2, 0x36
	inp	r0, 0x36
	inp	r0, 0x20
	ior	r0, r0, 0x4
	outp	r0, 0x20
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z31OLED_WriteMemoryStart_160128RGBv: // @_Z31OLED_WriteMemoryStart_160128RGBv
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
	mov	r2, 0x22
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	ld	r6, sp, 0xffff          // 1-byte Folded Reload
	sub	sp, sp, 0x1
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z20OLED_Pixel_160128RGBm:          // @_Z20OLED_Pixel_160128RGBm
// BB#0:
	add	sp, sp, 0x2
	st	r6, sp, 0xfffe          // 1-byte Folded Spill
	st	r2, sp, 0xffff          // 1-byte Folded Spill
	and	r0, r3, 0xff
	rol	r0, r0, 0x8
	and	r1, r2, 0xff00
	rol	r1, r1, 0x8
	ior	r2, r1, r0
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	ld	r2, sp, 0xffff          // 1-byte Folded Reload
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	ld	r6, sp, 0xfffe          // 1-byte Folded Reload
	sub	sp, sp, 0x2
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z26OLED_SetPosition_160128RGBhh:   // @_Z26OLED_SetPosition_160128RGBhh
// BB#0:
	add	sp, sp, 0x3
	st	r6, sp, 0xfffd          // 1-byte Folded Spill
	st	r3, sp, 0xfffe          // 1-byte Folded Spill
	st	r2, sp, 0xffff          // 1-byte Folded Spill
	mov	r2, 0x20
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	ld	r2, sp, 0xffff          // 1-byte Folded Reload
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x21
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	ld	r6, sp, 0xfffd          // 1-byte Folded Reload
	sub	sp, sp, 0x3
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z25OLED_FillScreen_160128RGBm:     // @_Z25OLED_FillScreen_160128RGBm
// BB#0:
	add	sp, sp, 0x2
	st	r6, sp, 0xfffe          // 1-byte Folded Spill
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r0, 0x5000
BB8_1:                                  // =>This Inner Loop Header: Depth=1
	st	r0, sp, 0xffff          // 1-byte Folded Spill
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xffff          // 1-byte Folded Reload
	add	r0, r0, 0xffff
	//cmp	r0, 0x0
	bc	ZC, BB8_1
// BB#2:
	ld	r6, sp, 0xfffe          // 1-byte Folded Reload
	sub	sp, sp, 0x2
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z19OLED_Text_160128RGBhhhmm:       // @_Z19OLED_Text_160128RGBhhhmm
// BB#0:
	add	sp, sp, 0x9
	st	r6, sp, 0xfff7          // 1-byte Folded Spill
	st	r5, sp, 0xfffa          // 1-byte Folded Spill
	st	r2, sp, 0xfffe          // 1-byte Folded Spill
	rol	r0, r4, 0x2
	and	r0, r0, 0xfffc
	add	r0, r4, r0
	ld	r1, sp, 0xfff6
	mov	r2, 0x0
	mov	r1, 0x80
	st	r1, sp, 0xfff9          // 1-byte Folded Spill
	add	r0, r0, sxc_Ascii_1
	st	r0, sp, 0xfffb          // 1-byte Folded Spill
BB9_1:                                  // =>This Loop Header: Depth=1
                                        //     Child Loop BB9_2 Depth 2
	st	r2, sp, 0xfffd          // 1-byte Folded Spill
	st	r3, sp, 0xfffc          // 1-byte Folded Spill
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r2, 0x5
BB9_2:                                  //   Parent Loop BB9_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r2, sp, 0xfff8          // 1-byte Folded Spill
	ld	r0, sp, 0xfffb          // 1-byte Folded Reload
	sub	r0, r0, r2
	ld	r0, r0, 0x5
	ld	r1, sp, 0xfff9          // 1-byte Folded Reload
	and	r0, r0, r1
	sub	r1, r0, r1
	bc	NE, BB9_4
// BB#3:                                //   in Loop: Header=BB9_2 Depth=2
	ld	r2, sp, 0xfffa          // 1-byte Folded Reload
	ld	r3, sp, 0xfff6
	bra	BB9_5
BB9_4:                                  //   in Loop: Header=BB9_2 Depth=2
	mov	r2, 0x0
	mov	r3, 0x0
BB9_5:                                  //   in Loop: Header=BB9_2 Depth=2
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r2, sp, 0xfff8          // 1-byte Folded Reload
	add	r2, r2, 0xffff
	//cmp	r2, 0x0
	bc	ZC, BB9_2
// BB#6:                                //   in Loop: Header=BB9_1 Depth=1
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r3, r3, 0x1
	ld	r0, sp, 0xfff9          // 1-byte Folded Reload
	and	r0, r0, 0xfffe
	rol	r0, r0, 0xf
	st	r0, sp, 0xfff9          // 1-byte Folded Spill
	ld	r2, sp, 0xfffd          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x8
	bc	NE, BB9_1
// BB#7:
	ld	r6, sp, 0xfff7          // 1-byte Folded Reload
	sub	sp, sp, 0x9
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z21OLED_Text2x_160128RGBhhhmm:     // @_Z21OLED_Text2x_160128RGBhhhmm
// BB#0:
	add	sp, sp, 0x9
	st	r6, sp, 0xfff7          // 1-byte Folded Spill
	st	r5, sp, 0xfffa          // 1-byte Folded Spill
	st	r4, sp, 0xfffb          // 1-byte Folded Spill
	st	r2, sp, 0xfffe          // 1-byte Folded Spill
	ld	r0, sp, 0xfff6
	mov	r4, 0x1
	mov	r0, 0x80
	st	r0, sp, 0xfff9          // 1-byte Folded Spill
BB10_1:                                 // =>This Loop Header: Depth=1
                                        //     Child Loop BB10_2 Depth 2
	st	r4, sp, 0xfffd          // 1-byte Folded Spill
	st	r3, sp, 0xfffc          // 1-byte Folded Spill
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r2, 0x0
BB10_2:                                 //   Parent Loop BB10_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r2, sp, 0xfff8          // 1-byte Folded Spill
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	rol	r0, r1, 0x2
	and	r0, r0, 0xfffc
	add	r0, r1, r0
	add	r0, r0, sxc_Ascii_1
	and	r1, r2, 0xfffe
	rol	r1, r1, 0xf
	add	r0, r0, r1
	ld	r0, r0, 0x0
	ld	r1, sp, 0xfff9          // 1-byte Folded Reload
	and	r0, r0, r1
	sub	r1, r0, r1
	bc	NE, BB10_4
// BB#3:                                //   in Loop: Header=BB10_2 Depth=2
	ld	r2, sp, 0xfffa          // 1-byte Folded Reload
	ld	r3, sp, 0xfff6
	bra	BB10_5
BB10_4:                                 //   in Loop: Header=BB10_2 Depth=2
	mov	r2, 0x0
	mov	r3, 0x0
BB10_5:                                 //   in Loop: Header=BB10_2 Depth=2
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r2, sp, 0xfff8          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0xa
	bc	NE, BB10_2
// BB#6:                                //   in Loop: Header=BB10_1 Depth=1
	ld	r4, sp, 0xfffd          // 1-byte Folded Reload
	and	r0, r4, 0x1
	xor	r1, r0, 0x1
	mov	r0, 0x0
	sub	r0, r0, r1
	ld	r2, sp, 0xfff9          // 1-byte Folded Reload
	rol	r2, r2, r0
	ld	r1, r1, 0x2020
	and	r2, r2, r1
	sub	r1, r0, 0x10
	bc	LT, @ + 1 + 0x1
	mov	r2, 0x0 //Select--False
	st	r2, sp, 0xfff9          // 1-byte Folded Spill
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r3, r3, 0x1
	add	r4, r4, 0x1
	sub	r1, r4, 0x11
	bc	NE, BB10_1
// BB#7:
	ld	r6, sp, 0xfff7          // 1-byte Folded Reload
	sub	sp, sp, 0x9
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z21OLED_Print_Sensor_Valhhjjmm:    // @_Z21OLED_Print_Sensor_Valhhjjmm
// BB#0:
	add	sp, sp, 0x7
	st	r6, sp, 0xfff9          // 1-byte Folded Spill
	ld	r0, sp, 0xfff7
	ld	r0, sp, 0xfff8
	mov	r0, 0x9
	sub	r1, r4, r0
	bc	UGE, BB11_1
// BB#10:                               // %.thread
	st	r5, sp, 0xfffd          // 1-byte Folded Spill
	st	r2, sp, 0xfffb          // 1-byte Folded Spill
	add	r2, r4, 0x0
	st	r3, sp, 0xfffa          // 1-byte Folded Spill
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r2, sp, 0xfffb          // 1-byte Folded Reload
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	add	r4, r0, 0x0
	ld	r5, sp, 0xfff8
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0x7
	bra	BB11_4
BB11_1:
	st	r5, sp, 0xfffd          // 1-byte Folded Spill
	st	r2, sp, 0xfffb          // 1-byte Folded Spill
	st	r3, sp, 0xfffa          // 1-byte Folded Spill
	mov	r0, 0x64
	sub	r1, r4, r0
	bc	UGE, BB11_3
// BB#2:
	add	r2, r4, 0x0
	mov	r3, 0xa
	st	r4, sp, 0xfffc          // 1-byte Folded Spill
	jsr	r6, sxc___xinc_udiv
	add	r2, r0, 0x0
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r2, sp, 0xfffb          // 1-byte Folded Reload
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	add	r4, r0, 0x0
	ld	r0, sp, 0xfff8
	add	r5, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r2, sp, 0xfffc          // 1-byte Folded Reload
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	add	r2, r1, 0x7
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	add	r4, r0, 0x0
	ld	r5, sp, 0xfff8
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0xe
	bra	BB11_4
BB11_3:
	add	r2, r4, 0x0
	mov	r3, 0x64
	st	r4, sp, 0xfffc          // 1-byte Folded Spill
	jsr	r6, sxc___xinc_udiv
	add	r2, r0, 0x0
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r2, sp, 0xfffb          // 1-byte Folded Reload
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	add	r4, r0, 0x0
	ld	r0, sp, 0xfff8
	add	r5, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r2, sp, 0xfffc          // 1-byte Folded Reload
	mov	r3, 0xa
	jsr	r6, sxc___xinc_udiv
	add	r2, r0, 0x0
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	add	r2, r1, 0x7
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	add	r4, r0, 0x0
	ld	r5, sp, 0xfff8
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r2, sp, 0xfffc          // 1-byte Folded Reload
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	add	r2, r1, 0xe
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	add	r4, r0, 0x0
	ld	r5, sp, 0xfff8
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0x15
BB11_4:
	ld	r6, sp, 0xfffd          // 1-byte Folded Reload
	sub	r1, r6, 0x1
	bc	NE, BB11_5
// BB#7:
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	add	r2, r0, r1
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	mov	r4, 0x5
	bra	BB11_8
BB11_5:
	ld	r1, sp, 0xfff8
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	ld	r2, sp, 0xfff7
	ld	r4, sp, 0xfffb          // 1-byte Folded Reload
	sub	r1, r6, 0x0
	bc	NE, BB11_9
// BB#6:
	st	r2, sp, 0xffff
	add	r2, r0, r4
	st	r2, sp, 0xfffb          // 1-byte Folded Spill
	mov	r4, 0x61
	ld	r5, sp, 0xfff8
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r0, sp, 0xfff7
	st	r0, sp, 0xffff
	ld	r0, sp, 0xfffb          // 1-byte Folded Reload
	add	r2, r0, 0x7
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	mov	r4, 0x23
BB11_8:
	ld	r5, sp, 0xfff8
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
BB11_9:
	ld	r6, sp, 0xfff9          // 1-byte Folded Reload
	sub	sp, sp, 0x7
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z8Draw_Barhhmmjjj:                 // @_Z8Draw_Barhhmmjjj
// BB#0:
	add	sp, sp, 0x6
	st	r6, sp, 0xfffa          // 1-byte Folded Spill
	st	r2, sp, 0xfffe          // 1-byte Folded Spill
	rol	r0, r3, 0x1
	and	r0, r0, 0xfffe
	rol	r1, r0, 0x2
	and	r1, r1, 0xfffc
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r2, r0, r1
	st	r2, sp, 0xfffb          // 1-byte Folded Spill
	mov	r3, 0x64
	jsr	r6, sxc___xinc_udiv
	ld	r1, sp, 0xfffe          // 1-byte Folded Reload
	st	r0, sp, 0xfffc          // 1-byte Folded Spill
	sub	r1, r1, 0x0
	bc	EQ, BB12_7
// BB#1:                                // %.lr.ph13
	mov	r3, 0x49
	mov	r0, 0x63
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	sub	r1, r1, r0
	bc	ULE, BB12_6
// BB#2:
	mov	r4, 0x0
BB12_5:                                 // %.lr.ph.us
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB12_3 Depth 2
	st	r4, sp, 0xffff          // 1-byte Folded Spill
	st	r3, sp, 0xfffd          // 1-byte Folded Spill
	mov	r2, 0x17
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r0, 0x0
BB12_3:                                 //   Parent Loop BB12_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r0, sp, 0xfffb          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xfffb          // 1-byte Folded Reload
	add	r0, r0, 0x1
	ld	r1, sp, 0xfffc          // 1-byte Folded Reload
	sub	r1, r0, r1
	bc	ULT, BB12_3
// BB#4:                                //   in Loop: Header=BB12_5 Depth=1
	ld	r3, sp, 0xfffd          // 1-byte Folded Reload
	add	r3, r3, 0x1
	ld	r4, sp, 0xffff          // 1-byte Folded Reload
	add	r4, r4, 0x1
	ld	r0, sp, 0xfffe          // 1-byte Folded Reload
	sub	r1, r4, r0
	bc	EQ, BB12_7
	bra	BB12_5
BB12_6:                                 // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	st	r3, sp, 0xfffd          // 1-byte Folded Spill
	mov	r2, 0x17
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	ld	r1, sp, 0xfffd          // 1-byte Folded Reload
	add	r0, r1, 0x1
	add	r1, r1, 0xffb8
	add	r3, r0, 0x0
	sub	r1, r1, r2
	bc	NE, BB12_6
BB12_7:                                 // %._crit_edge14
	ld	r6, sp, 0xfffa          // 1-byte Folded Reload
	sub	sp, sp, 0x6
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z15OLED_write_textihhPhimm:        // @_Z15OLED_write_textihhPhimm
// BB#0:
	add	sp, sp, 0x6
	st	r6, sp, 0xfffa          // 1-byte Folded Spill
	ld	r6, sp, 0xfff9
	sub	r1, r6, 0x1
	bc	LT, BB13_6
// BB#1:                                // %.lr.ph
	ld	r0, sp, 0xfff7
	ld	r0, sp, 0xfff8
	sub	r1, r2, 0x1
	bc	NE, BB13_4
// BB#2:
	add	r0, r5, 0x0
	st	r4, sp, 0xfffe          // 1-byte Folded Spill
	add	r2, r3, 0x0
	add	r3, r6, 0x0
	ld	r1, sp, 0xfff7
	ld	r1, sp, 0xfff8
BB13_3:                                 // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	st	r3, sp, 0xfffd          // 1-byte Folded Spill
	st	r2, sp, 0xfffb          // 1-byte Folded Spill
	st	r0, sp, 0xfffc          // 1-byte Folded Spill
	ld	r2, r0, 0x0
	jsr	r6, sxc__Z13char_to_ASCIIc
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r2, sp, 0xfffb          // 1-byte Folded Reload
	ld	r3, sp, 0xfffe          // 1-byte Folded Reload
	add	r4, r0, 0x0
	ld	r5, sp, 0xfff8
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r3, sp, 0xfffd          // 1-byte Folded Reload
	ld	r2, sp, 0xfffb          // 1-byte Folded Reload
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	add	r0, r0, 0x1
	add	r2, r2, 0x7
	add	r3, r3, 0xffff
	//cmp	r3, 0x0
	bc	ZC, BB13_3
	bra	BB13_6
BB13_4:                                 // %.lr.ph
	add	r0, r5, 0x0
	st	r4, sp, 0xfffe          // 1-byte Folded Spill
	add	r4, r6, 0x0
	ld	r1, sp, 0xfff7
	ld	r1, sp, 0xfff8
	sub	r1, r2, 0x2
	bc	NE, BB13_6
BB13_5:                                 // =>This Inner Loop Header: Depth=1
	st	r4, sp, 0xfffd          // 1-byte Folded Spill
	st	r3, sp, 0xfffb          // 1-byte Folded Spill
	st	r0, sp, 0xfffc          // 1-byte Folded Spill
	ld	r2, r0, 0x0
	jsr	r6, sxc__Z13char_to_ASCIIc
	ld	r1, sp, 0xfff7
	st	r1, sp, 0xffff
	ld	r2, sp, 0xfffb          // 1-byte Folded Reload
	ld	r3, sp, 0xfffe          // 1-byte Folded Reload
	add	r4, r0, 0x0
	ld	r5, sp, 0xfff8
	jsr	r6, sxc__Z21OLED_Text2x_160128RGBhhhmm
	ld	r4, sp, 0xfffd          // 1-byte Folded Reload
	ld	r3, sp, 0xfffb          // 1-byte Folded Reload
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	add	r0, r0, 0x1
	add	r3, r3, 0xc
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB13_5
BB13_6:                                 // %._crit_edge
	ld	r6, sp, 0xfffa          // 1-byte Folded Reload
	sub	sp, sp, 0x6
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z19OLED_Init_160128RGBv:           // @_Z19OLED_Init_160128RGBv
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
	inp	r0, 0x20
	and	r0, r0, 0xfffe
	outp	r0, 0x20
	mov	r2, 0x2
	jsr	r6, sxc__Z7wait_msj
	inp	r0, 0x20
	ior	r0, r0, 0x1
	outp	r0, 0x20
	mov	r2, 0x2
	jsr	r6, sxc__Z7wait_msj
	mov	r2, 0x4
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x1
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x1
	jsr	r6, sxc__Z7wait_msj
	mov	r2, 0x4
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x0
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x1
	jsr	r6, sxc__Z7wait_msj
	mov	r2, 0x6
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x0
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x1
	jsr	r6, sxc__Z7wait_msj
	mov	r2, 0x2
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x1
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x3
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x30
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x28
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x7f
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x29
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x0
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x14
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x31
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x16
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x66
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x10
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x45
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x11
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x34
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x12
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x33
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x8
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x4
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x9
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x5
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0xa
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x5
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0xb
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x9d
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0xc
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x8c
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0xd
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x57
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x80
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x0
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x13
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0xa0
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x17
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x0
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x18
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x9f
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x19
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x0
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x1a
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x7f
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	mov	r2, 0x6
	jsr	r6, sxc__Z22OLED_Command_160128RGBh
	mov	r2, 0x1
	jsr	r6, sxc__Z19OLED_Data_160128RGBh
	ld	r6, sp, 0xffff          // 1-byte Folded Reload
	sub	sp, sp, 0x1
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z27OLED_display_second_warningv:   // @_Z27OLED_display_second_warningv
// BB#0:
	add	sp, sp, 0x1e
	st	r6, sp, 0xffe2          // 1-byte Folded Spill
	add	r2, sp, 0xffe3
	st	r2, sp, 0xfffc          // 1-byte Folded Spill
	mov	r3, sxc__ZZ27OLED_display_second_warningvE5text3
	mov	r4, 0xb
	jsr	r6, sxc_memcpy
	mov	r0, 0xb
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xf800
	st	r0, sp, 0xfffe
	mov	r2, 0x1
	mov	r3, 0x9
	mov	r4, 0x2a
	ld	r5, sp, 0xfffc          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffee
	st	r2, sp, 0xfffc          // 1-byte Folded Spill
	mov	r3, sxc__ZZ27OLED_display_second_warningvE5text4
	mov	r4, 0xe
	jsr	r6, sxc_memcpy
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xf800
	st	r0, sp, 0xfffe
	mov	r0, 0xe
	st	r0, sp, 0xffff
	mov	r2, 0x1
	mov	r3, 0x9
	mov	r4, 0x1e
	ld	r5, sp, 0xfffc          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	ld	r6, sp, 0xffe2          // 1-byte Folded Reload
	sub	sp, sp, 0x1e
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z10TempThreadPv:                   // @_Z10TempThreadPv
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
	mov	r0, 0x1
	bra	BB16_1
BB16_4:                                 // %_Z7getTempv.exit
                                        //   in Loop: Header=BB16_1 Depth=1
	st	r0, sxc_current_temp
	ld	r0, sxc_current_temp
	rol	r1, r0, 0x2
	and	r1, r1, 0xfffc
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	rol	r1, r1, 0x2
	and	r1, r1, 0xfffc
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	add	r2, r0, 0xfee5
	mov	r3, 0x64
	jsr	r6, sxc___xinc_udiv
	st	r0, sxc_current_temp
	mov	r0, 0x1
	outp	r0, 0x6
BB16_1:                                 // =>This Inner Loop Header: Depth=1
	outp	r0, 0x7
	inp	r0, 0x32
	and	r0, r0, 0xfffd
	outp	r0, 0x32
	mov	r1, 0x0
	outp	r1, 0x36
	inp	r0, 0x36
	outp	r1, 0x36
	inp	r2, 0x36
	inp	r1, 0x32
	ior	r1, r1, 0x2
	outp	r1, 0x32
	and	r1, r2, 0x1
	//cmp	r1, 0x0
	bc	ZC, BB16_2
// BB#3:                                //   in Loop: Header=BB16_1 Depth=1
	and	r0, r0, 0xff
	rol	r0, r0, 0x8
	ior	r0, r2, r0
	and	r0, r0, 0xfff0
	rol	r0, r0, 0xc
	bra	BB16_4
BB16_2:                                 //   in Loop: Header=BB16_1 Depth=1
	inp	r0, 0x32
	and	r0, r0, 0xfffd
	outp	r0, 0x32
	mov	r0, 0x0
	outp	r0, 0x36
	inp	r1, 0x36
	outp	r0, 0x36
	inp	r1, 0x36
	outp	r0, 0x36
	inp	r1, 0x36
	outp	r0, 0x36
	inp	r1, 0x36
	inp	r1, 0x32
	ior	r1, r1, 0x2
	outp	r1, 0x32
	bra	BB16_4

//align
@ = (@ + 1-1)  & -1
sxc__Z14RotEncodThreadPv:               // @_Z14RotEncodThreadPv
// BB#0:
	add	sp, sp, 0x4
	st	r6, sp, 0xfffc          // 1-byte Folded Spill
	mov	r0, 0x8
	mov	r2, sxc_r_encoder
	mov	r4, 0x4
	mov	r6, 0x3
	bra	BB17_1
BB17_21:                                // %_Z15get_encoder_pos14rotary_encoder.exit
                                        //   in Loop: Header=BB17_1 Depth=1
	ld	r1, sp, 0xffff
	ld	r5, sp, 0xfffe
	st	r3, sxc_r_encoder
	st	r5, r2, 0x1
	st	r1, r2, 0x2
	outp	r0, 0x6
	outp	r4, 0x7
	inp	r1, 0x2e
	and	r1, r1, 0xfffc
	rol	r1, r1, 0xe
	and	r1, r1, 0x1
	xor	r1, r1, 0x1
	st	r1, sxc_btn_press
	outp	r4, 0x6
BB17_1:                                 // =>This Inner Loop Header: Depth=1
	outp	r0, 0x7
	ld	r1, r2, 0x2
	ld	r3, r2, 0x1
	ld	r5, sxc_r_encoder
	st	r5, sp, 0xfffd
	st	r3, sp, 0xfffe
	st	r1, sp, 0xffff
	inp	r1, 0x2e
	and	r1, r1, 0x2
	inp	r3, 0x2e
	and	r3, r3, 0x1
	ior	r3, r3, r1
	ld	r1, sp, 0xfffe
	sub	r1, r3, r1
	bc	EQ, BB17_16
// BB#2:                                //   in Loop: Header=BB17_1 Depth=1
	ld	r5, sp, 0xfffe
	sub	r1, r5, r6
	bc	UGT, BB17_15
// BB#3:                                //   in Loop: Header=BB17_1 Depth=1
	ld	r1, r5,JTI17_0
	jsr	r1, r1
BB17_4:                                 //   in Loop: Header=BB17_1 Depth=1
	sub	r1, r3, 0x2
	bc	EQ, BB17_13
// BB#5:                                //   in Loop: Header=BB17_1 Depth=1
	sub	r1, r3, 0x1
	bc	NE, BB17_15
	bra	BB17_6
BB17_7:                                 //   in Loop: Header=BB17_1 Depth=1
	sub	r1, r3, 0x0
	bc	EQ, BB17_13
// BB#8:                                //   in Loop: Header=BB17_1 Depth=1
	sub	r1, r3, 0x3
	bc	EQ, BB17_6
	bra	BB17_15
BB17_9:                                 //   in Loop: Header=BB17_1 Depth=1
	sub	r1, r3, 0x3
	bc	EQ, BB17_13
// BB#10:                               //   in Loop: Header=BB17_1 Depth=1
	sub	r1, r3, 0x0
	bc	EQ, BB17_6
	bra	BB17_15
BB17_11:                                //   in Loop: Header=BB17_1 Depth=1
	sub	r1, r3, 0x1
	bc	NE, BB17_12
BB17_13:                                //   in Loop: Header=BB17_1 Depth=1
	ld	r1, sp, 0xfffd
	add	r1, r1, 0xffff
	bra	BB17_14
BB17_12:                                //   in Loop: Header=BB17_1 Depth=1
	sub	r1, r3, 0x2
	bc	NE, BB17_15
BB17_6:                                 //   in Loop: Header=BB17_1 Depth=1
	ld	r1, sp, 0xfffd
	add	r1, r1, 0x1
BB17_14:                                //   in Loop: Header=BB17_1 Depth=1
	st	r1, sp, 0xfffd
BB17_15:                                //   in Loop: Header=BB17_1 Depth=1
	st	r3, sp, 0xfffe
BB17_16:                                //   in Loop: Header=BB17_1 Depth=1
	ld	r1, sp, 0xfffd
	sub	r1, r1, 0x4
	bc	LT, BB17_18
// BB#17:                               //   in Loop: Header=BB17_1 Depth=1
	mov	r1, 0x1
	bra	BB17_20
BB17_18:                                //   in Loop: Header=BB17_1 Depth=1
	ld	r3, sp, 0xfffd
	sub	r1, r3, 0xfffc
	bc	GT, BB17_21
// BB#19:                               //   in Loop: Header=BB17_1 Depth=1
	mov	r1, 0x2
BB17_20:                                //   in Loop: Header=BB17_1 Depth=1
	st	r1, sp, 0xffff
	mov	r3, 0x0
	st	r3, sp, 0xfffd
	bra	BB17_21
//	.section	.rdata,"r"
JTI17_0:
		BB17_4
		BB17_7
		BB17_9
		BB17_11

//	.section	//.text,"xr"
//align
@ = (@ + 1-1)  & -1
sxc__Z9PIDThreadPv:                     // @_Z9PIDThreadPv
// BB#0:
	add	sp, sp, 0x5
	st	r6, sp, 0xfffb          // 1-byte Folded Spill
	mov	r0, 0x5b
	outp	r0, 0x3e
	mov	r0, 0x2
	outp	r0, 0x43
	outp	r0, 0x45
	mov	r0, 0xbb80
	outp	r0, 0x40
	mov	r1, 0x5dc0
	outp	r1, 0x42
	outp	r0, 0x44
	mov	r2, 0x0
	mov	r4, 0x40
	mov	r5, 0x0
	mov	r6, 0x0
	mov	r0, 0x0
	bra	BB18_1
BB18_13:                                //   in Loop: Header=BB18_1 Depth=1
	outp	r1, 0x26
	ld	r2, sp, 0xfffc          // 1-byte Folded Reload
BB18_1:                                 // %_Z14heating_actionj.exit
                                        // =>This Inner Loop Header: Depth=1
	inp	r1, 0x3e
	inp	r3, 0x43
	ior	r1, r3, r1
	sub	r1, r1, 0x0
	bc	GT, BB18_2
// BB#3:                                //   in Loop: Header=BB18_1 Depth=1
	outp	r4, 0x7
	mov	r1, 0x1
	outp	r1, 0x7
	ld	r1, sxc_target_temp_index
	ld	r1, r1,sxc_selected_profile
	ld	r3, sxc_current_temp
	sub	r6, r1, r3
	add	r4, r6, r5
	sub	r1, r4, 0xd2
	bc	LE, BB18_5
// BB#4:                                //   in Loop: Header=BB18_1 Depth=1
	mov	r5, 0xd2
	mov	r3, 0x1a4
	bra	BB18_6
BB18_2:                                 //   in Loop: Header=BB18_1 Depth=1
	st	r2, sp, 0xfffc          // 1-byte Folded Spill
	bra	BB18_11
BB18_5:                                 //   in Loop: Header=BB18_1 Depth=1
	and	r3, r4, 0x7fff
	rol	r5, r3, 0x1
	mov	r3, 0xfe5c
	sub	r1, r4, 0xff2e
	bc	LT, @ + 1 + 0x1
	mov	r3, r5 //Select--False
	mov	r5, 0xff2e
	sub	r1, r4, 0xff2e
	bc	LT, @ + 1 + 0x1
	mov	r5, r4 //Select--False
BB18_6:                                 //   in Loop: Header=BB18_1 Depth=1
	st	r6, sp, 0xfffc          // 1-byte Folded Spill
	sub	r1, r6, r2
	rol	r1, r1, 0x3
	and	r1, r1, 0xfff8
	rol	r2, r1, 0x1
	and	r2, r2, 0xfffe
	add	r1, r1, r2
	rol	r2, r2, 0x4
	and	r2, r2, 0xfff0
	add	r1, r1, r2
	rol	r2, r6, 0x1
	and	r2, r2, 0xfffe
	rol	r4, r2, 0x2
	and	r4, r4, 0xfffc
	add	r2, r2, r4
	rol	r4, r4, 0x1
	and	r4, r4, 0xfffe
	add	r2, r2, r4
	rol	r4, r4, 0x1
	and	r4, r4, 0xfffe
	add	r2, r2, r4
	rol	r4, r4, 0x1
	and	r4, r4, 0xfffe
	add	r2, r2, r4
	rol	r4, r4, 0x1
	and	r4, r4, 0xfffe
	add	r2, r2, r4
	add	r1, r1, r2
	add	r2, r1, r3
	mov	r3, 0x7d0
	sub	r1, r2, 0x7d0
	bc	GT, BB18_8
// BB#7:                                //   in Loop: Header=BB18_1 Depth=1
	mov	r3, 0x0
	sub	r1, r2, 0x0
	bc	LT, @ + 1 + 0x1
	mov	r3, r2 //Select--False
BB18_8:                                 // %_Z11pid_computeP3Pidjj.exit
                                        //   in Loop: Header=BB18_1 Depth=1
	st	r3, sp, 0xfffe          // 1-byte Folded Spill
	st	r5, sp, 0xfffd          // 1-byte Folded Spill
	mov	r1, 0x1
	outp	r1, 0x6
	add	r0, r0, 0x1
	sub	r1, r0, 0x2
	bc	NE, BB18_10
// BB#9:                                //   in Loop: Header=BB18_1 Depth=1
	ld	r0, sxc_target_temp_index
	add	r0, r0, 0x1
	st	r0, sxc_target_temp_index
	mov	r0, 0x80
	outp	r0, 0x7
	ld	r0, sxc_target_temp_index
	rol	r0, r0, 0x2
	and	r0, r0, 0xfffc
	rol	r1, r0, 0x3
	and	r1, r1, 0xfff8
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	add	r2, r0, 0x64
	ld	r3, sxc_progress_scaler
	jsr	r6, sxc___xinc_udiv
	mov	r1, 0x1
	st	r0, sxc_progress
	mov	r0, 0x80
	outp	r0, 0x6
	mov	r0, 0x100
	outp	r0, 0x7
	st	r1, sxc_print_humidity
	outp	r0, 0x6
	mov	r0, 0x0
BB18_10:                                //   in Loop: Header=BB18_1 Depth=1
	mov	r4, 0x40
	outp	r4, 0x6
	ld	r5, sp, 0xfffd          // 1-byte Folded Reload
	ld	r6, sp, 0xfffe          // 1-byte Folded Reload
BB18_11:                                //   in Loop: Header=BB18_1 Depth=1
	rol	r1, r6, 0x3
	and	r1, r1, 0xfff8
	rol	r2, r1, 0x1
	and	r2, r2, 0xfffe
	add	r1, r1, r2
	inp	r3, 0x3f
	inp	r2, 0x26
	sub	r1, r1, r3
	bc	UGE, BB18_12
// BB#14:                               //   in Loop: Header=BB18_1 Depth=1
	and	r1, r2, 0xff9f
	bra	BB18_13
BB18_12:                                //   in Loop: Header=BB18_1 Depth=1
	ior	r1, r2, 0x60
	bra	BB18_13

//align
@ = (@ + 1-1)  & -1
sxc__Z14HumidityThreadPv:               // @_Z14HumidityThreadPv
// BB#0:
	add	sp, sp, 0x2
	st	r6, sp, 0xfffe          // 1-byte Folded Spill
	mov	r0, 0x5b
	outp	r0, 0x48
	mov	r0, 0xc7
	outp	r0, 0x4a
	mov	r0, 0x0
	st	r0, sp, 0xffff          // 1-byte Folded Spill
	bra	BB19_1
BB19_7:                                 // %_Z12get_humidityjj.exit
                                        //   in Loop: Header=BB19_1 Depth=1
	mov	r0, 0x2
	outp	r0, 0x7
	ld	r0, sxc_humidity
	inp	r0, 0x49
	mov	r2, 0x0
	ld	r3, sp, 0xffff          // 1-byte Folded Reload
	sub	r1, r0, r3
	bc	UGT, @ + 1 + 0x2
	mov	r2, 0xc7 //Select--False
	sub	r0, r0, r3
	add	r0, r0, r2
	rol	r0, r0, 0x2
	and	r0, r0, 0xfffc
	rol	r1, r0, 0x3
	and	r1, r1, 0xfff8
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r2, r0, r1
	mov	r3, 0xc7
	jsr	r6, sxc___xinc_udiv
	rol	r1, r0, 0x2
	and	r1, r1, 0xfffc
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	rol	r1, r1, 0x1
	and	r1, r1, 0xfffe
	add	r2, r0, r1
	mov	r3, 0x64
	jsr	r6, sxc___xinc_udiv
	add	r0, r0, 0xfffa
	st	r0, sxc_humidity
	mov	r0, 0x0
	mov	r1, 0x2
	outp	r1, 0x6
BB19_1:                                 // %.outer
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB19_3 Depth 2
                                        //     Child Loop BB19_6 Depth 2
	sub	r1, r0, 0x1
	bc	NE, BB19_2
BB19_6:                                 //   Parent Loop BB19_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	inp	r0, 0x26
	bic	r0, r0, 0x3
	//cmp	r0, 0x0
	bc	VS, BB19_6
	bra	BB19_7
BB19_2:                                 // %.outer
                                        //   in Loop: Header=BB19_1 Depth=1
	sub	r1, r0, 0x0
	bc	NE, BB19_5
BB19_3:                                 // %.outer.split.us..outer.split.us.split_crit_edge
                                        //   Parent Loop BB19_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	inp	r0, 0x26
	and	r0, r0, 0xfff8
	rol	r0, r0, 0xd
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZS, BB19_3
// BB#4:                                // %.us-lcssa.us
                                        //   in Loop: Header=BB19_1 Depth=1
	inp	r1, 0x49
	st	r1, sp, 0xffff          // 1-byte Folded Spill
	bra	BB19_1
BB19_5:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x26
	bra	BB19_5

//align
@ = (@ + 1-1)  & -1
sxc__Z15stateOLEDThreadPv:              // @_Z15stateOLEDThreadPv
// BB#0:
	add	sp, sp, 0x4f
	st	r6, sp, 0xffb1          // 1-byte Folded Spill
	jsr	r6, sxc__Z19OLED_Init_160128RGBv
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	mov	r2, 0x4
	mov	r0, 0x5b
	add	r0, r0, sxc_selected_profile
	st	r0, sp, 0xfff2          // 1-byte Folded Spill
	mov	r0, 0x7c
	add	r0, r0, sxc_selected_profile
	st	r0, sp, 0xfff3          // 1-byte Folded Spill
	mov	r0, 0x3d
	add	r0, r0, sxc_selected_profile
	st	r0, sp, 0xfff4          // 1-byte Folded Spill
	mov	r0, 0x6d
	add	r0, r0, sxc_selected_profile
	st	r0, sp, 0xfff5          // 1-byte Folded Spill
	mov	r3, 0x0
	bra	BB20_1
BB20_39:                                // %_Z21generate_RSS_profile1P7profile.exit
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r2, 0x4
	outp	r2, 0x6
BB20_1:                                 // %.outer
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB20_44 Depth 2
                                        //       Child Loop BB20_49 Depth 3
                                        //       Child Loop BB20_48 Depth 3
                                        //       Child Loop BB20_46 Depth 3
                                        //     Child Loop BB20_56 Depth 2
                                        //     Child Loop BB20_19 Depth 2
                                        //     Child Loop BB20_20 Depth 2
                                        //     Child Loop BB20_22 Depth 2
                                        //     Child Loop BB20_24 Depth 2
                                        //     Child Loop BB20_26 Depth 2
                                        //     Child Loop BB20_27 Depth 2
                                        //     Child Loop BB20_29 Depth 2
                                        //     Child Loop BB20_31 Depth 2
                                        //     Child Loop BB20_33 Depth 2
                                        //     Child Loop BB20_34 Depth 2
                                        //     Child Loop BB20_36 Depth 2
                                        //     Child Loop BB20_38 Depth 2
	sub	r1, r3, r2
	bc	UGT, BB20_69
// BB#2:                                // %.outer
                                        //   in Loop: Header=BB20_1 Depth=1
	ld	r1, r3,JTI20_0
	jsr	r1, r1
BB20_3:                                 // %.split
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x10
	outp	r0, 0x7
	ld	r0, sxc_profile_index
	st	r0, sp, 0xffef          // 1-byte Folded Spill
	add	r2, sp, 0xffe5
	st	r2, sp, 0xfff0          // 1-byte Folded Spill
	mov	r3, sxc__ZZ17OLED_profile_pagejE4text
	mov	r4, 0x9
	jsr	r6, sxc_memcpy
	ld	r0, sp, 0xffef          // 1-byte Folded Reload
	add	r0, r0, 0x30
	st	r0, sp, 0xffee
	mov	r0, 0x9
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r2, 0x2
	mov	r3, 0x5
	mov	r4, 0x64
	ld	r5, sp, 0xfff0          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0x1
	st	r0, sp, 0xffff
	add	r5, sp, 0xffee
	mov	r2, 0x2
	mov	r3, 0x78
	mov	r4, 0x64
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffd0
	st	r2, sp, 0xfff0          // 1-byte Folded Spill
	mov	r3, sxc__ZZ17OLED_profile_pagejE5text2
	mov	r4, 0xa
	jsr	r6, sxc_memcpy
	mov	r0, 0xa
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r2, 0x1
	mov	r3, 0x14
	mov	r4, 0x4d
	ld	r5, sp, 0xfff0          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffb8
	st	r2, sp, 0xfff0          // 1-byte Folded Spill
	mov	r3, sxc__ZZ17OLED_profile_pagejE5text3
	mov	r4, 0xb
	jsr	r6, sxc_memcpy
	mov	r0, 0xb
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r2, 0x1
	mov	r3, 0x14
	mov	r4, 0x40
	ld	r5, sp, 0xfff0          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r0, 0x0
	st	r0, sp, 0xffff
	mov	r2, 0xf
	mov	r3, 0xf
	mov	r4, 0x62
	mov	r5, 0xffff
	jsr	r6, sxc__Z21OLED_Text2x_160128RGBhhhmm
	mov	r0, 0x0
	st	r0, sp, 0xffff
	mov	r2, 0x85
	mov	r3, 0xf
	mov	r4, 0x63
	mov	r5, 0xffff
	jsr	r6, sxc__Z21OLED_Text2x_160128RGBhhhmm
	mov	r0, 0x0
	st	r0, sp, 0xffff
	mov	r2, 0x50
	mov	r3, 0x1a
	mov	r4, 0x64
	mov	r5, 0xffff
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r0, sp, 0xffef          // 1-byte Folded Reload
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB20_4
// BB#5:                                //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x0
	st	r0, sp, 0xffff
	mov	r2, 0x50
	mov	r3, 0x12
	mov	r4, 0x67
	mov	r5, 0xffff
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0x0
	st	r0, sp, 0xffff
	mov	r2, 0x50
	mov	r3, 0xa
	mov	r4, 0x68
	bra	BB20_6
BB20_43:                                // %.split11
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x1
	outp	r0, 0x7
	mov	r0, 0x2
	outp	r0, 0x7
	mov	r0, 0x40
	outp	r0, 0x7
	mov	r0, 0x10
	outp	r0, 0x7
	ld	r0, sxc_profile_index
	st	r0, sp, 0xffef          // 1-byte Folded Spill
	jsr	r6, sxc__Z19OLED_Init_160128RGBv
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	add	r2, sp, 0xffe5
	st	r2, sp, 0xfff0          // 1-byte Folded Spill
	mov	r3, sxc__ZZ21OLED_display_progressjE4arr1
	mov	r4, 0x9
	jsr	r6, sxc_memcpy
	mov	r0, 0x8
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r2, 0x1
	mov	r3, 0x5
	mov	r4, 0x69
	ld	r5, sp, 0xfff0          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	ld	r0, sp, 0xffef          // 1-byte Folded Reload
	add	r0, r0, 0x30
	st	r0, sp, 0xffee
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0x1
	st	r0, sp, 0xffff
	add	r5, sp, 0xffee
	mov	r2, 0x1
	mov	r3, 0x65
	mov	r4, 0x69
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffb8
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r3, sxc__ZZ21OLED_display_progressjE12arr_progress
	mov	r4, 0x9
	jsr	r6, sxc_memcpy
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0x9
	st	r0, sp, 0xffff
	mov	r2, 0x1
	mov	r3, 0x14
	mov	r4, 0x32
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffd0
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r3, sxc__ZZ21OLED_display_progressjE8arr_temp
	mov	r4, 0xc
	jsr	r6, sxc_memcpy
	mov	r0, 0xc
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r2, 0x1
	mov	r3, 0x14
	mov	r4, 0x1e
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffdc
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r3, sxc__ZZ21OLED_display_progressjE7arr_hum
	mov	r4, 0x9
	jsr	r6, sxc_memcpy
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0x9
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0x0
	st	r0, sp, 0xfff0          // 1-byte Folded Spill
	mov	r2, 0x1
	mov	r3, 0x14
	mov	r4, 0xa
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r3, 0x46
BB20_44:                                //   Parent Loop BB20_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB20_49 Depth 3
                                        //       Child Loop BB20_48 Depth 3
                                        //       Child Loop BB20_46 Depth 3
	st	r3, sp, 0xfff1          // 1-byte Folded Spill
	mov	r2, 0x14
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	ld	r0, sp, 0xfff0          // 1-byte Folded Reload
	sub	r1, r0, 0x1d
	bc	NE, BB20_47
// BB#45:                               //   in Loop: Header=BB20_44 Depth=2
	mov	r0, 0x80
BB20_46:                                // %.lr.ph.split.split.us.i.i
                                        //   Parent Loop BB20_1 Depth=1
                                        //     Parent Loop BB20_44 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	st	r0, sp, 0xffef          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xffef          // 1-byte Folded Reload
	add	r0, r0, 0xffff
	//cmp	r0, 0x0
	bc	ZC, BB20_46
	bra	BB20_54
BB20_47:                                //   in Loop: Header=BB20_44 Depth=2
	mov	r2, 0x0
	mov	r3, 0x80
	sub	r1, r0, 0x0
	bc	NE, BB20_49
BB20_48:                                // %.lr.ph.split.us..lr.ph.split.us.split_crit_edge.i.i
                                        //   Parent Loop BB20_1 Depth=1
                                        //     Parent Loop BB20_44 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	st	r3, sp, 0xffef          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r3, sp, 0xffef          // 1-byte Folded Reload
	add	r3, r3, 0xffff
	//cmp	r3, 0x0
	bc	ZC, BB20_48
	bra	BB20_54
BB20_49:                                // %.lr.ph.split..lr.ph.split.split_crit_edge.i.i
                                        //   Parent Loop BB20_1 Depth=1
                                        //     Parent Loop BB20_44 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	sub	r1, r2, 0x0
	bc	EQ, BB20_51
// BB#50:                               // %.lr.ph.split..lr.ph.split.split_crit_edge.i.i
                                        //   in Loop: Header=BB20_49 Depth=3
	sub	r1, r2, 0x7f
	bc	NE, BB20_52
BB20_51:                                //   in Loop: Header=BB20_49 Depth=3
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r2, 0xf800
	bra	BB20_53
BB20_52:                                //   in Loop: Header=BB20_49 Depth=3
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r2, 0x0
BB20_53:                                //   in Loop: Header=BB20_49 Depth=3
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r2, sp, 0xffef          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x80
	bc	NE, BB20_49
BB20_54:                                // %._crit_edge.i.i
                                        //   in Loop: Header=BB20_44 Depth=2
	ld	r3, sp, 0xfff1          // 1-byte Folded Reload
	add	r3, r3, 0x1
	ld	r0, sp, 0xfff0          // 1-byte Folded Reload
	add	r0, r0, 0x1
	st	r0, sp, 0xfff0          // 1-byte Folded Spill
	sub	r1, r0, 0x1e
	bc	NE, BB20_44
// BB#55:                               // %_Z21OLED_display_progressj.exit
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r2, 0x18
	mov	r3, 0x0
	jsr	r6, sxc__Z8Draw_Barhhmmjjj
	mov	r0, 0x10
	outp	r0, 0x6
	mov	r0, 0x40
	outp	r0, 0x6
	mov	r0, 0x2
	outp	r0, 0x6
	mov	r0, 0x1
	outp	r0, 0x6
	mov	r2, 0x8000
	outp	r2, 0x7
	ld	r1, thrds_vector
	and	r1, r1, 0xffef
	st	r1, thrds_vector
	outp	r1, 0x4
	outp	r2, 0x6
	outp	r2, 0x7
	ld	r1, thrds_vector
	and	r1, r1, 0xffdf
	st	r1, thrds_vector
	outp	r1, 0x4
	outp	r2, 0x6
	ld	r1, sxc_progress
	mov	r2, 0x0
	mov	r3, 0xffff
	mov	r4, 0x64
	sub	r1, r1, r4
	bc	UGT, BB20_61
BB20_56:                                // %.lr.ph
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, 0x1
	outp	r0, 0x7
	mov	r0, 0x40
	outp	r0, 0x7
	mov	r0, 0x4
	outp	r0, 0x7
	ld	r1, sxc_btn_press
	st	r1, sp, 0xffef          // 1-byte Folded Spill
	outp	r0, 0x6
	mov	r0, 0x80
	outp	r0, 0x7
	ld	r4, sxc_progress
	st	r4, sp, 0xfff0          // 1-byte Folded Spill
	st	r2, sp, 0xfffe
	st	r3, sp, 0xffff
	mov	r2, 0x53
	mov	r3, 0x32
	mov	r5, 0x1
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjjmm
	mov	r2, 0x1a
	ld	r3, sp, 0xfff0          // 1-byte Folded Reload
	jsr	r6, sxc__Z8Draw_Barhhmmjjj
	mov	r0, 0x80
	outp	r0, 0x6
	ld	r4, sxc_current_temp
	mov	r0, 0xffff
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffe
	mov	r2, 0x68
	mov	r3, 0x1e
	mov	r5, 0x0
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjjmm
	mov	r2, 0x4
	ld	r0, sp, 0xffef          // 1-byte Folded Reload
	sub	r1, r0, 0x1
	bc	EQ, @ + 1 + 0x1
	mov	r2, 0x1 //Select--False
	mov	r0, 0x100
	outp	r0, 0x7
	ld	r0, sxc_print_humidity
	sub	r1, r0, 0x1
	bc	NE, BB20_57
// BB#58:                               //   in Loop: Header=BB20_56 Depth=2
	mov	r0, 0x2
	outp	r0, 0x7
	ld	r4, sxc_humidity
	mov	r0, 0xffff
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffe
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r2, 0x53
	mov	r3, 0xa
	mov	r5, 0x1
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjjmm
	ld	r2, sxc_humidity
	mov	r0, 0x3
	mov	r3, 0x3c
	ld	r4, sp, 0xffef          // 1-byte Folded Reload
	sub	r1, r2, r3
	bc	UGT, @ + 1 + 0x1
	mov	r0, r4 //Select--False
	mov	r1, 0x2
	outp	r1, 0x6
	mov	r1, 0x0
	st	r1, sxc_print_humidity
	bra	BB20_59
BB20_57:                                //   in Loop: Header=BB20_56 Depth=2
	add	r0, r2, 0x0
BB20_59:                                //   in Loop: Header=BB20_56 Depth=2
	mov	r1, 0x100
	outp	r1, 0x6
	mov	r1, 0x40
	outp	r1, 0x6
	mov	r1, 0x1
	outp	r1, 0x6
	ld	r1, sxc_progress
	mov	r2, 0x0
	mov	r3, 0x64
	sub	r1, r1, r3
	bc	UGT, BB20_61
// BB#60:                               //   in Loop: Header=BB20_56 Depth=2
	mov	r3, 0xffff
	sub	r1, r0, 0x1
	bc	EQ, BB20_56
BB20_61:                                // %.critedge
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r3, 0x8000
	outp	r3, 0x7
	ld	r1, thrds_vector
	ior	r1, r1, 0x8
	st	r1, thrds_vector
	outp	r1, 0x4
	outp	r3, 0x6
	outp	r3, 0x7
	ld	r1, thrds_vector
	ior	r1, r1, 0x10
	st	r1, thrds_vector
	outp	r1, 0x4
	outp	r3, 0x6
	outp	r3, 0x7
	ld	r1, thrds_vector
	ior	r1, r1, 0x20
	st	r1, thrds_vector
	outp	r1, 0x4
	outp	r3, 0x6
	inp	r1, 0x26
	and	r1, r1, 0xff9f
	outp	r1, 0x26
	mov	r3, 0x3
	sub	r1, r0, 0x3
	bc	EQ, BB20_63
// BB#62:                               //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x80
	outp	r0, 0x7
	st	r2, sxc_progress
	outp	r0, 0x6
	mov	r3, 0x4
BB20_63:                                //   in Loop: Header=BB20_1 Depth=1
	st	r3, sp, 0xffef          // 1-byte Folded Spill
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	ld	r3, sp, 0xffef          // 1-byte Folded Reload
	mov	r2, 0x4
	bra	BB20_1
BB20_40:                                // %.split8
                                        //   in Loop: Header=BB20_1 Depth=1
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	mov	r0, 0x47
	st	r0, sp, 0xffbf
	mov	r0, 0x4e
	st	r0, sp, 0xffbe
	mov	r0, 0x49
	st	r0, sp, 0xffbd
	mov	r0, 0x41
	st	r0, sp, 0xffba
	mov	r0, 0x54
	st	r0, sp, 0xffbc
	st	r0, sp, 0xffb9
	mov	r1, 0x52
	st	r1, sp, 0xffbb
	mov	r0, 0x53
	st	r0, sp, 0xffb8
	mov	r0, 0x2e
	st	r0, sp, 0xffd7
	st	r0, sp, 0xffd6
	mov	r0, 0x57
	st	r0, sp, 0xffd5
	mov	r0, 0x4f
	st	r0, sp, 0xffd4
	mov	r0, 0x4c
	st	r0, sp, 0xffd3
	mov	r0, 0x46
	st	r0, sp, 0xffd2
	mov	r0, 0x45
	st	r0, sp, 0xffd1
	st	r1, sp, 0xffd0
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0x1f00
	st	r0, sp, 0xfffe
	mov	r0, 0x8
	st	r0, sp, 0xffff
	add	r5, sp, 0xffb8
	mov	r2, 0x2
	mov	r3, 0x5
	mov	r4, 0x53
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0x1f00
	st	r0, sp, 0xfffe
	mov	r0, 0x8
	st	r0, sp, 0xffff
	add	r5, sp, 0xffd0
	mov	r2, 0x2
	mov	r3, 0x5
	mov	r4, 0x1f
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r1, 0x8000
	outp	r1, 0x7
	ld	r0, thrds_vector
	and	r0, r0, 0xfff7
	st	r0, thrds_vector
	outp	r0, 0x4
	outp	r1, 0x6
	mov	r2, 0x3e8
	jsr	r6, sxc__Z7wait_msj
	mov	r0, 0x1
	outp	r0, 0x7
	ld	r0, sxc_current_temp
	mov	r1, 0x63
	sub	r1, r0, r1
	bc	UGT, BB20_42
// BB#41:                               //   in Loop: Header=BB20_1 Depth=1
	inp	r0, 0x26
	ior	r0, r0, 0x60
	outp	r0, 0x26
BB20_42:                                //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x1
	outp	r0, 0x6
	mov	r2, 0x3e8
	jsr	r6, sxc__Z7wait_msj
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	mov	r3, 0x1
	mov	r2, 0x4
	bra	BB20_1
BB20_64:                                // %.split14
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r1, sxc__ZZ20OLED_display_warningvE4text
	ld	r0, r1, 0x6
	st	r0, sp, 0xffe2
	ld	r0, r1, 0x5
	st	r0, sp, 0xffe1
	ld	r0, r1, 0x4
	st	r0, sp, 0xffe0
	ld	r0, r1, 0x3
	st	r0, sp, 0xffdf
	ld	r0, r1, 0x2
	st	r0, sp, 0xffde
	ld	r0, r1, 0x1
	st	r0, sp, 0xffdd
	ld	r0, sxc__ZZ20OLED_display_warningvE4text
	st	r0, sp, 0xffdc
	mov	r0, 0x1f
	st	r0, sp, 0xfffe
	mov	r0, 0x7
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	add	r5, sp, 0xffdc
	mov	r2, 0x2
	mov	r3, 0x9
	mov	r4, 0x62
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffb8
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r3, sxc__ZZ20OLED_display_warningvE5text1
	mov	r4, 0x13
	jsr	r6, sxc_memcpy
	mov	r0, 0x13
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r2, 0x1
	mov	r3, 0x9
	mov	r4, 0x53
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffd0
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r3, sxc__ZZ20OLED_display_warningvE5text2
	mov	r4, 0xc
	jsr	r6, sxc_memcpy
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0xc
	st	r0, sp, 0xffff
	mov	r2, 0x1
	mov	r3, 0x9
	mov	r4, 0x47
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r2, 0x64
	jsr	r6, sxc__Z7wait_msj
	jsr	r6, sxc__Z27OLED_display_second_warningv
	mov	r2, 0x4
	outp	r2, 0x7
	inp	r0, 0x2e
	and	r0, r0, 0xfffc
	rol	r0, r0, 0xe
	and	r0, r0, 0x1
	xor	r0, r0, 0x1
	st	r0, sxc_btn_press
	mov	r3, 0x3
	ld	r0, sxc_btn_press
	sub	r1, r0, 0x1
	bc	NE, BB20_66
// BB#65:                               //   in Loop: Header=BB20_1 Depth=1
	outp	r2, 0x6
	mov	r2, 0x3e8
	jsr	r6, sxc__Z7wait_msj
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	mov	r2, 0x4
	mov	r3, 0x2
BB20_66:                                //   in Loop: Header=BB20_1 Depth=1
	outp	r2, 0x6
	bra	BB20_1
BB20_67:                                // %.split17
                                        //   in Loop: Header=BB20_1 Depth=1
	add	r2, sp, 0xffe5
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r3, sxc__ZZ17OLED_end_progressvE4text
	mov	r4, 0x9
	jsr	r6, sxc_memcpy
	mov	r0, 0x9
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r2, 0x2
	mov	r3, 0x5
	mov	r4, 0x64
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r2, sp, 0xffb8
	st	r2, sp, 0xffef          // 1-byte Folded Spill
	mov	r3, sxc__ZZ17OLED_end_progressvE5text2
	mov	r4, 0xe
	jsr	r6, sxc_memcpy
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0xe
	st	r0, sp, 0xffff
	mov	r2, 0x1
	mov	r3, 0x5
	mov	r4, 0x4b
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r2, 0x64
	jsr	r6, sxc__Z7wait_msj
	jsr	r6, sxc__Z27OLED_display_second_warningv
	mov	r3, 0x4
	outp	r3, 0x7
	inp	r0, 0x2e
	and	r0, r0, 0xfffc
	rol	r0, r0, 0xe
	and	r0, r0, 0x1
	xor	r0, r0, 0x1
	st	r0, sxc_btn_press
	ld	r0, sxc_btn_press
	sub	r1, r0, 0x1
	bc	NE, BB20_39
// BB#68:                               //   in Loop: Header=BB20_1 Depth=1
	mov	r2, 0x3e8
	jsr	r6, sxc__Z7wait_msj
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	mov	r3, 0x0
	bra	BB20_39
BB20_4:                                 //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x0
	st	r0, sp, 0xffff
	mov	r2, 0x50
	mov	r3, 0x12
	mov	r4, 0x65
	mov	r5, 0xffff
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0x0
	st	r0, sp, 0xffff
	mov	r2, 0x50
	mov	r3, 0xa
	mov	r4, 0x66
BB20_6:                                 //   in Loop: Header=BB20_1 Depth=1
	mov	r5, 0xffff
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r0, sxc_profile_index
	st	r0, sp, 0xffef          // 1-byte Folded Spill
	add	r2, sp, 0xffb8
	st	r2, sp, 0xfff0          // 1-byte Folded Spill
	mov	r3, sxc__ZZ18OLED_profile_timesPjE5text4
	mov	r4, 0xd
	jsr	r6, sxc_memcpy
	mov	r0, 0xd
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r2, 0x1
	mov	r3, 0x14
	mov	r4, 0x33
	ld	r5, sp, 0xfff0          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r0, 0x0
	st	r0, sp, 0xfffe
	mov	r0, 0xf800
	st	r0, sp, 0xffff
	ld	r0, sp, 0xffef          // 1-byte Folded Reload
	rol	r0, r0, 0x1
	and	r0, r0, 0xfffe
	rol	r1, r0, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	st	r0, sp, 0xffef          // 1-byte Folded Spill
	ld	r4, r0,sxc_profile_array-6
	mov	r2, 0x61
	mov	r3, 0x4d
	mov	r5, 0x3
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjjmm
	mov	r0, 0x0
	st	r0, sp, 0xfffe
	mov	r0, 0xf800
	st	r0, sp, 0xffff
	ld	r0, sp, 0xffef          // 1-byte Folded Reload
	ld	r4, r0,sxc_profile_array-5
	mov	r2, 0x68
	mov	r3, 0x40
	mov	r5, 0x3
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjjmm
	mov	r0, 0xf800
	st	r0, sp, 0xffff
	mov	r0, 0x0
	st	r0, sp, 0xfffe
	ld	r0, sp, 0xffef          // 1-byte Folded Reload
	ld	r4, r0,sxc_profile_array-4
	mov	r2, 0x76
	mov	r3, 0x33
	mov	r5, 0x3
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjjmm
	mov	r0, 0x73
	st	r0, sp, 0xffee
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0x1
	st	r0, sp, 0xffff
	add	r5, sp, 0xffee
	st	r5, sp, 0xffef          // 1-byte Folded Spill
	mov	r2, 0x1
	mov	r3, 0x76
	mov	r4, 0x4d
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0x1
	st	r0, sp, 0xffff
	mov	r2, 0x1
	mov	r3, 0x7d
	mov	r4, 0x40
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r0, 0x0
	st	r0, sp, 0xfffd
	mov	r0, 0xffff
	st	r0, sp, 0xfffe
	mov	r0, 0x1
	st	r0, sp, 0xffff
	mov	r2, 0x1
	mov	r3, 0x8b
	mov	r4, 0x33
	ld	r5, sp, 0xffef          // 1-byte Folded Reload
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r3, 0x10
	outp	r3, 0x6
	mov	r0, 0x8
	outp	r0, 0x7
	mov	r4, sxc_r_encoder
	ld	r0, r4, 0x2
	sub	r1, r0, 0x1
	bc	NE, BB20_10
// BB#7:                                //   in Loop: Header=BB20_1 Depth=1
	outp	r3, 0x7
	ld	r0, sxc_profile_index
	add	r0, r0, 0x1
	st	r0, sxc_profile_index
	ld	r0, sxc_profile_index
	mov	r1, 0x4
	sub	r1, r0, r1
	bc	ULT, BB20_9
// BB#8:                                //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x1
	st	r0, sxc_profile_index
BB20_9:                                 //   in Loop: Header=BB20_1 Depth=1
	outp	r3, 0x6
	mov	r0, 0x0
	st	r0, r4, 0x2
	bra	BB20_14
BB20_10:                                //   in Loop: Header=BB20_1 Depth=1
	ld	r0, r4, 0x2
	mov	r2, 0x0
	sub	r1, r0, 0x2
	bc	NE, BB20_14
// BB#11:                               //   in Loop: Header=BB20_1 Depth=1
	outp	r3, 0x7
	ld	r0, sxc_profile_index
	add	r0, r0, 0xffff
	st	r0, sxc_profile_index
	ld	r0, sxc_profile_index
	//cmp	r0, 0x0
	bc	ZC, BB20_13
// BB#12:                               //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x3
	st	r0, sxc_profile_index
BB20_13:                                //   in Loop: Header=BB20_1 Depth=1
	outp	r3, 0x6
	st	r2, r4, 0x2
BB20_14:                                //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x8
	outp	r0, 0x6
	mov	r0, 0x4
	outp	r0, 0x7
	inp	r0, 0x2e
	and	r0, r0, 0xfffc
	rol	r0, r0, 0xe
	and	r0, r0, 0x1
	xor	r0, r0, 0x1
	st	r0, sxc_btn_press
	mov	r3, 0x0
	ld	r0, sxc_btn_press
	sub	r1, r0, 0x1
	bc	NE, BB20_39
// BB#15:                               //   in Loop: Header=BB20_1 Depth=1
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	ld	r0, sxc_profile_index
	sub	r1, r0, 0x3
	bc	EQ, BB20_32
// BB#16:                               //   in Loop: Header=BB20_1 Depth=1
	sub	r1, r0, 0x2
	bc	NE, BB20_17
// BB#25:                               //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x19
	st	r0, sxc_selected_profile
	mov	r0, 0x1c
	mov	r1, 0x1
	add	r3, r1, sxc_selected_profile
	mov	r4, sxc_selected_profile
	mov	r5, 0xa0
BB20_26:                                //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, 0x2d
	st	r0, r3, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x3
	sub	r1, r0, 0xa3
	bc	NE, BB20_26
BB20_27:                                // %.lr.ph66.i
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sub	r0, r4, r2
	st	r5, r0, 0x5b
	add	r2, r2, 0xffff
	//cmp	r2, 0x0
	bc	ZC, BB20_27
// BB#28:                               //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0xa3
	ld	r2, sp, 0xfff2          // 1-byte Folded Reload
BB20_29:                                // %.lr.ph59.i
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r0, r2, 0x0
	add	r2, r2, 0x1
	add	r0, r0, 0x3
	sub	r1, r0, 0xfd
	bc	NE, BB20_29
// BB#30:                               // %.lr.ph54.i5.loopexit
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0xfa
	st	r0, r4, 0x79
	st	r0, r4, 0x7a
	st	r0, r4, 0x7b
	mov	r0, 0xf5
	ld	r2, sp, 0xfff3          // 1-byte Folded Reload
BB20_31:                                // %.lr.ph.i9
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r3, 0x2
	st	r0, r2, 0x0
	add	r2, r2, 0x1
	add	r0, r0, 0xfffb
	sub	r1, r0, 0xa0
	bc	NE, BB20_31
	bra	BB20_39
BB20_32:                                //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x19
	st	r0, sxc_selected_profile
	mov	r0, 0x1b
	mov	r1, 0x1
	add	r3, r1, sxc_selected_profile
	mov	r4, 0x73
	mov	r5, sxc_selected_profile
BB20_33:                                //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, 0x2d
	st	r0, r3, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x2
	sub	r1, r0, 0x75
	bc	NE, BB20_33
BB20_34:                                // %.lr.ph66.i15
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sub	r0, r5, r2
	st	r4, r0, 0x5b
	add	r2, r2, 0xffff
	//cmp	r2, 0x0
	bc	ZC, BB20_34
// BB#35:                               //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x75
	ld	r2, sp, 0xfff2          // 1-byte Folded Reload
BB20_36:                                // %.lr.ph59.i19
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r0, r2, 0x0
	add	r2, r2, 0x1
	add	r0, r0, 0x2
	sub	r1, r0, 0xa9
	bc	NE, BB20_36
// BB#37:                               // %.lr.ph54.i22.loopexit
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0xa7
	st	r0, r5, 0x75
	st	r0, r5, 0x76
	st	r0, r5, 0x77
	mov	r0, 0xa2
	mov	r1, 0x78
	add	r2, r1, sxc_selected_profile
BB20_38:                                // %.lr.ph.i26
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r3, 0x2
	st	r0, r2, 0x0
	add	r2, r2, 0x1
	add	r0, r0, 0xfffb
	sub	r1, r0, 0x39
	bc	NE, BB20_38
	bra	BB20_39
BB20_17:                                //   in Loop: Header=BB20_1 Depth=1
	mov	r3, 0x2
	mov	r4, sxc_selected_profile
	sub	r1, r0, 0x1
	bc	NE, BB20_39
// BB#18:                               //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x19
	st	r0, sxc_selected_profile
	mov	r0, 0x1e
	mov	r1, 0x1
	add	r2, r1, sxc_selected_profile
BB20_19:                                //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r3, 0x65
	st	r0, r2, 0x0
	add	r2, r2, 0x1
	add	r0, r0, 0x5
	sub	r1, r0, 0x69
	bc	NE, BB20_19
BB20_20:                                // %.lr.ph68.i
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r3, r3,sxc_selected_profile-85
	add	r3, r3, 0x1
	sub	r1, r3, 0x92
	bc	NE, BB20_20
// BB#21:                               //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0x93
	ld	r2, sp, 0xfff4          // 1-byte Folded Reload
BB20_22:                                // %.lr.ph60.i
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r0, r2, 0x0
	add	r2, r2, 0x1
	add	r0, r0, 0x2
	sub	r1, r0, 0xed
	bc	NE, BB20_22
// BB#23:                               // %.lr.ph54.i.loopexit
                                        //   in Loop: Header=BB20_1 Depth=1
	mov	r0, 0xeb
	st	r0, r4, 0x6a
	st	r0, r4, 0x6b
	st	r0, r4, 0x6c
	mov	r0, 0xe6
	ld	r2, sp, 0xfff5          // 1-byte Folded Reload
BB20_24:                                // %.lr.ph.i
                                        //   Parent Loop BB20_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r3, 0x2
	st	r0, r2, 0x0
	add	r2, r2, 0x1
	add	r0, r0, 0xfffb
	sub	r1, r0, 0x46
	bc	NE, BB20_24
	bra	BB20_39
BB20_69:                                // %infloop
                                        // =>This Inner Loop Header: Depth=1
	bra	BB20_69
//	.section	.rdata,"r"
JTI20_0:
		BB20_3
		BB20_43
		BB20_40
		BB20_64
		BB20_67

//	.section	//.text,"xr"
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
BB21_1:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	LT0, BB21_1
// BB#2:
	mov	r0, 0x1
	outp	r0, 0x75
	mov	r0, 0x805
	outp	r0, 0x74
	inp	r0, 0x72
	and	r0, r0, 0xfbff
	outp	r0, 0x72
BB21_3:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	LT0, BB21_3
// BB#4:
	inp	r0, 0x72
	ior	r0, r0, 0xc00
	outp	r0, 0x72
BB21_5:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	NC, BB21_5
// BB#6:                                // %_Z8InitGPIOv.exit
	mov	r0, 0x8183
	outp	r0, 0x73
	mov	r0, 0xf
	outp	r0, 0x37
	mov	r0, 0x8700
	outp	r0, 0x21
	inp	r0, 0x20
	ior	r0, r0, 0x4
	outp	r0, 0x20
	inp	r0, 0x20
	ior	r0, r0, 0x80
	outp	r0, 0x20
	mov	r0, 0x11
	outp	r0, 0x70
	mov	r0, 0xe
	outp	r0, 0x71
	mov	r3, 0x12
	outp	r3, 0x70
	outp	r0, 0x71
	mov	r0, 0x6000
	outp	r0, 0x27
	mov	r0, 0x200
	outp	r0, 0x33
	inp	r0, 0x32
	ior	r0, r0, 0x2
	outp	r0, 0x32
	mov	r2, 0x1a
	outp	r2, 0x70
	mov	r0, 0x60
	outp	r0, 0x71
	mov	r0, 0x8000
	outp	r0, 0x7
	mov	r1, 0xa
	outp	r1, 0x3
	mov	r1, 0x0
	outp	r1, 0x0
	mov	r4, sxc__Z15stateOLEDThreadPv
	outp	r4, 0x1
	outp	r0, 0x6
	outp	r0, 0x7
	ld	r4, thrds_vector
	and	r4, r4, 0xfffd
	st	r4, thrds_vector
	outp	r4, 0x4
	outp	r0, 0x6
	outp	r0, 0x7
	outp	r3, 0x3
	outp	r1, 0x0
	mov	r3, sxc__Z14RotEncodThreadPv
	outp	r3, 0x1
	outp	r0, 0x6
	outp	r0, 0x7
	ld	r3, thrds_vector
	and	r3, r3, 0xfffb
	st	r3, thrds_vector
	outp	r3, 0x4
	outp	r0, 0x6
	outp	r0, 0x7
	outp	r2, 0x3
	outp	r1, 0x0
	mov	r2, sxc__Z10TempThreadPv
	outp	r2, 0x1
	outp	r0, 0x6
	outp	r0, 0x7
	mov	r2, 0x22
	outp	r2, 0x3
	outp	r1, 0x0
	mov	r2, sxc__Z14HumidityThreadPv
	outp	r2, 0x1
	outp	r0, 0x6
	outp	r0, 0x7
	mov	r2, 0x2a
	outp	r2, 0x3
	outp	r1, 0x0
	mov	r1, sxc__Z9PIDThreadPv
	outp	r1, 0x1
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
	bc	EQ, BB24_3
// BB#1:
	add	r0, r2, 0x0
BB24_2:                                 // %.lr.ph
                                        // =>This Inner Loop Header: Depth=1
	st	r3, r0, 0x0
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB24_2
BB24_3:                                 // %._crit_edge
	add	r0, r2, 0x0
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc_memcpy:                             // @memcpy
// BB#0:
	sub	r1, r2, r3
	bc	EQ, BB25_4
// BB#1:
	sub	r1, r4, 0x0
	bc	EQ, BB25_4
// BB#2:
	add	r0, r2, 0x0
BB25_3:                                 // %.lr.ph.i
                                        // =>This Inner Loop Header: Depth=1
	ld	r1, r3, 0x0
	st	r1, r0, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB25_3
BB25_4:                                 // %memcpy_base.exit
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
	bc	UGE, BB26_1
// BB#4:
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB26_7
// BB#5:                                // %.lr.ph23.i.preheader
	mov	r0, 0x1
	sub	r0, r0, r4
BB26_6:                                 // %.lr.ph23.i
                                        // =>This Inner Loop Header: Depth=1
	sub	r1, r2, r0
	sub	r4, r3, r0
	ld	r4, r4, 0x0
	st	r4, r1, 0x0
	add	r0, r0, 0x1
	sub	r1, r0, 0x1
	bc	NE, BB26_6
	bra	BB26_7
BB26_1:
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB26_7
// BB#2:
	add	r0, r2, 0x0
BB26_3:                                 // %.lr.ph.i
                                        // =>This Inner Loop Header: Depth=1
	ld	r1, r3, 0x0
	st	r1, r0, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB26_3
BB26_7:                                 // %memcpy_base.exit
	add	r0, r2, 0x0
	jsr	r6, r6

@ = (@ + 0x800-1)  & -0x800//	.section	//.data,"w"
sxc_Ascii_1:                            // @Ascii_1
	@ = @ + 5
		0                       // 0x0
		0                       // 0x0
		79                      // 0x4f
		0                       // 0x0
		0                       // 0x0
		0                       // 0x0
		7                       // 0x7
		0                       // 0x0
		7                       // 0x7
		0                       // 0x0
		20                      // 0x14
		127                     // 0x7f
		20                      // 0x14
		127                     // 0x7f
		20                      // 0x14
		36                      // 0x24
		42                      // 0x2a
		127                     // 0x7f
		42                      // 0x2a
		18                      // 0x12
		35                      // 0x23
		19                      // 0x13
		8                       // 0x8
		100                     // 0x64
		98                      // 0x62
		54                      // 0x36
		73                      // 0x49
		85                      // 0x55
		34                      // 0x22
		80                      // 0x50
		0                       // 0x0
		5                       // 0x5
		3                       // 0x3
		0                       // 0x0
		0                       // 0x0
		0                       // 0x0
		28                      // 0x1c
		34                      // 0x22
		65                      // 0x41
		0                       // 0x0
		0                       // 0x0
		65                      // 0x41
		34                      // 0x22
		28                      // 0x1c
		0                       // 0x0
		20                      // 0x14
		8                       // 0x8
		62                      // 0x3e
		8                       // 0x8
		20                      // 0x14
		8                       // 0x8
		8                       // 0x8
		62                      // 0x3e
		8                       // 0x8
		8                       // 0x8
		0                       // 0x0
		80                      // 0x50
		48                      // 0x30
		0                       // 0x0
		0                       // 0x0
		8                       // 0x8
		8                       // 0x8
		8                       // 0x8
		8                       // 0x8
		8                       // 0x8
		0                       // 0x0
		96                      // 0x60
		96                      // 0x60
		0                       // 0x0
		0                       // 0x0
		32                      // 0x20
		16                      // 0x10
		8                       // 0x8
		4                       // 0x4
		2                       // 0x2
		62                      // 0x3e
		81                      // 0x51
		73                      // 0x49
		69                      // 0x45
		62                      // 0x3e
		0                       // 0x0
		66                      // 0x42
		127                     // 0x7f
		64                      // 0x40
		0                       // 0x0
		66                      // 0x42
		97                      // 0x61
		81                      // 0x51
		73                      // 0x49
		70                      // 0x46
		33                      // 0x21
		65                      // 0x41
		69                      // 0x45
		75                      // 0x4b
		49                      // 0x31
		24                      // 0x18
		20                      // 0x14
		18                      // 0x12
		127                     // 0x7f
		16                      // 0x10
		39                      // 0x27
		69                      // 0x45
		69                      // 0x45
		69                      // 0x45
		57                      // 0x39
		60                      // 0x3c
		74                      // 0x4a
		73                      // 0x49
		73                      // 0x49
		48                      // 0x30
		1                       // 0x1
		113                     // 0x71
		9                       // 0x9
		5                       // 0x5
		3                       // 0x3
		54                      // 0x36
		73                      // 0x49
		73                      // 0x49
		73                      // 0x49
		54                      // 0x36
		6                       // 0x6
		73                      // 0x49
		73                      // 0x49
		41                      // 0x29
		30                      // 0x1e
		0                       // 0x0
		54                      // 0x36
		54                      // 0x36
		0                       // 0x0
		0                       // 0x0
		0                       // 0x0
		86                      // 0x56
		54                      // 0x36
		0                       // 0x0
		0                       // 0x0
		8                       // 0x8
		20                      // 0x14
		34                      // 0x22
		65                      // 0x41
		0                       // 0x0
		20                      // 0x14
		20                      // 0x14
		20                      // 0x14
		20                      // 0x14
		20                      // 0x14
		0                       // 0x0
		65                      // 0x41
		34                      // 0x22
		20                      // 0x14
		8                       // 0x8
		2                       // 0x2
		1                       // 0x1
		81                      // 0x51
		9                       // 0x9
		6                       // 0x6
		50                      // 0x32
		73                      // 0x49
		121                     // 0x79
		65                      // 0x41
		62                      // 0x3e
		126                     // 0x7e
		17                      // 0x11
		17                      // 0x11
		17                      // 0x11
		126                     // 0x7e
		127                     // 0x7f
		73                      // 0x49
		73                      // 0x49
		73                      // 0x49
		54                      // 0x36
		62                      // 0x3e
		65                      // 0x41
		65                      // 0x41
		65                      // 0x41
		34                      // 0x22
		127                     // 0x7f
		65                      // 0x41
		65                      // 0x41
		34                      // 0x22
		28                      // 0x1c
		127                     // 0x7f
		73                      // 0x49
		73                      // 0x49
		73                      // 0x49
		65                      // 0x41
		127                     // 0x7f
		9                       // 0x9
		9                       // 0x9
		9                       // 0x9
		1                       // 0x1
		62                      // 0x3e
		65                      // 0x41
		73                      // 0x49
		73                      // 0x49
		122                     // 0x7a
		127                     // 0x7f
		8                       // 0x8
		8                       // 0x8
		8                       // 0x8
		127                     // 0x7f
		0                       // 0x0
		65                      // 0x41
		127                     // 0x7f
		65                      // 0x41
		0                       // 0x0
		32                      // 0x20
		64                      // 0x40
		65                      // 0x41
		63                      // 0x3f
		1                       // 0x1
		127                     // 0x7f
		8                       // 0x8
		20                      // 0x14
		34                      // 0x22
		65                      // 0x41
		127                     // 0x7f
		64                      // 0x40
		64                      // 0x40
		64                      // 0x40
		64                      // 0x40
		127                     // 0x7f
		2                       // 0x2
		12                      // 0xc
		2                       // 0x2
		127                     // 0x7f
		127                     // 0x7f
		4                       // 0x4
		8                       // 0x8
		16                      // 0x10
		127                     // 0x7f
		62                      // 0x3e
		65                      // 0x41
		65                      // 0x41
		65                      // 0x41
		62                      // 0x3e
		127                     // 0x7f
		9                       // 0x9
		9                       // 0x9
		9                       // 0x9
		6                       // 0x6
		62                      // 0x3e
		65                      // 0x41
		81                      // 0x51
		33                      // 0x21
		94                      // 0x5e
		127                     // 0x7f
		9                       // 0x9
		25                      // 0x19
		41                      // 0x29
		70                      // 0x46
		70                      // 0x46
		73                      // 0x49
		73                      // 0x49
		73                      // 0x49
		49                      // 0x31
		1                       // 0x1
		1                       // 0x1
		127                     // 0x7f
		1                       // 0x1
		1                       // 0x1
		63                      // 0x3f
		64                      // 0x40
		64                      // 0x40
		64                      // 0x40
		63                      // 0x3f
		31                      // 0x1f
		32                      // 0x20
		64                      // 0x40
		32                      // 0x20
		31                      // 0x1f
		63                      // 0x3f
		64                      // 0x40
		56                      // 0x38
		64                      // 0x40
		63                      // 0x3f
		99                      // 0x63
		20                      // 0x14
		8                       // 0x8
		20                      // 0x14
		99                      // 0x63
		7                       // 0x7
		8                       // 0x8
		112                     // 0x70
		8                       // 0x8
		7                       // 0x7
		97                      // 0x61
		81                      // 0x51
		73                      // 0x49
		69                      // 0x45
		67                      // 0x43
		0                       // 0x0
		127                     // 0x7f
		65                      // 0x41
		65                      // 0x41
		0                       // 0x0
		2                       // 0x2
		4                       // 0x4
		8                       // 0x8
		16                      // 0x10
		32                      // 0x20
		0                       // 0x0
		65                      // 0x41
		65                      // 0x41
		127                     // 0x7f
		0                       // 0x0
		4                       // 0x4
		2                       // 0x2
		1                       // 0x1
		2                       // 0x2
		4                       // 0x4
		64                      // 0x40
		64                      // 0x40
		64                      // 0x40
		64                      // 0x40
		64                      // 0x40
		1                       // 0x1
		2                       // 0x2
		4                       // 0x4
		0                       // 0x0
		0                       // 0x0
		32                      // 0x20
		84                      // 0x54
		84                      // 0x54
		84                      // 0x54
		120                     // 0x78
		127                     // 0x7f
		72                      // 0x48
		68                      // 0x44
		68                      // 0x44
		56                      // 0x38
		56                      // 0x38
		68                      // 0x44
		68                      // 0x44
		68                      // 0x44
		32                      // 0x20
		56                      // 0x38
		68                      // 0x44
		68                      // 0x44
		72                      // 0x48
		127                     // 0x7f
		56                      // 0x38
		84                      // 0x54
		84                      // 0x54
		84                      // 0x54
		24                      // 0x18
		8                       // 0x8
		126                     // 0x7e
		9                       // 0x9
		1                       // 0x1
		2                       // 0x2
		6                       // 0x6
		73                      // 0x49
		73                      // 0x49
		73                      // 0x49
		63                      // 0x3f
		127                     // 0x7f
		8                       // 0x8
		4                       // 0x4
		4                       // 0x4
		120                     // 0x78
		0                       // 0x0
		68                      // 0x44
		125                     // 0x7d
		64                      // 0x40
		0                       // 0x0
		32                      // 0x20
		64                      // 0x40
		68                      // 0x44
		61                      // 0x3d
		0                       // 0x0
		127                     // 0x7f
		16                      // 0x10
		40                      // 0x28
		68                      // 0x44
		0                       // 0x0
		0                       // 0x0
		65                      // 0x41
		127                     // 0x7f
		64                      // 0x40
		0                       // 0x0
		124                     // 0x7c
		4                       // 0x4
		24                      // 0x18
		4                       // 0x4
		124                     // 0x7c
		124                     // 0x7c
		8                       // 0x8
		4                       // 0x4
		4                       // 0x4
		120                     // 0x78
		56                      // 0x38
		68                      // 0x44
		68                      // 0x44
		68                      // 0x44
		56                      // 0x38
		124                     // 0x7c
		20                      // 0x14
		20                      // 0x14
		20                      // 0x14
		8                       // 0x8
		8                       // 0x8
		20                      // 0x14
		20                      // 0x14
		24                      // 0x18
		124                     // 0x7c
		124                     // 0x7c
		8                       // 0x8
		4                       // 0x4
		4                       // 0x4
		8                       // 0x8
		72                      // 0x48
		84                      // 0x54
		84                      // 0x54
		84                      // 0x54
		32                      // 0x20
		4                       // 0x4
		63                      // 0x3f
		68                      // 0x44
		64                      // 0x40
		32                      // 0x20
		60                      // 0x3c
		64                      // 0x40
		64                      // 0x40
		32                      // 0x20
		124                     // 0x7c
		28                      // 0x1c
		32                      // 0x20
		64                      // 0x40
		32                      // 0x20
		28                      // 0x1c
		60                      // 0x3c
		64                      // 0x40
		48                      // 0x30
		64                      // 0x40
		60                      // 0x3c
		68                      // 0x44
		40                      // 0x28
		16                      // 0x10
		40                      // 0x28
		68                      // 0x44
		12                      // 0xc
		80                      // 0x50
		80                      // 0x50
		80                      // 0x50
		60                      // 0x3c
		68                      // 0x44
		100                     // 0x64
		84                      // 0x54
		76                      // 0x4c
		68                      // 0x44
		0                       // 0x0
		8                       // 0x8
		54                      // 0x36
		65                      // 0x41
		0                       // 0x0
		0                       // 0x0
		0                       // 0x0
		127                     // 0x7f
		0                       // 0x0
		0                       // 0x0
		0                       // 0x0
		65                      // 0x41
		54                      // 0x36
		8                       // 0x8
		0                       // 0x0
		2                       // 0x2
		1                       // 0x1
		2                       // 0x2
		4                       // 0x4
		2                       // 0x2
		8                       // 0x8
		12                      // 0xc
		14                      // 0xe
		12                      // 0xc
		8                       // 0x8
		8                       // 0x8
		24                      // 0x18
		56                      // 0x38
		24                      // 0x18
		8                       // 0x8
		0                       // 0x0
		15                      // 0xf
		9                       // 0x9
		9                       // 0x9
		15                      // 0xf
		24                      // 0x18
		60                      // 0x3c
		126                     // 0x7e
		24                      // 0x18
		24                      // 0x18
		24                      // 0x18
		24                      // 0x18
		126                     // 0x7e
		60                      // 0x3c
		24                      // 0x18
		28                      // 0x1c
		34                      // 0x22
		193                     // 0xc1
		34                      // 0x22
		28                      // 0x1c
		2                       // 0x2
		4                       // 0x4
		255                     // 0xff
		4                       // 0x4
		2                       // 0x2
		2                       // 0x2
		1                       // 0x1
		0                       // 0x0
		1                       // 0x1
		2                       // 0x2
		24                      // 0x18
		4                       // 0x4
		255                     // 0xff
		4                       // 0x4
		24                      // 0x18
		0                       // 0x0
		15                      // 0xf
		0                       // 0x0
		15                      // 0xf
		0                       // 0x0

sxc__ZZ17OLED_profile_pagejE4text:      // @_ZZ17OLED_profile_pagejE4text
		80                      // 0x50
		114                     // 0x72
		111                     // 0x6f
		102                     // 0x66
		105                     // 0x69
		108                     // 0x6c
		101                     // 0x65
		32                      // 0x20
		35                      // 0x23

sxc__ZZ17OLED_profile_pagejE5text2:     // @_ZZ17OLED_profile_pagejE5text2
		115                     // 0x73
		111                     // 0x6f
		97                      // 0x61
		107                     // 0x6b
		32                      // 0x20
		116                     // 0x74
		105                     // 0x69
		109                     // 0x6d
		101                     // 0x65
		61                      // 0x3d

sxc__ZZ17OLED_profile_pagejE5text3:     // @_ZZ17OLED_profile_pagejE5text3
		115                     // 0x73
		112                     // 0x70
		105                     // 0x69
		107                     // 0x6b
		101                     // 0x65
		32                      // 0x20
		116                     // 0x74
		105                     // 0x69
		109                     // 0x6d
		101                     // 0x65
		61                      // 0x3d

sxc__ZZ18OLED_profile_timesPjE5text4:   // @_ZZ18OLED_profile_timesPjE5text4
		99                      // 0x63
		111                     // 0x6f
		111                     // 0x6f
		108                     // 0x6c
		105                     // 0x69
		110                     // 0x6e
		103                     // 0x67
		32                      // 0x20
		116                     // 0x74
		105                     // 0x69
		109                     // 0x6d
		101                     // 0x65
		61                      // 0x3d

sxc__ZZ21OLED_display_progressjE4arr1:  // @_ZZ21OLED_display_progressjE4arr1
		80                      // 0x50
		114                     // 0x72
		111                     // 0x6f
		102                     // 0x66
		105                     // 0x69
		108                     // 0x6c
		101                     // 0x65
		58                      // 0x3a
		35                      // 0x23

sxc__ZZ21OLED_display_progressjE12arr_progress: // @_ZZ21OLED_display_progressjE12arr_progress
		80                      // 0x50
		114                     // 0x72
		111                     // 0x6f
		103                     // 0x67
		114                     // 0x72
		101                     // 0x65
		115                     // 0x73
		115                     // 0x73
		58                      // 0x3a

sxc__ZZ21OLED_display_progressjE8arr_temp: // @_ZZ21OLED_display_progressjE8arr_temp
		84                      // 0x54
		101                     // 0x65
		109                     // 0x6d
		112                     // 0x70
		101                     // 0x65
		114                     // 0x72
		97                      // 0x61
		116                     // 0x74
		117                     // 0x75
		114                     // 0x72
		101                     // 0x65
		58                      // 0x3a

sxc__ZZ21OLED_display_progressjE7arr_hum: // @_ZZ21OLED_display_progressjE7arr_hum
		72                      // 0x48
		117                     // 0x75
		109                     // 0x6d
		105                     // 0x69
		100                     // 0x64
		105                     // 0x69
		116                     // 0x74
		121                     // 0x79
		58                      // 0x3a

sxc__ZZ17OLED_end_progressvE4text:      // @_ZZ17OLED_end_progressvE4text
		67                      // 0x43
		111                     // 0x6f
		109                     // 0x6d
		112                     // 0x70
		108                     // 0x6c
		101                     // 0x65
		116                     // 0x74
		101                     // 0x65
		33                      // 0x21

sxc__ZZ17OLED_end_progressvE5text2:     // @_ZZ17OLED_end_progressvE5text2
		79                      // 0x4f
		112                     // 0x70
		101                     // 0x65
		110                     // 0x6e
		32                      // 0x20
		79                      // 0x4f
		118                     // 0x76
		101                     // 0x65
		110                     // 0x6e
		32                      // 0x20
		68                      // 0x44
		111                     // 0x6f
		111                     // 0x6f
		114                     // 0x72

sxc__ZZ20OLED_display_warningvE4text:   // @_ZZ20OLED_display_warningvE4text
		87                      // 0x57
		65                      // 0x41
		82                      // 0x52
		78                      // 0x4e
		73                      // 0x49
		78                      // 0x4e
		71                      // 0x47

sxc__ZZ20OLED_display_warningvE5text1:  // @_ZZ20OLED_display_warningvE5text1
		72                      // 0x48
		117                     // 0x75
		109                     // 0x6d
		105                     // 0x69
		100                     // 0x64
		105                     // 0x69
		116                     // 0x74
		121                     // 0x79
		32                      // 0x20
		105                     // 0x69
		115                     // 0x73
		32                      // 0x20
		103                     // 0x67
		114                     // 0x72
		101                     // 0x65
		97                      // 0x61
		116                     // 0x74
		101                     // 0x65
		114                     // 0x72

sxc__ZZ20OLED_display_warningvE5text2:  // @_ZZ20OLED_display_warningvE5text2
		116                     // 0x74
		104                     // 0x68
		97                      // 0x61
		110                     // 0x6e
		32                      // 0x20
		109                     // 0x6d
		97                      // 0x61
		120                     // 0x78
		105                     // 0x69
		109                     // 0x6d
		117                     // 0x75
		109                     // 0x6d

sxc__ZZ27OLED_display_second_warningvE5text3: // @_ZZ27OLED_display_second_warningvE5text3
		80                      // 0x50
		117                     // 0x75
		115                     // 0x73
		104                     // 0x68
		32                      // 0x20
		98                      // 0x62
		117                     // 0x75
		116                     // 0x74
		116                     // 0x74
		111                     // 0x6f
		110                     // 0x6e

sxc__ZZ27OLED_display_second_warningvE5text4: // @_ZZ27OLED_display_second_warningvE5text4
		116                     // 0x74
		111                     // 0x6f
		32                      // 0x20
		97                      // 0x61
		99                      // 0x63
		107                     // 0x6b
		110                     // 0x6e
		111                     // 0x6f
		119                     // 0x77
		108                     // 0x6c
		101                     // 0x65
		100                     // 0x64
		103                     // 0x67
		101                     // 0x65

	sxc_current_temp: @ = @ + 1 // .lcomm // @current_temp
	sxc_humidity: @ = @ + 1 // .lcomm // @humidity
	sxc_btn_press: @ = @ + 1 // .lcomm // @btn_press
sxc_r_encoder:                          // @r_encoder
		0                       // 0x0
		3                       // 0x3
		0                       // 0x0

sxc_profile_index:                      // @profile_index
		1                       // 0x1

	sxc_target_temp_index: @ = @ + 1 // .lcomm // @target_temp_index
	sxc_progress: @ = @ + 1 // .lcomm // @progress
	sxc_selected_profile: @ = @ + 141 // .lcomm // @selected_profile
sxc_progress_scaler:                    // @progress_scaler
		141                     // 0x8d

	sxc_print_humidity: @ = @ + 1 // .lcomm // @print_humidity
sxc_profile_array:                      // @profile_array
		30                      // 0x1e
		120                     // 0x78
		210                     // 0xd2
		5                       // 0x5
		1                       // 0x1
		2                       // 0x2
		90                      // 0x5a
		180                     // 0xb4
		240                     // 0xf0
		3                       // 0x3
		0                       // 0x0
		3                       // 0x3
		90                      // 0x5a
		180                     // 0xb4
		232                     // 0xe8
		2                       // 0x2
		0                       // 0x0
		2                       // 0x2


