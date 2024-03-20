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
//	.section	//.text,"xr"
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
	add	sp, sp, 0x4
	st	r6, sp, 0xfffc          // 1-byte Folded Spill
	st	r3, sp, 0xfffe          // 1-byte Folded Spill
	st	r2, sp, 0xffff          // 1-byte Folded Spill
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r0, 0x5000
BB7_1:                                  // =>This Inner Loop Header: Depth=1
	st	r0, sp, 0xfffd          // 1-byte Folded Spill
	ld	r2, sp, 0xffff          // 1-byte Folded Reload
	ld	r3, sp, 0xfffe          // 1-byte Folded Reload
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xfffd          // 1-byte Folded Reload
	add	r0, r0, 0xffff
	//cmp	r0, 0x0
	bc	ZC, BB7_1
// BB#2:
	ld	r6, sp, 0xfffc          // 1-byte Folded Reload
	sub	sp, sp, 0x4
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z19OLED_Text_160128RGBhhhmm:       // @_Z19OLED_Text_160128RGBhhhmm
// BB#0:
	add	sp, sp, 0x7
	st	r6, sp, 0xfff9          // 1-byte Folded Spill
	st	r2, sp, 0xffff          // 1-byte Folded Spill
	rol	r0, r4, 0x2
	and	r0, r0, 0xfffc
	add	r0, r4, r0
	mov	r2, 0x0
	mov	r1, 0x80
	st	r1, sp, 0xfffb          // 1-byte Folded Spill
	add	r0, r0, sxc_Ascii_1
	st	r0, sp, 0xfffc          // 1-byte Folded Spill
BB8_1:                                  // =>This Loop Header: Depth=1
                                        //     Child Loop BB8_2 Depth 2
	st	r2, sp, 0xfffe          // 1-byte Folded Spill
	st	r3, sp, 0xfffd          // 1-byte Folded Spill
	ld	r2, sp, 0xffff          // 1-byte Folded Reload
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r2, 0x5
BB8_2:                                  //   Parent Loop BB8_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r2, sp, 0xfffa          // 1-byte Folded Spill
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	sub	r0, r0, r2
	ld	r0, r0, 0x5
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	and	r0, r0, r1
	sub	r1, r0, r1
	bc	NE, BB8_4
// BB#3:                                //   in Loop: Header=BB8_2 Depth=2
	mov	r2, 0xffff
	bra	BB8_5
BB8_4:                                  //   in Loop: Header=BB8_2 Depth=2
	mov	r2, 0x0
BB8_5:                                  //   in Loop: Header=BB8_2 Depth=2
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r2, sp, 0xfffa          // 1-byte Folded Reload
	add	r2, r2, 0xffff
	//cmp	r2, 0x0
	bc	ZC, BB8_2
// BB#6:                                //   in Loop: Header=BB8_1 Depth=1
	ld	r3, sp, 0xfffd          // 1-byte Folded Reload
	add	r3, r3, 0x1
	ld	r0, sp, 0xfffb          // 1-byte Folded Reload
	and	r0, r0, 0xfffe
	rol	r0, r0, 0xf
	st	r0, sp, 0xfffb          // 1-byte Folded Spill
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x8
	bc	NE, BB8_1
// BB#7:
	ld	r6, sp, 0xfff9          // 1-byte Folded Reload
	sub	sp, sp, 0x7
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z21OLED_Print_Sensor_Valhhjj:      // @_Z21OLED_Print_Sensor_Valhhjj
// BB#0:
	add	sp, sp, 0x5
	st	r6, sp, 0xfffb          // 1-byte Folded Spill
	st	r5, sp, 0xffff          // 1-byte Folded Spill
	mov	r0, 0x9
	sub	r1, r4, r0
	bc	UGE, BB9_1
// BB#10:                               // %.thread
	st	r2, sp, 0xfffd          // 1-byte Folded Spill
	add	r2, r4, 0x0
	st	r3, sp, 0xfffc          // 1-byte Folded Spill
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r2, sp, 0xfffd          // 1-byte Folded Reload
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r4, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0x7
	bra	BB9_4
BB9_1:
	st	r2, sp, 0xfffd          // 1-byte Folded Spill
	st	r3, sp, 0xfffc          // 1-byte Folded Spill
	mov	r0, 0x64
	sub	r1, r4, r0
	bc	UGE, BB9_3
// BB#2:
	add	r2, r4, 0x0
	mov	r3, 0xa
	st	r4, sp, 0xfffe          // 1-byte Folded Spill
	jsr	r6, sxc___xinc_udiv
	add	r2, r0, 0x0
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r2, sp, 0xfffd          // 1-byte Folded Reload
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r4, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfffd          // 1-byte Folded Reload
	add	r2, r1, 0x7
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r4, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0xe
	bra	BB9_4
BB9_3:
	add	r2, r4, 0x0
	mov	r3, 0x64
	st	r4, sp, 0xfffe          // 1-byte Folded Spill
	jsr	r6, sxc___xinc_udiv
	add	r2, r0, 0x0
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r2, sp, 0xfffd          // 1-byte Folded Reload
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r4, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	mov	r3, 0xa
	jsr	r6, sxc___xinc_udiv
	add	r2, r0, 0x0
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfffd          // 1-byte Folded Reload
	add	r2, r1, 0x7
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r4, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	mov	r3, 0xa
	jsr	r6, sxc___xinc_umod
	add	r2, r0, 0x0
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r1, sp, 0xfffd          // 1-byte Folded Reload
	add	r2, r1, 0xe
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r4, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0x15
BB9_4:
	ld	r4, sp, 0xffff          // 1-byte Folded Reload
	sub	r1, r4, 0x1
	bc	NE, BB9_5
