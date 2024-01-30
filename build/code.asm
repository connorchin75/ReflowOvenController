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
	mov	r0, 0x63
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
BB7_1:                                  // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_2 Depth 2
	st	r2, sp, 0xfffe          // 1-byte Folded Spill
	st	r3, sp, 0xfffd          // 1-byte Folded Spill
	ld	r2, sp, 0xffff          // 1-byte Folded Reload
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r2, 0x5
BB7_2:                                  //   Parent Loop BB7_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r2, sp, 0xfffa          // 1-byte Folded Spill
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	sub	r0, r0, r2
	ld	r0, r0, 0x5
	ld	r1, sp, 0xfffb          // 1-byte Folded Reload
	and	r0, r0, r1
	sub	r1, r0, r1
	bc	NE, BB7_4
// BB#3:                                //   in Loop: Header=BB7_2 Depth=2
	mov	r2, 0xffff
	bra	BB7_5
BB7_4:                                  //   in Loop: Header=BB7_2 Depth=2
	mov	r2, 0x0
BB7_5:                                  //   in Loop: Header=BB7_2 Depth=2
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r2, sp, 0xfffa          // 1-byte Folded Reload
	add	r2, r2, 0xffff
	//cmp	r2, 0x0
	bc	ZC, BB7_2
// BB#6:                                //   in Loop: Header=BB7_1 Depth=1
	ld	r3, sp, 0xfffd          // 1-byte Folded Reload
	add	r3, r3, 0x1
	ld	r0, sp, 0xfffb          // 1-byte Folded Reload
	and	r0, r0, 0xfffe
	rol	r0, r0, 0xf
	st	r0, sp, 0xfffb          // 1-byte Folded Spill
	ld	r2, sp, 0xfffe          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x8
	bc	NE, BB7_1
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
	st	r2, sp, 0xfffd          // 1-byte Folded Spill
	mov	r0, 0x9
	sub	r1, r4, r0
	bc	UGE, BB8_1
// BB#8:                                // %.thread
	add	r2, r4, 0x0
	st	r3, sp, 0xfffc          // 1-byte Folded Spill
	jsr	r6, sxc__Z12Num_To_ASCIIj
	ld	r2, sp, 0xfffd          // 1-byte Folded Reload
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	add	r4, r0, 0x0
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r0, 0x7
	bra	BB8_4
BB8_1:
	st	r3, sp, 0xfffc          // 1-byte Folded Spill
	mov	r0, 0x64
	sub	r1, r4, r0
	bc	UGE, BB8_3
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
	bra	BB8_4
BB8_3:
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
BB8_4:
	ld	r1, sp, 0xfffd          // 1-byte Folded Reload
	add	r2, r0, r1
	ld	r0, sp, 0xffff          // 1-byte Folded Reload
	sub	r1, r0, 0x0
	bc	EQ, BB8_5
// BB#6:
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	mov	r4, 0x5
	bra	BB8_7
BB8_5:
	st	r2, sp, 0xfffd          // 1-byte Folded Spill
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	mov	r4, 0x61
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r0, sp, 0xfffd          // 1-byte Folded Reload
	add	r2, r0, 0x7
	ld	r3, sp, 0xfffc          // 1-byte Folded Reload
	mov	r4, 0x23
BB8_7:
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	ld	r6, sp, 0xfffb          // 1-byte Folded Reload
	sub	sp, sp, 0x5
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc__Z8Draw_Barhhmmjjj:                 // @_Z8Draw_Barhhmmjjj
// BB#0:                                // %.lr.ph13
	add	sp, sp, 0x5
	st	r6, sp, 0xfffb          // 1-byte Folded Spill
	rol	r0, r2, 0x1
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
	st	r2, sp, 0xfffc          // 1-byte Folded Spill
	mov	r3, 0x64
	jsr	r6, sxc___xinc_udiv
	mov	r3, 0x49
	mov	r1, 0x63
	ld	r2, sp, 0xfffc          // 1-byte Folded Reload
	sub	r1, r2, r1
	bc	ULE, BB9_5