// BB#7:
	ld	r1, sp, 0xfffd          // 1-byte Folded Reload
	add	r2, r0, r1
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	mov	r4, 0x5
	bra	BB9_8
BB9_5:
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	ld	r2, sp, 0xfffd          // 1-byte Folded Reload
	sub	r1, r4, 0x0
	bc	NE, BB9_9
// BB#6:
	add	r2, r0, r2
	st	r2, sp, 0xfffd          // 1-byte Folded Spill
	mov	r4, 0x61
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r0, sp, 0xfffd          // 1-byte Folded Reload
	add	r2, r0, 0x1
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	mov	r4, 0x23
BB9_8:
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
BB9_9:
	ld	r6, sp, 0xfffb          // 1-byte Folded Reload
	sub	sp, sp, 0x5
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z15OLED_write_textihhPhimm:        // @_Z15OLED_write_textihhPhimm
// BB#0:
	add	sp, sp, 0xc
	st	r6, sp, 0xfff4          // 1-byte Folded Spill
	st	r4, sp, 0xfffd          // 1-byte Folded Spill
	st	r3, sp, 0xfffe          // 1-byte Folded Spill
	st	r2, sp, 0xffff          // 1-byte Folded Spill
	st	r5, sp, 0xfffc          // 1-byte Folded Spill
	sub	r1, r5, 0x1
	bc	LT, BB10_16
// BB#1:
	mov	r2, 0x19
	mov	r3, 0x0
	bra	BB10_2
BB10_5:                                 //   in Loop: Header=BB10_2 Depth=1
	add	r2, r0, 0xffe0
	add	r0, r0, 0xffd0
	mov	r1, 0xa
	sub	r1, r0, r1
	bc	UGE, BB10_7
// BB#6:                                //   in Loop: Header=BB10_2 Depth=1
	st	r2, sp, 0xfff7          // 1-byte Folded Spill
	bra	BB10_8
BB10_7:                                 //   in Loop: Header=BB10_2 Depth=1
	add	r4, r2, 0x0
	mov	r0, 0x10
	sub	r1, r2, r0
	bc	ULT, @ + 1 + 0x2
	mov	r4, 0x63 //Select--False
	st	r4, sp, 0xfff7          // 1-byte Folded Spill
	bra	BB10_8
BB10_2:                                 // %.lr.ph..lr.ph.split_crit_edge
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB10_9 Depth 2
                                        //       Child Loop BB10_10 Depth 3
	ld	r0, sp, 0xfffd          // 1-byte Folded Reload
	add	r0, r0, r3
	ld	r0, r0, 0x0
	add	r1, r0, 0xff9f
	sub	r1, r1, r2
	bc	ULE, BB10_3
// BB#4:                                //   in Loop: Header=BB10_2 Depth=1
	add	r1, r0, 0xffbf
	sub	r1, r1, r2
	bc	UGT, BB10_5
BB10_3:                                 //   in Loop: Header=BB10_2 Depth=1
	add	r0, r0, 0xffe0
	st	r0, sp, 0xfff7          // 1-byte Folded Spill
BB10_8:                                 // %_Z13char_to_ASCIIc.exit
                                        //   in Loop: Header=BB10_2 Depth=1
	rol	r0, r3, 0x2
	st	r3, sp, 0xfffb          // 1-byte Folded Spill
	and	r0, r0, 0xfffc
	rol	r1, r0, 0x1
	and	r1, r1, 0xfffe
	add	r0, r0, r1
	ld	r1, sp, 0xffff          // 1-byte Folded Reload
	add	r0, r0, r1
	st	r0, sp, 0xfffa          // 1-byte Folded Spill
	mov	r4, 0x1
	mov	r0, 0x80
	st	r0, sp, 0xfff6          // 1-byte Folded Spill
	ld	r3, sp, 0xfffe          // 1-byte Folded Reload
BB10_9:                                 //   Parent Loop BB10_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB10_10 Depth 3
	st	r3, sp, 0xfff9          // 1-byte Folded Spill
	st	r4, sp, 0xfff8          // 1-byte Folded Spill
	ld	r2, sp, 0xfffa          // 1-byte Folded Reload
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r2, 0x0
BB10_10:                                //   Parent Loop BB10_2 Depth=1
                                        //     Parent Loop BB10_9 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	st	r2, sp, 0xfff5          // 1-byte Folded Spill
	ld	r1, sp, 0xfff7          // 1-byte Folded Reload
	rol	r0, r1, 0x2
	and	r0, r0, 0xfffc
	add	r0, r1, r0
	add	r0, r0, sxc_Ascii_1
	and	r1, r2, 0xfffe
	rol	r1, r1, 0xf
	add	r0, r0, r1
	ld	r0, r0, 0x0
	ld	r1, sp, 0xfff6          // 1-byte Folded Reload
	and	r0, r0, r1
	sub	r1, r0, r1
	bc	NE, BB10_12
// BB#11:                               //   in Loop: Header=BB10_10 Depth=3
	mov	r2, 0xffff
	bra	BB10_13
BB10_12:                                //   in Loop: Header=BB10_10 Depth=3
	mov	r2, 0x0
BB10_13:                                //   in Loop: Header=BB10_10 Depth=3
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r2, sp, 0xfff5          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0xa
	bc	NE, BB10_10
// BB#14:                               //   in Loop: Header=BB10_9 Depth=2
	ld	r4, sp, 0xfff8          // 1-byte Folded Reload
	and	r0, r4, 0x1
	xor	r1, r0, 0x1
	mov	r0, 0x0
	sub	r0, r0, r1
	ld	r2, sp, 0xfff6          // 1-byte Folded Reload
	rol	r2, r2, r0
	ld	r1, r1, 0x2020
	and	r2, r2, r1
	sub	r1, r0, 0x10
	bc	LT, @ + 1 + 0x1
	mov	r2, 0x0 //Select--False
	st	r2, sp, 0xfff6          // 1-byte Folded Spill
	ld	r3, sp, 0xfff9          // 1-byte Folded Reload
	add	r3, r3, 0x1
	add	r4, r4, 0x1
	sub	r1, r4, 0x11
	bc	NE, BB10_9