// BB#1:
	st	r0, sp, 0xfffd          // 1-byte Folded Spill
	mov	r0, 0x0
BB9_4:                                  // %.lr.ph.us
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB9_2 Depth 2
	st	r0, sp, 0xffff          // 1-byte Folded Spill
	st	r3, sp, 0xfffe          // 1-byte Folded Spill
	mov	r2, 0x17
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r0, 0x0
BB9_2:                                  //   Parent Loop BB9_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r0, sp, 0xfffc          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	add	r0, r0, 0x1
	ld	r1, sp, 0xfffd          // 1-byte Folded Reload
	sub	r1, r0, r1
	bc	ULT, BB9_2
// BB#3:                                //   in Loop: Header=BB9_4 Depth=1
	ld	r3, sp, 0xfffe          // 1-byte Folded Reload
	add	r3, r3, 0x1
	ld	r0, sp, 0xffff          // 1-byte Folded Reload
	add	r0, r0, 0x1
	sub	r1, r0, 0x1a
	bc	EQ, BB9_6
	bra	BB9_4
BB9_5:                                  // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	st	r3, sp, 0xfffe          // 1-byte Folded Spill
	mov	r2, 0x17
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	ld	r1, sp, 0xfffe          // 1-byte Folded Reload
	add	r0, r1, 0x1
	add	r1, r1, 0xffb8
	add	r3, r0, 0x0
	sub	r1, r1, 0x1a
	bc	NE, BB9_5
BB9_6:                                  // %._crit_edge14
	ld	r6, sp, 0xfffb          // 1-byte Folded Reload
	sub	sp, sp, 0x5
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
sxc__Z10OLEDThreadPv:                   // @_Z10OLEDThreadPv
// BB#0:
	add	sp, sp, 0x7
	st	r6, sp, 0xfff9          // 1-byte Folded Spill
BB11_1:                                 // %.loopexit
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB11_2 Depth 2
                                        //     Child Loop BB11_4 Depth 2
                                        //       Child Loop BB11_9 Depth 3
                                        //       Child Loop BB11_8 Depth 3
                                        //       Child Loop BB11_6 Depth 3
                                        //     Child Loop BB11_16 Depth 2
                                        //       Child Loop BB11_17 Depth 3
                                        //         Child Loop BB11_18 Depth 4
                                        //           Child Loop BB11_19 Depth 5
	jsr	r6, sxc__Z19OLED_Init_160128RGBv
	jsr	r6, sxc__Z19OLED_Init_160128RGBv
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r0, 0x5000
BB11_2:                                 //   Parent Loop BB11_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st	r0, sp, 0xfffa          // 1-byte Folded Spill
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xfffa          // 1-byte Folded Reload
	add	r0, r0, 0xffff
	//cmp	r0, 0x0
	bc	ZC, BB11_2
// BB#3:                                // %_Z25OLED_FillScreen_160128RGBm.exit.i
                                        //   in Loop: Header=BB11_1 Depth=1
	mov	r2, 0x14
	mov	r3, 0x32
	mov	r4, 0x30
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x1b
	mov	r3, 0x32
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x22
	mov	r3, 0x32
	mov	r4, 0x4f
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x29
	mov	r3, 0x32
	mov	r4, 0x47
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x30
	mov	r3, 0x32
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x37
	mov	r3, 0x32
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x3e
	mov	r3, 0x32
	mov	r4, 0x53
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x45
	mov	r3, 0x32
	mov	r4, 0x53
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x4c
	mov	r3, 0x32
	mov	r4, 0x1a
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x14
	mov	r3, 0x1e
	mov	r4, 0x34
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x1b
	mov	r3, 0x1e
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x22
	mov	r3, 0x1e
	mov	r4, 0x4d
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x29
	mov	r3, 0x1e
	mov	r4, 0x50
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x30
	mov	r3, 0x1e
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x37
	mov	r3, 0x1e
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x3e
	mov	r3, 0x1e
	mov	r4, 0x41
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x45
	mov	r3, 0x1e
	mov	r4, 0x54
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x4c
	mov	r3, 0x1e
	mov	r4, 0x55
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x53
	mov	r3, 0x1e
	mov	r4, 0x52
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x5a
	mov	r3, 0x1e
	mov	r4, 0x45
	jsr	r6, sxc__Z19OLED_Text_160128RGBhhhmm
	mov	r2, 0x61
	mov	r3, 0x1e
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
	mov	r0, 0x46
	mov	r2, 0x0