// BB#15:                               // %_Z21OLED_Text2x_160128RGBhhhmm.exit
                                        //   in Loop: Header=BB10_2 Depth=1
	ld	r3, sp, 0xfffb          // 1-byte Folded Reload
	add	r3, r3, 0x1
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	mov	r2, 0x19
	sub	r1, r3, r0
	bc	NE, BB10_2
BB10_16:                                // %._crit_edge
	ld	r6, sp, 0xfff4          // 1-byte Folded Reload
	sub	sp, sp, 0xc
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z14OLED_main_pagejjj:              // @_Z14OLED_main_pagejjj
// BB#0:
	add	sp, sp, 0x8
	st	r6, sp, 0xfff8          // 1-byte Folded Spill
	st	r4, sp, 0xfffd          // 1-byte Folded Spill
	st	r3, sp, 0xfffe          // 1-byte Folded Spill
	st	r2, sp, 0xffff          // 1-byte Folded Spill
	mov	r2, 0x14
	mov	r3, 0x64
	mov	r4, 0x30
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x1b
	mov	r3, 0x64
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x22
	mov	r3, 0x64
	mov	r4, 0x4f
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x29
	mov	r3, 0x64
	mov	r4, 0x46
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x30
	mov	r3, 0x64
	mov	r4, 0x49
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x37
	mov	r3, 0x64
	mov	r4, 0x4c
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x3e
	mov	r3, 0x64
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x45
	mov	r3, 0x64
	mov	r4, 0x1a
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0x60
	mov	r2, 0x0
BB11_1:                                 // =>This Loop Header: Depth=1
                                        //     Child Loop BB11_6 Depth 2
                                        //     Child Loop BB11_5 Depth 2
                                        //     Child Loop BB11_3 Depth 2
	st	r2, sp, 0xfffa          // 1-byte Folded Spill
	st	r0, sp, 0xfffb          // 1-byte Folded Spill
	mov	r2, 0x14
	add	r3, r0, 0x0
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	ld	r0, sp, 0xfffa          // 1-byte Folded Reload
	sub	r1, r0, 0x1f
	bc	NE, BB11_4
// BB#2:                                //   in Loop: Header=BB11_1 Depth=1
	mov	r0, 0x80
BB11_3:                                 // %.lr.ph.split.split.us.i
                                        //   Parent Loop BB11_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r0, sp, 0xfff9          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xfff9          // 1-byte Folded Reload
	add	r0, r0, 0xffff
	//cmp	r0, 0x0
	bc	ZC, BB11_3
	bra	BB11_11
BB11_4:                                 //   in Loop: Header=BB11_1 Depth=1
	mov	r2, 0x0
	mov	r3, 0x80
	sub	r1, r0, 0x0
	bc	NE, BB11_6
BB11_5:                                 // %.lr.ph.split.us..lr.ph.split.us.split_crit_edge.i
                                        //   Parent Loop BB11_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r3, sp, 0xfff9          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r3, sp, 0xfff9          // 1-byte Folded Reload
	add	r3, r3, 0xffff
	//cmp	r3, 0x0
	bc	ZC, BB11_5
	bra	BB11_11
BB11_6:                                 // %.lr.ph.split..lr.ph.split.split_crit_edge.i
                                        //   Parent Loop BB11_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sub	r1, r2, 0x0
	bc	EQ, BB11_8
// BB#7:                                // %.lr.ph.split..lr.ph.split.split_crit_edge.i
                                        //   in Loop: Header=BB11_6 Depth=2
	sub	r1, r2, 0x7f
	bc	NE, BB11_9
BB11_8:                                 //   in Loop: Header=BB11_6 Depth=2
	st	r2, sp, 0xfff9          // 1-byte Folded Spill
	mov	r2, 0xf800
	bra	BB11_10
BB11_9:                                 //   in Loop: Header=BB11_6 Depth=2
	st	r2, sp, 0xfff9          // 1-byte Folded Spill
	mov	r2, 0x0
BB11_10:                                //   in Loop: Header=BB11_6 Depth=2
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r2, sp, 0xfff9          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x80
	bc	NE, BB11_6
BB11_11:                                // %._crit_edge.i
                                        //   in Loop: Header=BB11_1 Depth=1
	ld	r0, sp, 0xfffb          // 1-byte Folded Reload
	add	r0, r0, 0x1
	ld	r2, sp, 0xfffa          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x20
	bc	NE, BB11_1
// BB#12:                               // %_Z8Draw_Boxhhmmjj.exit
	ld	r0, sp, 0xfffd          // 1-byte Folded Reload
	rol	r0, r0, 0x1
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
	st	r2, sp, 0xfff9          // 1-byte Folded Spill
	mov	r3, 0x64
	jsr	r6, sxc___xinc_udiv
	mov	r3, 0x60
	mov	r1, 0x63
	ld	r2, sp, 0xfff9          // 1-byte Folded Reload
	sub	r1, r2, r1
	bc	ULE, BB11_17
// BB#13:
	st	r0, sp, 0xfffa          // 1-byte Folded Spill
	mov	r0, 0x0