BB11_4:                                 //   Parent Loop BB11_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB11_9 Depth 3
                                        //       Child Loop BB11_8 Depth 3
                                        //       Child Loop BB11_6 Depth 3
	st	r2, sp, 0xfffb          // 1-byte Folded Spill
	st	r0, sp, 0xfffc          // 1-byte Folded Spill
	mov	r2, 0x14
	add	r3, r0, 0x0
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	ld	r0, sp, 0xfffb          // 1-byte Folded Reload
	sub	r1, r0, 0x1f
	bc	NE, BB11_7
// BB#5:                                //   in Loop: Header=BB11_4 Depth=2
	mov	r0, 0x80
BB11_6:                                 // %.lr.ph.split.split.us.i.i
                                        //   Parent Loop BB11_1 Depth=1
                                        //     Parent Loop BB11_4 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	st	r0, sp, 0xfffa          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xfffa          // 1-byte Folded Reload
	add	r0, r0, 0xffff
	//cmp	r0, 0x0
	bc	ZC, BB11_6
	bra	BB11_14
BB11_7:                                 //   in Loop: Header=BB11_4 Depth=2
	mov	r2, 0x0
	mov	r3, 0x80
	sub	r1, r0, 0x0
	bc	NE, BB11_9
BB11_8:                                 // %.lr.ph.split.us..lr.ph.split.us.split_crit_edge.i.i
                                        //   Parent Loop BB11_1 Depth=1
                                        //     Parent Loop BB11_4 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	st	r3, sp, 0xfffa          // 1-byte Folded Spill
	mov	r2, 0xf800
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r3, sp, 0xfffa          // 1-byte Folded Reload
	add	r3, r3, 0xffff
	//cmp	r3, 0x0
	bc	ZC, BB11_8
	bra	BB11_14
BB11_9:                                 // %.lr.ph.split..lr.ph.split.split_crit_edge.i.i
                                        //   Parent Loop BB11_1 Depth=1
                                        //     Parent Loop BB11_4 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	sub	r1, r2, 0x0
	bc	EQ, BB11_11
// BB#10:                               // %.lr.ph.split..lr.ph.split.split_crit_edge.i.i
                                        //   in Loop: Header=BB11_9 Depth=3
	sub	r1, r2, 0x7f
	bc	NE, BB11_12
BB11_11:                                //   in Loop: Header=BB11_9 Depth=3
	st	r2, sp, 0xfffa          // 1-byte Folded Spill
	mov	r2, 0xf800
	bra	BB11_13
BB11_12:                                //   in Loop: Header=BB11_9 Depth=3
	st	r2, sp, 0xfffa          // 1-byte Folded Spill
	mov	r2, 0x0
BB11_13:                                //   in Loop: Header=BB11_9 Depth=3
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r2, sp, 0xfffa          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x80
	bc	NE, BB11_9
BB11_14:                                // %._crit_edge.i.i
                                        //   in Loop: Header=BB11_4 Depth=2
	ld	r0, sp, 0xfffc          // 1-byte Folded Reload
	add	r0, r0, 0x1
	ld	r2, sp, 0xfffb          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x20
	bc	NE, BB11_4