BB11_16:                                // %.lr.ph.us.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB11_14 Depth 2
	st	r0, sp, 0xfffc          // 1-byte Folded Spill
	st	r3, sp, 0xfffb          // 1-byte Folded Spill
	mov	r2, 0x17
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r0, 0x0
BB11_14:                                //   Parent Loop BB11_16 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r0, sp, 0xfff9          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xfff9          // 1-byte Folded Reload
	add	r0, r0, 0x1
	ld	r1, sp, 0xfffa          // 1-byte Folded Reload
	sub	r1, r0, r1
	bc	ULT, BB11_14
// BB#15:                               //   in Loop: Header=BB11_16 Depth=1
	ld	r3, sp, 0xfffb          // 1-byte Folded Reload
	add	r3, r3, 0x1
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	add	r0, r0, 0x1
	sub	r1, r0, 0x1a
	bc	EQ, BB11_18
	bra	BB11_16
BB11_17:                                // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	st	r3, sp, 0xfffb          // 1-byte Folded Spill
	mov	r2, 0x17
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	add	r0, r1, 0x1
	add	r1, r1, 0xffa1
	add	r3, r0, 0x0
	sub	r1, r1, 0x1a
	bc	NE, BB11_17
BB11_18:                                // %_Z8Draw_Barhhmmjjj.exit
	mov	r2, 0x14
	mov	r3, 0x2e
	mov	r4, 0x30
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x1b
	mov	r3, 0x2e
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x22
	mov	r3, 0x2e
	mov	r4, 0x4f
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x29
	mov	r3, 0x2e
	mov	r4, 0x47
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x30
	mov	r3, 0x2e
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x37
	mov	r3, 0x2e
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x3e
	mov	r3, 0x2e
	mov	r4, 0x53
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x45
	mov	r3, 0x2e
	mov	r4, 0x53
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x4c
	mov	r3, 0x2e
	mov	r4, 0x1a
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x14
	mov	r3, 0x1c
	mov	r4, 0x34
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x1b
	mov	r3, 0x1c
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x22
	mov	r3, 0x1c
	mov	r4, 0x4d
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x29
	mov	r3, 0x1c
	mov	r4, 0x50
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x30
	mov	r3, 0x1c
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x37
	mov	r3, 0x1c
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x3e
	mov	r3, 0x1c
	mov	r4, 0x41
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x45
	mov	r3, 0x1c
	mov	r4, 0x54
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x4c
	mov	r3, 0x1c
	mov	r4, 0x55
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x53
	mov	r3, 0x1c
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x5a
	mov	r3, 0x1c
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x61
	mov	r3, 0x1c
	mov	r4, 0x1a
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x14
	mov	r3, 0xa
	mov	r4, 0x28
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x1b
	mov	r3, 0xa
	mov	r4, 0x55
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x22
	mov	r3, 0xa
	mov	r4, 0x4d
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x29
	mov	r3, 0xa
	mov	r4, 0x49
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x30
	mov	r3, 0xa
	mov	r4, 0x44
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x37
	mov	r3, 0xa
	mov	r4, 0x49
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x3e
	mov	r3, 0xa
	mov	r4, 0x54
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x45
	mov	r3, 0xa
	mov	r4, 0x59
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x4c
	mov	r3, 0xa
	mov	r4, 0x1a
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x53
	mov	r3, 0x2e
	ld	r4, sp, 0xfffd          // 1-byte Folded Reload
	mov	r5, 0x1
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjj
	mov	r2, 0x68
	mov	r3, 0x1c
	ld	r4, sp, 0xffff          // 1-byte Folded Reload
	mov	r5, 0x0
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjj
	mov	r2, 0x53
	mov	r3, 0xa
	ld	r4, sp, 0xfffe          // 1-byte Folded Reload
	mov	r5, 0x1
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjj
	ld	r6, sp, 0xfff8          // 1-byte Folded Reload
	sub	sp, sp, 0x8
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z10TempThreadPv:                   // @_Z10TempThreadPv
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
	mov	r0, 0x1
	mov	r2, 0x0
	bra	BB12_1
BB12_5:                                 // %_Z7getTempv.exit
                                        //   in Loop: Header=BB12_1 Depth=1
	st	r3, sxc_current_temp
	outp	r0, 0x6
BB12_1:                                 // =>This Inner Loop Header: Depth=1
	outp	r0, 0x7
	inp	r1, 0x32
	and	r1, r1, 0xfffd
	outp	r1, 0x32
	outp	r2, 0x36
	inp	r3, 0x36
	outp	r2, 0x36
	inp	r4, 0x36
	inp	r1, 0x32
	ior	r1, r1, 0x2
	outp	r1, 0x32
	and	r1, r4, 0x1
	//cmp	r1, 0x0
	bc	ZC, BB12_2
// BB#4:                                //   in Loop: Header=BB12_1 Depth=1
	and	r1, r3, 0xff
	rol	r1, r1, 0x8
	ior	r1, r4, r1
	and	r1, r1, 0xfff0
	rol	r3, r1, 0xc
	bra	BB12_5
BB12_2:                                 //   in Loop: Header=BB12_1 Depth=1
	mov	r1, sxc_.str4
	//APP
		jsr	r6, XPD_EchoString
	//NO_APP
	mov	r1, sxc_.str
	//APP
		jsr	r6, XPD_EchoString
	//NO_APP
	inp	r1, 0x32
	and	r1, r1, 0xfffd
	outp	r1, 0x32
	mov	r3, 0x0
	outp	r3, 0x36
	inp	r1, 0x36
	outp	r3, 0x36
	inp	r1, 0x36
	outp	r3, 0x36
	inp	r1, 0x36
	outp	r3, 0x36
	inp	r1, 0x36
	inp	r4, 0x32
	ior	r4, r4, 0x2
	outp	r4, 0x32
	bic	r1, r1, 0x0
	//cmp	r1, 0x0
	bc	VC, BB12_5