// BB#15:                               // %_Z15OLED_Start_Pagev.exit
                                        //   in Loop: Header=BB11_1 Depth=1
	mov	r0, 0x0
	st	r0, sp, 0xffff          // 1-byte Folded Spill
	mov	r2, 0x0
	jsr	r6, sxc__Z8Draw_Barhhmmjjj
	mov	r2, 0x53
	mov	r3, 0x32
	mov	r4, 0x0
	mov	r5, 0x1
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjj
	mov	r2, 0x68
	mov	r3, 0x1e
	mov	r4, 0xdf
	mov	r5, 0x0
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjj
	mov	r2, 0x53
	mov	r3, 0xa
	mov	r4, 0x30
	mov	r5, 0x1
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjj
BB11_16:                                //   Parent Loop BB11_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB11_17 Depth 3
                                        //         Child Loop BB11_18 Depth 4
                                        //           Child Loop BB11_19 Depth 5
	mov	r0, 0x53
	st	r0, sp, 0xfffd          // 1-byte Folded Spill
	mov	r2, 0x53
	mov	r3, 0x32
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r0, 0x0
BB11_17:                                // %.preheader.i
                                        //   Parent Loop BB11_1 Depth=1
                                        //     Parent Loop BB11_16 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB11_18 Depth 4
                                        //           Child Loop BB11_19 Depth 5
	st	r0, sp, 0xfffe          // 1-byte Folded Spill
	mov	r0, 0x32
	mov	r2, 0x0
BB11_18:                                //   Parent Loop BB11_1 Depth=1
                                        //     Parent Loop BB11_16 Depth=2
                                        //       Parent Loop BB11_17 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB11_19 Depth 5
	st	r2, sp, 0xfffc          // 1-byte Folded Spill
	st	r0, sp, 0xfffb          // 1-byte Folded Spill
	ld	r2, sp, 0xfffd          // 1-byte Folded Reload
	add	r3, r0, 0x0
	jsr	r6, sxc__Z26OLED_SetPosition_160128RGBhh
	jsr	r6, sxc__Z31OLED_WriteMemoryStart_160128RGBv
	mov	r0, 0x5
BB11_19:                                //   Parent Loop BB11_1 Depth=1
                                        //     Parent Loop BB11_16 Depth=2
                                        //       Parent Loop BB11_17 Depth=3
                                        //         Parent Loop BB11_18 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	st	r0, sp, 0xfffa          // 1-byte Folded Spill
	mov	r2, 0x0
	mov	r3, 0x0
	jsr	r6, sxc__Z20OLED_Pixel_160128RGBm
	ld	r0, sp, 0xfffa          // 1-byte Folded Reload
	add	r0, r0, 0xffff
	//cmp	r0, 0x0
	bc	ZC, BB11_19
// BB#20:                               //   in Loop: Header=BB11_18 Depth=4
	ld	r0, sp, 0xfffb          // 1-byte Folded Reload
	add	r0, r0, 0x1
	ld	r2, sp, 0xfffc          // 1-byte Folded Reload
	add	r2, r2, 0x1
	sub	r1, r2, 0x8
	bc	NE, BB11_18
// BB#21:                               //   in Loop: Header=BB11_17 Depth=3
	ld	r0, sp, 0xfffd          // 1-byte Folded Reload
	add	r0, r0, 0x7
	st	r0, sp, 0xfffd          // 1-byte Folded Spill
	ld	r0, sp, 0xfffe          // 1-byte Folded Reload
	add	r0, r0, 0x1
	sub	r1, r0, 0x7
	bc	NE, BB11_17
// BB#22:                               // %_Z16Clear_Data_Charshhm.exit
                                        //   in Loop: Header=BB11_16 Depth=2
	mov	r2, 0x53
	mov	r3, 0x32
	ld	r4, sp, 0xffff          // 1-byte Folded Reload
	mov	r5, 0x1
	jsr	r6, sxc__Z21OLED_Print_Sensor_Valhhjj
	ld	r2, sp, 0xffff          // 1-byte Folded Reload
	jsr	r6, sxc__Z8Draw_Barhhmmjjj
	mov	r2, 0x1f4
	jsr	r6, sxc__Z7wait_msj
	ld	r0, sp, 0xffff          // 1-byte Folded Reload
	add	r0, r0, 0x1
	st	r0, sp, 0xffff          // 1-byte Folded Spill
	sub	r1, r0, 0x65
	bc	EQ, BB11_1
	bra	BB11_16