// BB#3:                                //   in Loop: Header=BB12_1 Depth=1
	mov	r1, sxc_.str1
	//APP
		jsr	r6, XPD_EchoString
	//NO_APP
	mov	r3, 0x0
	bra	BB12_5

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
	bra	BB13_1
BB13_21:                                // %_Z15get_encoder_pos14rotary_encoder.exit
                                        //   in Loop: Header=BB13_1 Depth=1
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
BB13_1:                                 // =>This Inner Loop Header: Depth=1
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
	bc	EQ, BB13_16
// BB#2:                                //   in Loop: Header=BB13_1 Depth=1
	ld	r5, sp, 0xfffe
	sub	r1, r5, r6
	bc	UGT, BB13_15
// BB#3:                                //   in Loop: Header=BB13_1 Depth=1
	ld	r1, r5,JTI13_0
	jsr	r1, r1
BB13_4:                                 //   in Loop: Header=BB13_1 Depth=1
	sub	r1, r3, 0x2
	bc	EQ, BB13_13
// BB#5:                                //   in Loop: Header=BB13_1 Depth=1
	sub	r1, r3, 0x1
	bc	NE, BB13_15
	bra	BB13_6
BB13_7:                                 //   in Loop: Header=BB13_1 Depth=1
	sub	r1, r3, 0x0
	bc	EQ, BB13_13
// BB#8:                                //   in Loop: Header=BB13_1 Depth=1
	sub	r1, r3, 0x3
	bc	EQ, BB13_6
	bra	BB13_15
BB13_9:                                 //   in Loop: Header=BB13_1 Depth=1
	sub	r1, r3, 0x3
	bc	EQ, BB13_13
// BB#10:                               //   in Loop: Header=BB13_1 Depth=1
	sub	r1, r3, 0x0
	bc	EQ, BB13_6
	bra	BB13_15
BB13_11:                                //   in Loop: Header=BB13_1 Depth=1
	sub	r1, r3, 0x1
	bc	NE, BB13_12
BB13_13:                                //   in Loop: Header=BB13_1 Depth=1
	ld	r1, sp, 0xfffd
	add	r1, r1, 0xffff
	bra	BB13_14
BB13_12:                                //   in Loop: Header=BB13_1 Depth=1
	sub	r1, r3, 0x2
	bc	NE, BB13_15
BB13_6:                                 //   in Loop: Header=BB13_1 Depth=1
	ld	r1, sp, 0xfffd
	add	r1, r1, 0x1
BB13_14:                                //   in Loop: Header=BB13_1 Depth=1
	st	r1, sp, 0xfffd
BB13_15:                                //   in Loop: Header=BB13_1 Depth=1
	st	r3, sp, 0xfffe
BB13_16:                                //   in Loop: Header=BB13_1 Depth=1
	ld	r1, sp, 0xfffd
	sub	r1, r1, 0x4
	bc	LT, BB13_18
// BB#17:                               //   in Loop: Header=BB13_1 Depth=1
	mov	r1, 0x1
	bra	BB13_20
BB13_18:                                //   in Loop: Header=BB13_1 Depth=1
	ld	r3, sp, 0xfffd
	sub	r1, r3, 0xfffc
	bc	GT, BB13_21
// BB#19:                               //   in Loop: Header=BB13_1 Depth=1
	mov	r1, 0x2
BB13_20:                                //   in Loop: Header=BB13_1 Depth=1
	st	r1, sp, 0xffff
	mov	r3, 0x0
	st	r3, sp, 0xfffd
	bra	BB13_21
//	.section	//.text,"xr"
//align
@ = (@ + 1-1)  & -1
sxc__Z9PIDThreadPv:                     // @_Z9PIDThreadPv
// BB#0:
	add	sp, sp, 0x4
	st	r6, sp, 0xfffc          // 1-byte Folded Spill
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
	mov	r0, 0x0
	st	r0, sp, 0xfffd          // 1-byte Folded Spill
	mov	r6, 0x0
	mov	r0, 0x0
	bra	BB14_1
BB14_8:                                 //   in Loop: Header=BB14_1 Depth=1
	outp	r1, 0x26
	add	r2, r5, 0x0
BB14_1:                                 // %_Z14heating_actionj.exit
                                        // =>This Inner Loop Header: Depth=1
	inp	r1, 0x3e
	inp	r3, 0x43
	ior	r1, r3, r1
	sub	r1, r1, 0x0
	bc	GT, BB14_2
// BB#3:                                //   in Loop: Header=BB14_1 Depth=1
	outp	r4, 0x7
	mov	r3, 0x1
	outp	r3, 0x7
	ld	r3, sxc_target_temp_index
	ld	r3, r3,sxc_selected_profile
	ld	r4, sxc_current_temp
	sub	r6, r3, r4
	st	r6, sp, 0xfffe          // 1-byte Folded Spill
	ld	r3, sp, 0xfffd          // 1-byte Folded Reload
	add	r3, r6, r3
	mov	r4, 0xc8
	sub	r1, r3, 0xc8
	bc	GT, @ + 1 + 0x1
	mov	r4, r3 //Select--False
	st	r4, sp, 0xfffd          // 1-byte Folded Spill
	rol	r3, r4, 0x2
	and	r3, r3, 0xfffc
	rol	r4, r3, 0x2
	and	r4, r4, 0xfffc
	add	r3, r3, r4
	rol	r4, r6, 0x2
	and	r4, r4, 0xfffc
	rol	r5, r4, 0x2
	and	r5, r5, 0xfffc
	add	r4, r4, r5
	rol	r5, r5, 0x1
	and	r5, r5, 0xfffe
	add	r4, r4, r5
	rol	r5, r5, 0x1
	and	r5, r5, 0xfffe
	add	r4, r4, r5
	rol	r5, r5, 0x1
	and	r5, r5, 0xfffe
	add	r4, r4, r5
	rol	r5, r5, 0x1
	and	r5, r5, 0xfffe
	add	r4, r4, r5
	sub	r2, r6, r2
	add	r2, r2, r4
	add	r2, r2, r3
	mov	r4, 0x7d0
	mov	r3, 0x7d0
	sub	r1, r2, r3
	bc	UGT, @ + 1 + 0x1
	mov	r4, r2 //Select--False
	st	r4, sp, 0xffff          // 1-byte Folded Spill
	add	r1, r4, 0x0
	//APP
		jsr	r6, XPD_EchoUnsignedDec
	//NO_APP
	mov	r1, 0x1
	outp	r1, 0x6
	add	r0, r0, 0x1
	sub	r1, r0, 0x2
	bc	NE, BB14_5