//align
@ = (@ + 1-1)  & -1
sxc__Z10TempThreadPv:                   // @_Z10TempThreadPv
// BB#0:
	add	sp, sp, 0x1
	st	r6, sp, 0xffff          // 1-byte Folded Spill
	mov	r1, sxc_.str5
	//APP
		jsr	r6, XPD_EchoString
	//NO_APP
	mov	r1, 0x0
	//APP
		jsr	r6, XPD_EchoSignedDec
	//NO_APP
	mov	r1, sxc_.str6
	//APP
		jsr	r6, XPD_EchoString
	//NO_APP
	mov	r2, 0x3e8
	jsr	r6, sxc__Z7wait_msj

//align
@ = (@ + 1-1)  & -1
sxc__Z9PIDThreadPv:                     // @_Z9PIDThreadPv
// BB#0:
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
	mov	r0, 0x0
	add	r2, r0, 0x0
	bra	BB13_1
BB13_7:                                 //   in Loop: Header=BB13_1 Depth=1
	and	r1, r3, 0xff7f
	outp	r1, 0x26
	mov	r2, 0x1
BB13_1:                                 // %_Z12led_control2j.exit
                                        // =>This Inner Loop Header: Depth=1
	inp	r1, 0x3e
	inp	r3, 0x43
	ior	r1, r3, r1
	sub	r1, r1, 0x0
	bc	GT, BB13_5
// BB#2:                                //   in Loop: Header=BB13_1 Depth=1
	inp	r3, 0x32
	sub	r1, r0, 0x0
	bc	NE, BB13_4
// BB#3:                                //   in Loop: Header=BB13_1 Depth=1
	and	r0, r3, 0xfffd
	outp	r0, 0x32
	mov	r0, 0x1
	bra	BB13_5
BB13_4:                                 //   in Loop: Header=BB13_1 Depth=1
	ior	r0, r3, 0x2
	outp	r0, 0x32
	mov	r0, 0x0
BB13_5:                                 // %_Z12led_control1j.exit
                                        //   in Loop: Header=BB13_1 Depth=1
	inp	r1, 0x45
	//cmp	r1, 0x0
	bc	NC, BB13_1
// BB#6:                                //   in Loop: Header=BB13_1 Depth=1
	inp	r3, 0x26
	sub	r1, r2, 0x0
	bc	EQ, BB13_7
// BB#8:                                //   in Loop: Header=BB13_1 Depth=1
	ior	r1, r3, 0x80
	outp	r1, 0x26
	mov	r2, 0x0
	bra	BB13_1

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
BB14_1:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	LT0, BB14_1
// BB#2:
	mov	r0, 0x1
	outp	r0, 0x75
	mov	r0, 0x805
	outp	r0, 0x74
	inp	r0, 0x72
	and	r0, r0, 0xfbff
	outp	r0, 0x72
BB14_3:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	LT0, BB14_3
// BB#4:
	inp	r0, 0x72
	ior	r0, r0, 0xc00
	outp	r0, 0x72
BB14_5:                                 // =>This Inner Loop Header: Depth=1
	inp	r0, 0x72
	//cmp	r0, 0x0
	bc	NC, BB14_5
// BB#6:                                // %_Z8InitGPIOv.exit
	mov	r0, 0x8183
	outp	r0, 0x73
	mov	r0, 0xf
	outp	r0, 0x37
	mov	r0, 0x1000
	outp	r0, 0x27
	mov	r0, 0x700
	outp	r0, 0x21
	inp	r0, 0x20
	ior	r0, r0, 0x4
	outp	r0, 0x20
	inp	r0, 0x26
	ior	r0, r0, 0x10
	outp	r0, 0x26
	mov	r1, 0x100
	outp	r1, 0x33
	inp	r0, 0x32
	ior	r0, r0, 0x1
	outp	r0, 0x32
	mov	r0, 0x8000
	outp	r0, 0x27
	mov	r2, 0x200
	outp	r2, 0x33
	outp	r1, 0x33
	inp	r1, 0x32
	ior	r1, r1, 0x1
	outp	r1, 0x32
	outp	r0, 0x7
	mov	r1, 0xa
	outp	r1, 0x3
	mov	r1, 0x0
	outp	r1, 0x0
	mov	r2, sxc__Z10OLEDThreadPv
	outp	r2, 0x1
	outp	r0, 0x6
	outp	r0, 0x7
	ld	r2, thrds_vector
	and	r2, r2, 0xfffd
	st	r2, thrds_vector
	outp	r2, 0x4
	outp	r0, 0x6
	outp	r0, 0x7
	mov	r2, 0x12
	outp	r2, 0x3
	outp	r1, 0x0
	mov	r2, sxc__Z10TempThreadPv
	outp	r2, 0x1
	outp	r0, 0x6
	outp	r0, 0x7
	ld	r2, thrds_vector
	and	r2, r2, 0xfffb
	st	r2, thrds_vector
	outp	r2, 0x4
	outp	r0, 0x6
	outp	r0, 0x7
	mov	r2, 0x1a
	outp	r2, 0x3
	outp	r1, 0x0
	mov	r1, sxc__Z9PIDThreadPv
	outp	r1, 0x1
	outp	r0, 0x6
	outp	r0, 0x7
	ld	r1, thrds_vector
	and	r1, r1, 0xfff7
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
	bc	EQ, BB17_3
// BB#1:
	add	r0, r2, 0x0
BB17_2:                                 // %.lr.ph
                                        // =>This Inner Loop Header: Depth=1
	st	r3, r0, 0x0
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB17_2
BB17_3:                                 // %._crit_edge
	add	r0, r2, 0x0
	jsr	r6, r6

//align
@ = (@ + 1-1)  & -1
sxc_memcpy:                             // @memcpy
// BB#0:
	sub	r1, r2, r3
	bc	EQ, BB18_4
// BB#1:
	sub	r1, r4, 0x0
	bc	EQ, BB18_4
// BB#2:
	add	r0, r2, 0x0
BB18_3:                                 // %.lr.ph.i
                                        // =>This Inner Loop Header: Depth=1
	ld	r1, r3, 0x0
	st	r1, r0, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB18_3
BB18_4:                                 // %memcpy_base.exit
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
	bc	UGE, BB19_1
// BB#4:
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB19_7
// BB#5:                                // %.lr.ph23.i.preheader
	mov	r0, 0x1
	sub	r0, r0, r4
BB19_6:                                 // %.lr.ph23.i
                                        // =>This Inner Loop Header: Depth=1
	sub	r1, r2, r0
	sub	r4, r3, r0
	ld	r4, r4, 0x0
	st	r4, r1, 0x0
	add	r0, r0, 0x1
	sub	r1, r0, 0x1
	bc	NE, BB19_6
	bra	BB19_7
BB19_1:
	and	r0, r0, 0x1
	//cmp	r0, 0x0
	bc	ZC, BB19_7
// BB#2:
	add	r0, r2, 0x0
BB19_3:                                 // %.lr.ph.i
                                        // =>This Inner Loop Header: Depth=1
	ld	r1, r3, 0x0
	st	r1, r0, 0x0
	add	r3, r3, 0x1
	add	r0, r0, 0x1
	add	r4, r4, 0xffff
	//cmp	r4, 0x0
	bc	ZC, BB19_3
BB19_7:                                 // %memcpy_base.exit
	add	r0, r2, 0x0
	jsr	r6, r6