// BB#4:                                //   in Loop: Header=BB14_1 Depth=1
	ld	r0, sxc_target_temp_index
	add	r0, r0, 0x1
	st	r0, sxc_target_temp_index
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
	mov	r3, 0xb4
	jsr	r6, sxc___xinc_udiv
	st	r0, sxc_progress
	mov	r0, 0x0
BB14_5:                                 //   in Loop: Header=BB14_1 Depth=1
	mov	r4, 0x40
	outp	r4, 0x6
	ld	r5, sp, 0xfffe          // 1-byte Folded Reload
	ld	r6, sp, 0xffff          // 1-byte Folded Reload
	bra	BB14_6
BB14_2:                                 //   in Loop: Header=BB14_1 Depth=1
	add	r5, r2, 0x0
BB14_6:                                 //   in Loop: Header=BB14_1 Depth=1
	rol	r1, r6, 0x3
	and	r1, r1, 0xfff8
	rol	r2, r1, 0x1
	and	r2, r2, 0xfffe
	add	r1, r1, r2
	inp	r3, 0x3f
	inp	r2, 0x26
	sub	r1, r1, r3
	bc	UGE, BB14_7
// BB#9:                                //   in Loop: Header=BB14_1 Depth=1
	and	r1, r2, 0xff9f
	bra	BB14_8
BB14_7:                                 //   in Loop: Header=BB14_1 Depth=1
	ior	r1, r2, 0x60
	bra	BB14_8

//align
@ = (@ + 1-1)  & -1
sxc__Z14HumidityThreadPv:               // @_Z14HumidityThreadPv
// BB#0:
	mov	r0, 0x5b
	outp	r0, 0x48
	mov	r0, 0xc7
	outp	r0, 0x4a
	mov	r0, 0x0
	bra	BB15_1
BB15_7:                                 // %_Z12get_humidityj.exit.outer.backedge
                                        //   in Loop: Header=BB15_1 Depth=1
	mov	r0, 0x0
	inp	r1, 0x49
BB15_1:                                 // %_Z12get_humidityj.exit.outer
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB15_3 Depth 2
                                        //     Child Loop BB15_6 Depth 2
	sub	r1, r0, 0x1
	bc	NE, BB15_2
BB15_6:                                 //   Parent Loop BB15_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	inp	r0, 0x26
	bic	r0, r0, 0x3
	//cmp	r0, 0x0
	bc	VS, BB15_6
	bra	BB15_7
BB15_2:                                 // %_Z12get_humidityj.exit.outer
                                        //   in Loop: Header=BB15_1 Depth=1
	sub	r1, r0, 0x0
	bc	NE, BB15_5
BB15_3:                                 // %_Z12get_humidityj.exit.us
                                        //   Parent Loop BB15_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	inp	r0, 0x26
	and	r0, r0, 0xfff8
	rol	r0, r0, 0xd
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZS, BB15_3
// BB#4:                                // %.us-lcssa.us
                                        //   in Loop: Header=BB15_1 Depth=1
	inp	r1, 0x49
	bra	BB15_1
BB15_5:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x26
	bra	BB15_5

//align
@ = (@ + 1-1)  & -1
sxc__Z15stateOLEDThreadPv:              // @_Z15stateOLEDThreadPv
// BB#0:
	add	sp, sp, 0xd7
	st	r6, sp, 0xff29          // 1-byte Folded Spill
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
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	bra	BB16_1
BB16_20:                                // %.split12
                                        //   in Loop: Header=BB16_1 Depth=1
	add	r2, sp, 0xff3c
	st	r2, sp, 0xfffa          // 1-byte Folded Spill
	mov	r3, sxc__ZZ17OLED_end_progressvE4text
	mov	r4, 0x9
	jsr	r6, sxc_memcpy
	mov	r2, 0x1f
	mov	r3, 0x0
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	mov	r2, 0x5
	mov	r3, 0x64
	ld	r4, sp, 0xfffa          // 1-byte Folded Reload
	mov	r5, 0x9
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r2, 0x7d0
	jsr	r6, sxc__Z7wait_msj
BB16_1:                                 // =>This Loop Header: Depth=1
                                        //     Child Loop BB16_2 Depth 2
                                        //       Child Loop BB16_18 Depth 3
                                        //       Child Loop BB16_13 Depth 3
	mov	r2, 0x0
	bra	BB16_2
BB16_19:                                // %._crit_edge
                                        //   in Loop: Header=BB16_2 Depth=2
	mov	r1, 0x8000
	outp	r1, 0x7
	ld	r0, thrds_vector
	ior	r0, r0, 0x8
	st	r0, thrds_vector
	outp	r0, 0x4
	outp	r1, 0x6
	outp	r1, 0x7
	ld	r0, thrds_vector
	ior	r0, r0, 0x10
	st	r0, thrds_vector
	outp	r0, 0x4
	outp	r1, 0x6
	outp	r1, 0x7
	ld	r0, thrds_vector
	ior	r0, r0, 0x20
	st	r0, thrds_vector
	outp	r0, 0x4
	outp	r1, 0x6
	inp	r0, 0x26
	and	r0, r0, 0xff9f
	outp	r0, 0x26
	mov	r2, 0x4
BB16_2:                                 // %.outer
                                        //   Parent Loop BB16_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB16_18 Depth 3
                                        //       Child Loop BB16_13 Depth 3
	mov	r0, 0x4
	sub	r1, r2, r0
	bc	UGT, BB16_21
// BB#3:                                // %.outer
                                        //   in Loop: Header=BB16_2 Depth=2
	ld	r1, r2,JTI16_0
	jsr	r1, r1
BB16_4:                                 // %.split
                                        //   in Loop: Header=BB16_2 Depth=2
	mov	r0, 0x10
	outp	r0, 0x7
	ld	r0, sxc_profile_index
	st	r0, sp, 0xfffc          // 1-byte Folded Spill
	add	r2, sp, 0xff30
	st	r2, sp, 0xfffa          // 1-byte Folded Spill
	mov	r3, sxc__ZZ17OLED_profile_pagejE5text1
	mov	r4, 0xc
	jsr	r6, sxc_memcpy
	add	r2, sp, 0xff3c
	st	r2, sp, 0xfffb          // 1-byte Folded Spill
	mov	r3, sxc__ZZ17OLED_profile_pagejE5text2
	mov	r4, 0x9
	jsr	r6, sxc_memcpy
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	add	r0, r0, 0x30
	st	r0, sp, 0xff45
	mov	r2, 0x5
	mov	r3, 0x64
	ld	r4, sp, 0xfffa          // 1-byte Folded Reload
	mov	r5, 0xc
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r2, 0x5
	mov	r3, 0x32
	ld	r4, sp, 0xfffb          // 1-byte Folded Reload
	mov	r5, 0x9
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r4, sp, 0xff45
	mov	r2, 0x78
	mov	r3, 0x32
	mov	r5, 0x1
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r3, 0x10
	outp	r3, 0x6
	mov	r0, 0x8
	outp	r0, 0x7
	mov	r4, sxc_r_encoder
	ld	r0, r4, 0x2
	sub	r1, r0, 0x1
	bc	NE, BB16_7
// BB#5:                                //   in Loop: Header=BB16_2 Depth=2
	outp	r3, 0x7
	ld	r0, sxc_profile_index
	add	r0, r0, 0x1
	st	r0, sxc_profile_index
	ld	r0, sxc_profile_index
	mov	r1, 0x4
	mov	r2, 0x1
	sub	r1, r0, r1
	bc	ULT, BB16_10
// BB#6:                                //   in Loop: Header=BB16_2 Depth=2
	st	r2, sxc_profile_index
	bra	BB16_10
BB16_17:                                // %.split9
                                        //   in Loop: Header=BB16_2 Depth=2
	mov	r0, 0x1
	outp	r0, 0x7
	mov	r0, 0x2
	outp	r0, 0x7
	mov	r0, 0x40
	outp	r0, 0x7
	ld	r2, sxc_current_temp
	ld	r3, sxc_humidity
	ld	r4, sxc_progress
	jsr	r6, sxc__Z14OLED_main_pagejjj
	mov	r3, 0x40
	mov	r2, 0x2
	outp	r3, 0x6
	outp	r2, 0x6
	mov	r0, 0x1
	outp	r0, 0x6
	mov	r1, 0x8000
	outp	r1, 0x7
	ld	r0, thrds_vector
	and	r0, r0, 0xfff7
	st	r0, thrds_vector
	outp	r0, 0x4
	outp	r1, 0x6
	outp	r1, 0x7
	ld	r0, thrds_vector
	and	r0, r0, 0xffef
	st	r0, thrds_vector
	outp	r0, 0x4
	outp	r1, 0x6
	outp	r1, 0x7
	ld	r0, thrds_vector
	and	r0, r0, 0xffdf
	st	r0, thrds_vector
	outp	r0, 0x4
	outp	r1, 0x6
	ld	r0, sxc_progress
	mov	r1, 0x64
	sub	r1, r0, r1
	bc	UGT, BB16_19
BB16_18:                                // %.lr.ph
                                        //   Parent Loop BB16_1 Depth=1
                                        //     Parent Loop BB16_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, 0x1
	outp	r0, 0x7
	outp	r2, 0x7
	outp	r3, 0x7
	ld	r2, sxc_current_temp
	ld	r3, sxc_humidity
	ld	r4, sxc_progress
	jsr	r6, sxc__Z14OLED_main_pagejjj
	mov	r3, 0x40
	mov	r2, 0x2
	outp	r3, 0x6
	outp	r2, 0x6
	mov	r0, 0x1
	outp	r0, 0x6
	ld	r0, sxc_progress
	mov	r1, 0x65
	sub	r1, r0, r1
	bc	ULT, BB16_18
	bra	BB16_19
BB16_16:                                // %.split6
                                        //   in Loop: Header=BB16_2 Depth=2
	mov	r1, sxc__ZZ18OLED_starting_pagevE5text1
	ld	r0, r1, 0x6
	st	r0, sp, 0xff42
	ld	r0, r1, 0x5
	st	r0, sp, 0xff41
	ld	r0, r1, 0x4
	st	r0, sp, 0xff40
	ld	r0, r1, 0x3
	st	r0, sp, 0xff3f
	ld	r0, r1, 0x2
	st	r0, sp, 0xff3e
	ld	r0, r1, 0x1
	st	r0, sp, 0xff3d
	ld	r0, sxc__ZZ18OLED_starting_pagevE5text1
	st	r0, sp, 0xff3c
	mov	r0, 0x6e
	st	r0, sp, 0xff37
	mov	r0, 0x69
	st	r0, sp, 0xff36
	mov	r0, 0x67
	st	r0, sp, 0xff35
	mov	r0, 0x65
	st	r0, sp, 0xff34
	mov	r0, 0x62
	st	r0, sp, 0xff33
	mov	r0, 0x20
	st	r0, sp, 0xff32
	mov	r0, 0x6f
	st	r0, sp, 0xff31
	mov	r0, 0x74
	st	r0, sp, 0xff30
	add	r4, sp, 0xff3c
	mov	r2, 0x5
	mov	r3, 0x64
	mov	r5, 0x7
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	add	r4, sp, 0xff30
	mov	r2, 0x5
	mov	r3, 0x32
	mov	r5, 0x8
	jsr	r6, sxc__Z15OLED_write_textihhPhimm
	mov	r2, 0x7d0
	jsr	r6, sxc__Z7wait_msj
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	mov	r2, 0x1
	bra	BB16_2
BB16_7:                                 //   in Loop: Header=BB16_2 Depth=2
	ld	r0, r4, 0x2
	sub	r1, r0, 0x2
	bc	NE, BB16_11
// BB#8:                                //   in Loop: Header=BB16_2 Depth=2
	outp	r3, 0x7
	ld	r0, sxc_profile_index
	add	r0, r0, 0xffff
	st	r0, sxc_profile_index
	ld	r0, sxc_profile_index
	//cmp	r0, 0x0
	bc	ZC, BB16_10
// BB#9:                                //   in Loop: Header=BB16_2 Depth=2
	mov	r0, 0x3
	st	r0, sxc_profile_index
BB16_10:                                //   in Loop: Header=BB16_2 Depth=2
	outp	r3, 0x6
	mov	r0, 0x0
	st	r0, r4, 0x2
BB16_11:                                //   in Loop: Header=BB16_2 Depth=2
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
	mov	r2, 0x0
	ld	r0, sxc_btn_press
	sub	r1, r0, 0x1
	bc	NE, BB16_15
// BB#12:                               //   in Loop: Header=BB16_2 Depth=2
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z25OLED_FillScreen_160128RGBm
	add	r2, sp, 0xff46
	st	r2, sp, 0xfffa          // 1-byte Folded Spill
	mov	r3, sxc_selected_profile
	mov	r4, 0xb4
	jsr	r6, sxc_memcpy
	mov	r4, 0xb4
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	mov	r2, 0x64
BB16_13:                                //   Parent Loop BB16_1 Depth=1
                                        //     Parent Loop BB16_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	sub	r0, r3, r4
	st	r2, r0, 0xb4
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB16_13
// BB#14:                               // %_Z21generate_test_profile7profile.exit
                                        //   in Loop: Header=BB16_2 Depth=2
	add	r3, sp, 0xff46
	mov	r2, sxc_selected_profile
	mov	r4, 0xb4
	jsr	r6, sxc_memcpy
	mov	r2, 0x2
BB16_15:                                //   in Loop: Header=BB16_2 Depth=2
	mov	r0, 0x4
	outp	r0, 0x6
	bra	BB16_2
BB16_21:                                // %infloop
                                        // =>This Inner Loop Header: Depth=1
	bra	BB16_21
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
BB17_1:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	LT0, BB17_1
// BB#2:
	mov	r0, 0x1
	outp	r0, 0x75
	mov	r0, 0x805
	outp	r0, 0x74
	inp	r0, 0x72
	and	r0, r0, 0xfbff
	outp	r0, 0x72
BB17_3:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	LT0, BB17_3
// BB#4:
	inp	r0, 0x72
	ior	r0, r0, 0xc00
	outp	r0, 0x72
BB17_5:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	NC, BB17_5
// BB#6:                                // %_Z8InitGPIOv.exit
	mov	r0, 0x8183
	outp	r0, 0x73
	mov	r0, 0xf
	outp	r0, 0x37
	mov	r0, 0x8f00
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
	bc	EQ, BB20_3
// BB#1:
	add	r0, r2, 0x0
BB20_2:                                 // %.lr.ph
                                        // =>This Inner Loop Header: Depth=1
	st	r3, r0, 0x0
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB20_2
BB20_3:                                 // %._crit_edge
	add	r0, r2, 0x0
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc_memcpy:                             // @memcpy
// BB#0:
	sub	r1, r2, r3
	bc	EQ, BB21_4
// BB#1:
	sub	r1, r4, 0x0
	bc	EQ, BB21_4
// BB#2:
	add	r0, r2, 0x0
BB21_3:                                 // %.lr.ph.i
                                        // =>This Inner Loop Header: Depth=1
	ld	r1, r3, 0x0
	st	r1, r0, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB21_3
BB21_4:                                 // %memcpy_base.exit
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
	bc	UGE, BB22_1
// BB#4:
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB22_7
// BB#5:                                // %.lr.ph23.i.preheader
	mov	r0, 0x1
	sub	r0, r0, r4
BB22_6:                                 // %.lr.ph23.i
                                        // =>This Inner Loop Header: Depth=1
	sub	r1, r2, r0
	sub	r4, r3, r0
	ld	r4, r4, 0x0
	st	r4, r1, 0x0
	add	r0, r0, 0x1
	sub	r1, r0, 0x1
	bc	NE, BB22_6
	bra	BB22_7
BB22_1:
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB22_7
// BB#2:
	add	r0, r2, 0x0
BB22_3:                                 // %.lr.ph.i
                                        // =>This Inner Loop Header: Depth=1
	ld	r1, r3, 0x0
	st	r1, r0, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB22_3
BB22_7:                                 // %memcpy_base.exit
	add	r0, r2, 0x0
	jsr	r6, r6

