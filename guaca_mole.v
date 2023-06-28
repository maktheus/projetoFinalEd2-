// 320 pixles on the x
// 240 pixles on the y
//gotten off github
module projectVGA(
clk, 
rst, 
plot,
hole, 
VGA_R, 
VGA_G,
VGA_B,
VGA_HS,
VGA_VS,
VGA_BLANK,
VGA_SYNC,
VGA_CLK
);
input clk, rst;
reg [2:0]color;
reg [2:0]colorIn;
input [7:0]hole;
reg [9:0]xback;
reg [8:0]yback;
reg [9:0]x;
reg [8:0]y;
input plot;
output [9:0]VGA_R;
output [9:0]VGA_G;
output [9:0]VGA_B;
output VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK;


rectangle background(clk,rst,hole,3'b010,9'd0, 8'd0, 9'd320, 8'd240, plot, x, y, color);

vga_adapter my_vga_adapter(1'b1, clk, color, x, y, 1'b1, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);


endmodule

//WRITTEN BY JACOB GARDNER
// Edited Alex Benintendi
module rectangle(clock,rst, hole, colour,x, y, L, W, plot, newX, newY, Color);
input clock,rst;
input [8:0]x;
input [7:0]y;
input [2:0]colour;
input plot;
input [8:0] L;
input [7:0] W;
input [7:0] hole;
output reg [8:0] newX;
output reg [7:0] newY;
output reg [2:0] Color;


reg [2:0] S;
reg [2:0] NS;
reg [8:0] i;
parameter START = 3'd0,
FCOND = 3'd1,
XINC = 3'd2,
YINC = 3'd5,
FINC = 3'd3,
EXIT = 3'd4,
ERROR = 3'hF;

always @(posedge clock or negedge rst)
begin
	if (rst == 1'b0) 
		S <= START;
	else
		S <= NS;
end


always @(*)
begin
	if((((newX >= 9'd8) & (newX <= 9'd38)) | ((newX >= 9'd46) & (newX <= 9'd76)) | ((newX >= 9'd84) & (newX <= 9'd114)) | ((newX >= 9'd122) & (newX <= 9'd152)) | ((newX >= 9'd160) & (newX <= 9'd190)) | ((newX >= 9'd198) & (newX <= 9'd228)) | ((newX >= 9'd236) & (newX <= 9'd266)) | ((newX >= 9'd274) & (newX <= 9'd304))) & ((newY >= 8'd110) & (newY <= 8'd140)))
	begin
			
		Color = 3'b000;
	end
	else
	begin
		Color = 3'b010;
	end

	if(hole[0] == 1'b1)
	begin
		if(((newX == 9'd288) & (newY == 8'd84)) | (((newX >= 9'd287) & (newX <= 9'd289)) & (newY == 8'd85)) | (((newX >= 9'd286) & (newX <= 9'd290)) & (newY == 8'd86)) | (((newX >= 9'd285) & (newX <= 9'd291)) & (newY == 8'd87)) | (((newX >= 9'd284) & (newX <= 9'd292)) & (newY == 8'd88)) | (((newX >= 9'd283) & (newX <= 9'd293)) & (newY == 8'd89)) | (((newX >= 9'd282) & (newX <= 9'd294)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd286) & (newY == 8'd100)) | ((newX == 9'd290) & (newY == 8'd100)) | (((newX >= 9'd286) & (newX <= 9'd290)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	end
	
	if(hole[1] == 1'b1)
	begin
		if(((newX == 9'd250) & (newY == 8'd84)) | (((newX >= 9'd249) & (newX <= 9'd251)) & (newY == 8'd85)) | (((newX >= 9'd248) & (newX <= 9'd252)) & (newY == 8'd86)) | (((newX >= 9'd247) & (newX <= 9'd253)) & (newY == 8'd87)) | (((newX >= 9'd246) & (newX <= 9'd254)) & (newY == 8'd88)) | (((newX >= 9'd245) & (newX <= 9'd255)) & (newY == 8'd89)) | (((newX >= 9'd244) & (newX <= 9'd256)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd248) & (newY == 8'd100)) | ((newX == 9'd252) & (newY == 8'd100)) | (((newX >= 9'd248) & (newX <= 9'd252)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	end
	
	if(hole[2] == 1'b1)
	begin
		if(((newX == 9'd212) & (newY == 8'd84)) | (((newX >= 9'd211) & (newX <= 9'd213)) & (newY == 8'd85)) | (((newX >= 9'd210) & (newX <= 9'd214)) & (newY == 8'd86)) | (((newX >= 9'd209) & (newX <= 9'd215)) & (newY == 8'd87)) | (((newX >= 9'd208) & (newX <= 9'd216)) & (newY == 8'd88)) | (((newX >= 9'd207) & (newX <= 9'd217)) & (newY == 8'd89)) | (((newX >= 9'd206) & (newX <= 9'd218)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd210) & (newY == 8'd100)) | ((newX == 9'd214) & (newY == 8'd100)) | (((newX >= 9'd210) & (newX <= 9'd214)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	end
	
	if(hole[3] == 1'b1)
	begin
		if(((newX == 9'd174) & (newY == 8'd84)) | (((newX >= 9'd173) & (newX <= 9'd175)) & (newY == 8'd85)) | (((newX >= 9'd172) & (newX <= 9'd176)) & (newY == 8'd86)) | (((newX >= 9'd171) & (newX <= 9'd177)) & (newY == 8'd87)) | (((newX >= 9'd170) & (newX <= 9'd178)) & (newY == 8'd88)) | (((newX >= 9'd169) & (newX <= 9'd179)) & (newY == 8'd89)) | (((newX >= 9'd168) & (newX <= 9'd180)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd172) & (newY == 8'd100)) | ((newX == 9'd176) & (newY == 8'd100)) | (((newX >= 9'd172) & (newX <= 9'd176)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	
	
	end
	
	
	if(hole[4] == 1'b1)
	begin
		if(((newX == 9'd136) & (newY == 8'd84)) | (((newX >= 9'd135) & (newX <= 9'd137)) & (newY == 8'd85)) | (((newX >= 9'd134) & (newX <= 9'd138)) & (newY == 8'd86)) | (((newX >= 9'd133) & (newX <= 9'd139)) & (newY == 8'd87)) | (((newX >= 9'd132) & (newX <= 9'd140)) & (newY == 8'd88)) | (((newX >= 9'd131) & (newX <= 9'd141)) & (newY == 8'd89)) | (((newX >= 9'd130) & (newX <= 9'd142)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd134) & (newY == 8'd100)) | ((newX == 9'd138) & (newY == 8'd100)) | (((newX >= 9'd134) & (newX <= 9'd138)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	
	end
	
	
	if(hole[5] == 1'b1)
	begin
		if(((newX == 9'd98) & (newY == 8'd84)) | (((newX >= 9'd97) & (newX <= 9'd99)) & (newY == 8'd85)) | (((newX >= 9'd96) & (newX <= 9'd100)) & (newY == 8'd86)) | (((newX >= 9'd95) & (newX <= 9'd101)) & (newY == 8'd87)) | (((newX >= 9'd94) & (newX <= 9'd102)) & (newY == 8'd88)) | (((newX >= 9'd93) & (newX <= 9'd103)) & (newY == 8'd89)) | (((newX >= 9'd92) & (newX <= 9'd104)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd96) & (newY == 8'd100)) | ((newX == 9'd100) & (newY == 8'd100)) | (((newX >= 9'd96) & (newX <= 9'd100)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	end
	
	
	if(hole[6] == 1'b1)
	begin
		if(((newX == 9'd60) & (newY == 8'd84)) | (((newX >= 9'd59) & (newX <= 9'd61)) & (newY == 8'd85)) | (((newX >= 9'd58) & (newX <= 9'd62)) & (newY == 8'd86)) | (((newX >= 9'd57) & (newX <= 9'd63)) & (newY == 8'd87)) | (((newX >= 9'd56) & (newX <= 9'd64)) & (newY == 8'd88)) | (((newX >= 9'd55) & (newX <= 9'd65)) & (newY == 8'd89)) | (((newX >= 9'd54) & (newX <= 9'd66)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd58) & (newY == 8'd100)) | ((newX == 9'd62) & (newY == 8'd100)) | (((newX >= 9'd58) & (newX <= 9'd62)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	
	end
	
	if(hole[7] == 1'b1)
	begin
		if(((newX == 9'd22) & (newY == 8'd84)) | (((newX >= 9'd21) & (newX <= 9'd23)) & (newY == 8'd85)) | (((newX >= 9'd20) & (newX <= 9'd24)) & (newY == 8'd86)) | (((newX >= 9'd19) & (newX <= 9'd25)) & (newY == 8'd87)) | (((newX >= 9'd18) & (newX <= 9'd26)) & (newY == 8'd88)) | (((newX >= 9'd17) & (newX <= 9'd27)) & (newY == 8'd89)) | (((newX >= 9'd16) & (newX <= 9'd28)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
		
		if(((newX == 9'd20) & (newY == 8'd100)) | ((newX == 9'd24) & (newY == 8'd100)) | (((newX >= 9'd20) & (newX <= 9'd24)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	
	end
end


always @(*)
begin
	case (S)
		START: NS <= FCOND;
		FCOND: begin
			if(i < L && newY <= (y + W))
				NS <= XINC;
			else if (i == L && newY != (y + W))
				NS <= YINC;
			else 
				NS <= START;
		end
		FINC: NS <= FCOND;
		XINC: NS <= FINC;
		YINC: NS <= FCOND;
		default NS <= ERROR;
			
	endcase	
end

always @(posedge clock)
begin
		case (S)
			START:begin
			newX = x;
			newY = y;
			i <= 9'd0;
			
			end
			XINC:newX <= newX + 1'b1;
			YINC: begin
			newY = newY + 1'b1;
			newX <= x;
			i <= 9'd0;
			end
			FINC: i <= i + 1'd1;
		endcase
end


endmodule


module seven_segment(
input [3:0]i,
output reg [6:0]o
);


// HEX out - rewire DE2
//  ---a---
// |       |
// f       b
// |       |
//  ---g---
// |       |
// e       c
// |       |
//  ---d---
always @(*)
begin
	case (i)	    // abcdefg
		4'b0000: o = 7'b0000001;
		4'b0001: o = 7'b1111001;
		4'b0010: o = 7'b0010010;
		4'b0011: o = 7'b0000110;
		4'b0100: o = 7'b1001100;
		4'b0101: o = 7'b0100100;
		4'b0110: o = 7'b0100000;
		4'b0111: o = 7'b0001111;
		4'b1000: o = 7'b0000000;
		4'b1001: o = 7'b0001100;
		4'b1010: o = 7'b0001000;
		4'b1011: o = 7'b1100000;
		4'b1100: o = 7'b0110001;
		4'b1101: o = 7'b1000010;
		4'b1110: o = 7'b0110000;
		4'b1111: o = 7'b0111000;
	
	
	
	endcase
end



endmodule

module seven_segment_negative(i,o);

input i;
output reg [6:0]o; // a, b, c, d, e, f, g

always @(*)
begin

	case(i)	
		1'b1: o = 7'b1111110;
	   1'b0: o = 7'b1111111;
	endcase
end

endmodule

/* VGA Adapter
 * ----------------
 *
 * This is an implementation of a VGA Adapter. The adapter uses VGA mode signalling to initiate
 * a 640x480 resolution mode on a computer monitor, with a refresh rate of approximately 60Hz.
 * It is designed for easy use in an early digital logic design course to facilitate student
 * projects on the Altera DE2 Educational board.
 *
 * This implementation of the VGA adapter can display images of varying colour depth at a resolution of
 * 320x240 or 160x120 superpixels. The concept of superpixels is introduced to reduce the amount of on-chip
 * memory used by the adapter. The following table shows the number of bits of on-chip memory used by
 * the adapter in various resolutions and colour depths.
 * 
 * -------------------------------------------------------------------------------------------------------------------------------
 * Resolution | Mono    | 8 colours | 64 colours | 512 colours | 4096 colours | 32768 colours | 262144 colours | 2097152 colours |
 * -------------------------------------------------------------------------------------------------------------------------------
 * 160x120    |   19200 |     57600 |     115200 |      172800 |       230400 |        288000 |         345600 |          403200 |
 * 320x240    |   78600 |    230400 | ############## Does not fit ############################################################## |
 * -------------------------------------------------------------------------------------------------------------------------------
 *
 * By default the adapter works at the resolution of 320x240 with 8 colours. To set the adapter in any of
 * the other modes, the adapter must be instantiated with specific parameters. These parameters are:
 * - RESOLUTION - a string that should be either "320x240" or "160x120".
 * - MONOCHROME - a string that should be "TRUE" if you only want black and white colours, and "FALSE"
 *                otherwise.
 * - BITS_PER_COLOUR_CHANNEL  - an integer specifying how many bits are available to describe each colour
 *                          (R,G,B). A default value of 1 indicates that 1 bit will be used for red
 *                          channel, 1 for green channel and 1 for blue channel. This allows 8 colours
 *                          to be used.
 * 
 * In addition to the above parameters, a BACKGROUND_IMAGE parameter can be specified. The parameter
 * refers to a memory initilization file (MIF) which contains the initial contents of video memory.
 * By specifying the initial contents of the memory we can force the adapter to initially display an
 * image of our choice. Please note that the image described by the BACKGROUND_IMAGE file will only
 * be valid right after your program the DE2 board. If your circuit draws a single pixel on the screen,
 * the video memory will be altered and screen contents will be changed. In order to restore the background
 * image your circuti will have to redraw the background image pixel by pixel, or you will have to
 * reprogram the DE2 board, thus allowing the video memory to be rewritten.
 *
 * To use the module connect the vga_adapter to your circuit. Your circuit should produce a value for
 * inputs X, Y and plot. When plot is high, at the next positive edge of the input clock the vga_adapter
 * will change the contents of the video memory for the pixel at location (X,Y). At the next redraw
 * cycle the VGA controller will update the contants of the screen by reading the video memory and copying
 * it over to the screen. Since the monitor screen has no memory, the VGA controller has to copy the
 * contents of the video memory to the screen once every 60th of a second to keep the image stable. Thus,
 * the video memory should not be used for other purposes as it may interfere with the operation of the
 * VGA Adapter.
 *
 * As a final note, ensure that the following conditions are met when using this module:
 * 1. You are implementing the the VGA Adapter on the Altera DE2 board. Using another board may change
 *    the amount of memory you can use, the clock generation mechanism, as well as pin assignments required
 *    to properly drive the VGA digital-to-analog converter.
 * 2. Outputs VGA_* should exist in your top level design. They should be assigned pin locations on the
 *    Altera DE2 board as specified by the DE2_pin_assignments.csv file.
 * 3. The input clock must have a frequency of 50 MHz with a 50% duty cycle. On the Altera DE2 board
 *    PIN_N2 is the source for the 50MHz clock.
 *
 * During compilation with Quartus II you may receive the following warnings:
 * - Warning: Variable or input pin "clocken1" is defined but never used
 * - Warning: Pin "VGA_SYNC" stuck at VCC
 * - Warning: Found xx output pins without output pin load capacitance assignment
 * These warnings can be ignored. The first warning is generated, because the software generated
 * memory module contains an input called "clocken1" and it does not drive logic. The second warning
 * indicates that the VGA_SYNC signal is always high. This is intentional. The final warning is
 * generated for the purposes of power analysis. It will persist unless the output pins are assigned
 * output capacitance. Leaving the capacitance values at 0 pf did not affect the operation of the module.
 *
 * If you see any other warnings relating to the vga_adapter, be sure to examine them carefully. They may
 * cause your circuit to malfunction.
 *
 * NOTES/REVISIONS:
 * July 10, 2007 - Modified the original version of the VGA Adapter written by Sam Vafaee in 2006. The module
 *		   now supports 2 different resolutions as well as uses half the memory compared to prior
 *		   implementation. Also, all settings for the module can be specified from the point
 *		   of instantiation, rather than by modifying the source code. (Tomasz S. Czajkowski)
 */

module vga_adapter(
			resetn,
			clock,
			colour,
			x, y, plot,
			/* Signals for the DAC to drive the monitor. */
			VGA_R,
			VGA_G,
			VGA_B,
			VGA_HS,
			VGA_VS,
			VGA_BLANK,
			VGA_SYNC,
			VGA_CLK);
 
	parameter BITS_PER_COLOUR_CHANNEL = 1;
	/* The number of bits per colour channel used to represent the colour of each pixel. A value
	 * of 1 means that Red, Green and Blue colour channels will use 1 bit each to represent the intensity
	 * of the respective colour channel. For BITS_PER_COLOUR_CHANNEL=1, the adapter can display 8 colours.
	 * In general, the adapter is able to use 2^(3*BITS_PER_COLOUR_CHANNEL ) colours. The number of colours is
	 * limited by the screen resolution and the amount of on-chip memory available on the target device.
	 */	
	
	parameter MONOCHROME = "FALSE";
	/* Set this parameter to "TRUE" if you only wish to use black and white colours. Doing so will reduce
	 * the amount of memory you will use by a factor of 3. */
	
	parameter RESOLUTION = "320x240";
	/* Set this parameter to "160x120" or "320x240". It will cause the VGA adapter to draw each dot on
	 * the screen by using a block of 4x4 pixels ("160x120" resolution) or 2x2 pixels ("320x240" resolution).
	 * It effectively reduces the screen resolution to an integer fraction of 640x480. It was necessary
	 * to reduce the resolution for the Video Memory to fit within the on-chip memory limits.
	 */
	
	parameter BACKGROUND_IMAGE = "background.mif";
	/* The initial screen displayed when the circuit is first programmed onto the DE2 board can be
	 * defined useing an MIF file. The file contains the initial colour for each pixel on the screen
	 * and is placed in the Video Memory (VideoMemory module) upon programming. Note that resetting the
	 * VGA Adapter will not cause the Video Memory to revert to the specified image. */


	/*****************************************************************************/
	/* Declare inputs and outputs.                                               */
	/*****************************************************************************/
	input resetn;
	input clock;
	
	/* The colour input can be either 1 bit or 3*BITS_PER_COLOUR_CHANNEL bits wide, depending on
	 * the setting of the MONOCHROME parameter.
	 */
	input [((MONOCHROME == "TRUE") ? (0) : (BITS_PER_COLOUR_CHANNEL*3-1)):0] colour;
	
	/* Specify the number of bits required to represent an (X,Y) coordinate on the screen for
	 * a given resolution.
	 */
	input [((RESOLUTION == "320x240") ? (8) : (7)):0] x; 
	input [((RESOLUTION == "320x240") ? (7) : (6)):0] y;
	
	/* When plot is high then at the next positive edge of the clock the pixel at (x,y) will change to
	 * a new colour, defined by the value of the colour input.
	 */
	input plot;
	
	/* These outputs drive the VGA display. The VGA_CLK is also used to clock the FSM responsible for
	 * controlling the data transferred to the DAC driving the monitor. */
	output [9:0] VGA_R;
	output [9:0] VGA_G;
	output [9:0] VGA_B;
	output VGA_HS;
	output VGA_VS;
	output VGA_BLANK;
	output VGA_SYNC;
	output VGA_CLK;

	/*****************************************************************************/
	/* Declare local signals here.                                               */
	/*****************************************************************************/
	
	wire valid_160x120;
	wire valid_320x240;
	/* Set to 1 if the specified coordinates are in a valid range for a given resolution.*/
	
	wire writeEn;
	/* This is a local signal that allows the Video Memory contents to be changed.
	 * It depends on the screen resolution, the values of X and Y inputs, as well as 
	 * the state of the plot signal.
	 */
	
	wire [((MONOCHROME == "TRUE") ? (0) : (BITS_PER_COLOUR_CHANNEL*3-1)):0] to_ctrl_colour;
	/* Pixel colour read by the VGA controller */
	
	wire [((RESOLUTION == "320x240") ? (16) : (14)):0] user_to_video_memory_addr;
	/* This bus specifies the address in memory the user must write
	 * data to in order for the pixel intended to appear at location (X,Y) to be displayed
	 * at the correct location on the screen.
	 */
	
	wire [((RESOLUTION == "320x240") ? (16) : (14)):0] controller_to_video_memory_addr;
	/* This bus specifies the address in memory the vga controller must read data from
	 * in order to determine the colour of a pixel located at coordinate (X,Y) of the screen.
	 */
	
	wire clock_25;
	/* 25MHz clock generated by dividing the input clock frequency by 2. */
	
	wire vcc, gnd;
	
	/*****************************************************************************/
	/* Instances of modules for the VGA adapter.                                 */
	/*****************************************************************************/	
	assign vcc = 1'b1;
	assign gnd = 1'b0;
	
	vga_address_translator user_input_translator(
					.x(x), .y(y), .mem_address(user_to_video_memory_addr) );
		defparam user_input_translator.RESOLUTION = RESOLUTION;
	/* Convert user coordinates into a memory address. */

	assign valid_160x120 = (({1'b0, x} >= 0) & ({1'b0, x} < 160) & ({1'b0, y} >= 0) & ({1'b0, y} < 120)) & (RESOLUTION == "160x120");
	assign valid_320x240 = (({1'b0, x} >= 0) & ({1'b0, x} < 320) & ({1'b0, y} >= 0) & ({1'b0, y} < 240)) & (RESOLUTION == "320x240");
	assign writeEn = (plot) & (valid_160x120 | valid_320x240);
	/* Allow the user to plot a pixel if and only if the (X,Y) coordinates supplied are in a valid range. */
	
	/* Create video memory. */
	altsyncram	VideoMemory (
				.wren_a (writeEn),
				.wren_b (gnd),
				.clock0 (clock), // write clock
				.clock1 (clock_25), // read clock
				.clocken0 (vcc), // write enable clock
				.clocken1 (vcc), // read enable clock				
				.address_a (user_to_video_memory_addr),
				.address_b (controller_to_video_memory_addr),
				.data_a (colour), // data in
				.q_b (to_ctrl_colour)	// data out
				);
	defparam
		VideoMemory.WIDTH_A = ((MONOCHROME == "FALSE") ? (BITS_PER_COLOUR_CHANNEL*3) : 1),
		VideoMemory.WIDTH_B = ((MONOCHROME == "FALSE") ? (BITS_PER_COLOUR_CHANNEL*3) : 1),
		VideoMemory.INTENDED_DEVICE_FAMILY = "Cyclone II",
		VideoMemory.OPERATION_MODE = "DUAL_PORT",
		VideoMemory.WIDTHAD_A = ((RESOLUTION == "320x240") ? (17) : (15)),
		VideoMemory.NUMWORDS_A = ((RESOLUTION == "320x240") ? (76800) : (19200)),
		VideoMemory.WIDTHAD_B = ((RESOLUTION == "320x240") ? (17) : (15)),
		VideoMemory.NUMWORDS_B = ((RESOLUTION == "320x240") ? (76800) : (19200)),
		VideoMemory.OUTDATA_REG_B = "CLOCK1",
		VideoMemory.ADDRESS_REG_B = "CLOCK1",
		VideoMemory.CLOCK_ENABLE_INPUT_A = "BYPASS",
		VideoMemory.CLOCK_ENABLE_INPUT_B = "BYPASS",
		VideoMemory.CLOCK_ENABLE_OUTPUT_B = "BYPASS",
		VideoMemory.POWER_UP_UNINITIALIZED = "FALSE",
		VideoMemory.INIT_FILE = BACKGROUND_IMAGE;
		
	vga_pll mypll(clock, clock_25);
	/* This module generates a clock with half the frequency of the input clock.
	 * For the VGA adapter to operate correctly the clock signal 'clock' must be
	 * a 50MHz clock. The derived clock, which will then operate at 25MHz, is
	 * required to set the monitor into the 640x480@60Hz display mode (also known as
	 * the VGA mode).
	 */
	
	vga_controller controller(
			.vga_clock(clock_25),
			.resetn(resetn),
			.pixel_colour(to_ctrl_colour),
			.memory_address(controller_to_video_memory_addr), 
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK),
			.VGA_SYNC(VGA_SYNC),
			.VGA_CLK(VGA_CLK)				
		);
		defparam controller.BITS_PER_COLOUR_CHANNEL  = BITS_PER_COLOUR_CHANNEL ;
		defparam controller.MONOCHROME = MONOCHROME;
		defparam controller.RESOLUTION = RESOLUTION;

endmodule
	


    /* This module converts a user specified coordinates into a memory address.
 * The output of the module depends on the resolution set by the user.
 */
module vga_address_translator(x, y, mem_address);

	parameter RESOLUTION = "320x240";
	/* Set this parameter to "160x120" or "320x240". It will cause the VGA adapter to draw each dot on
	 * the screen by using a block of 4x4 pixels ("160x120" resolution) or 2x2 pixels ("320x240" resolution).
	 * It effectively reduces the screen resolution to an integer fraction of 640x480. It was necessary
	 * to reduce the resolution for the Video Memory to fit within the on-chip memory limits.
	 */

	input [((RESOLUTION == "320x240") ? (8) : (7)):0] x; 
	input [((RESOLUTION == "320x240") ? (7) : (6)):0] y;	
	output reg [((RESOLUTION == "320x240") ? (16) : (14)):0] mem_address;
	
	/* The basic formula is address = y*WIDTH + x;
	 * For 320x240 resolution we can write 320 as (256 + 64). Memory address becomes
	 * (y*256) + (y*64) + x;
	 * This simplifies multiplication a simple shift and add operation.
	 * A leading 0 bit is added to each operand to ensure that they are treated as unsigned
	 * inputs. By default the use a '+' operator will generate a signed adder.
	 * Similarly, for 160x120 resolution we write 160 as 128+32.
	 */
	wire [16:0] res_320x240 = ({1'b0, y, 8'd0} + {1'b0, y, 6'd0} + {1'b0, x});
	wire [15:0] res_160x120 = ({1'b0, y, 7'd0} + {1'b0, y, 5'd0} + {1'b0, x});
	
	always @(*)
	begin
		if (RESOLUTION == "320x240")
			mem_address = res_320x240;
		else
			mem_address = res_160x120[14:0];
	end
endmodule

/* This module implements the VGA controller. It assumes a 25MHz clock is supplied as input.
 *
 * General approach:
 * Go through each line of the screen and read the colour each pixel on that line should have from
 * the Video memory. To do that for each (x,y) pixel on the screen convert (x,y) coordinate to
 * a memory_address at which the pixel colour is stored in Video memory. Once the pixel colour is
 * read from video memory its brightness is first increased before it is forwarded to the VGA DAC.
 */
module vga_controller(	vga_clock, resetn, pixel_colour, memory_address, 
		VGA_R, VGA_G, VGA_B,
		VGA_HS, VGA_VS, VGA_BLANK,
		VGA_SYNC, VGA_CLK);
	
	/* Screen resolution and colour depth parameters. */
	
	parameter BITS_PER_COLOUR_CHANNEL = 1;
	/* The number of bits per colour channel used to represent the colour of each pixel. A value
	 * of 1 means that Red, Green and Blue colour channels will use 1 bit each to represent the intensity
	 * of the respective colour channel. For BITS_PER_COLOUR_CHANNEL=1, the adapter can display 8 colours.
	 * In general, the adapter is able to use 2^(3*BITS_PER_COLOUR_CHANNEL) colours. The number of colours is
	 * limited by the screen resolution and the amount of on-chip memory available on the target device.
	 */	
	
	parameter MONOCHROME = "FALSE";
	/* Set this parameter to "TRUE" if you only wish to use black and white colours. Doing so will reduce
	 * the amount of memory you will use by a factor of 3. */
	
	parameter RESOLUTION = "320x240";
	/* Set this parameter to "160x120" or "320x240". It will cause the VGA adapter to draw each dot on
	 * the screen by using a block of 4x4 pixels ("160x120" resolution) or 2x2 pixels ("320x240" resolution).
	 * It effectively reduces the screen resolution to an integer fraction of 640x480. It was necessary
	 * to reduce the resolution for the Video Memory to fit within the on-chip memory limits.
	 */
	
	//--- Timing parameters.
	/* Recall that the VGA specification requires a few more rows and columns are drawn
	 * when refreshing the screen than are actually present on the screen. This is necessary to
	 * generate the vertical and the horizontal syncronization signals. If you wish to use a
	 * display mode other than 640x480 you will need to modify the parameters below as well
	 * as change the frequency of the clock driving the monitor (VGA_CLK).
	 */
	parameter C_VERT_NUM_PIXELS  = 10'd480;
	parameter C_VERT_SYNC_START  = 10'd493;
	parameter C_VERT_SYNC_END    = 10'd494; //(C_VERT_SYNC_START + 2 - 1); 
	parameter C_VERT_TOTAL_COUNT = 10'd525;

	parameter C_HORZ_NUM_PIXELS  = 10'd640;
	parameter C_HORZ_SYNC_START  = 10'd659;
	parameter C_HORZ_SYNC_END    = 10'd754; //(C_HORZ_SYNC_START + 96 - 1); 
	parameter C_HORZ_TOTAL_COUNT = 10'd800;	
		
	/*****************************************************************************/
	/* Declare inputs and outputs.                                               */
	/*****************************************************************************/
	
	input vga_clock, resetn;
	input [((MONOCHROME == "TRUE") ? (0) : (BITS_PER_COLOUR_CHANNEL*3-1)):0] pixel_colour;
	output [((RESOLUTION == "320x240") ? (16) : (14)):0] memory_address;
	output reg [9:0] VGA_R;
	output reg [9:0] VGA_G;
	output reg [9:0] VGA_B;
	output reg VGA_HS;
	output reg VGA_VS;
	output reg VGA_BLANK;
	output VGA_SYNC, VGA_CLK;
	
	/*****************************************************************************/
	/* Local Signals.                                                            */
	/*****************************************************************************/
	
	reg VGA_HS1;
	reg VGA_VS1;
	reg VGA_BLANK1; 
	reg [9:0] xCounter, yCounter;
	wire xCounter_clear;
	wire yCounter_clear;
	wire vcc;
	
	reg [((RESOLUTION == "320x240") ? (8) : (7)):0] x; 
	reg [((RESOLUTION == "320x240") ? (7) : (6)):0] y;	
	/* Inputs to the converter. */
	
	/*****************************************************************************/
	/* Controller implementation.                                                */
	/*****************************************************************************/

	assign vcc =1'b1;
	
	/* A counter to scan through a horizontal line. */
	always @(posedge vga_clock or negedge resetn)
	begin
		if (!resetn)
			xCounter <= 10'd0;
		else if (xCounter_clear)
			xCounter <= 10'd0;
		else
		begin
			xCounter <= xCounter + 1'b1;
		end
	end
	assign xCounter_clear = (xCounter == (C_HORZ_TOTAL_COUNT-1));

	/* A counter to scan vertically, indicating the row currently being drawn. */
	always @(posedge vga_clock or negedge resetn)
	begin
		if (!resetn)
			yCounter <= 10'd0;
		else if (xCounter_clear && yCounter_clear)
			yCounter <= 10'd0;
		else if (xCounter_clear)		//Increment when x counter resets
			yCounter <= yCounter + 1'b1;
	end
	assign yCounter_clear = (yCounter == (C_VERT_TOTAL_COUNT-1)); 
	
	/* Convert the xCounter/yCounter location from screen pixels (640x480) to our
	 * local dots (320x240 or 160x120). Here we effectively divide x/y coordinate by 2 or 4,
	 * depending on the resolution. */
	always @(*)
	begin
		if (RESOLUTION == "320x240")
		begin
			x = xCounter[9:1];
			y = yCounter[8:1];
		end
		else
		begin
			x = xCounter[9:2];
			y = yCounter[8:2];
		end
	end
	
	/* Change the (x,y) coordinate into a memory address. */
	vga_address_translator controller_translator(
					.x(x), .y(y), .mem_address(memory_address) );
		defparam controller_translator.RESOLUTION = RESOLUTION;


	/* Generate the vertical and horizontal synchronization pulses. */
	always @(posedge vga_clock)
	begin
		//- Sync Generator (ACTIVE LOW)
		VGA_HS1 <= ~((xCounter >= C_HORZ_SYNC_START) && (xCounter <= C_HORZ_SYNC_END));
		VGA_VS1 <= ~((yCounter >= C_VERT_SYNC_START) && (yCounter <= C_VERT_SYNC_END));
		
		//- Current X and Y is valid pixel range
		VGA_BLANK1 <= ((xCounter < C_HORZ_NUM_PIXELS) && (yCounter < C_VERT_NUM_PIXELS));	
	
		//- Add 1 cycle delay
		VGA_HS <= VGA_HS1;
		VGA_VS <= VGA_VS1;
		VGA_BLANK <= VGA_BLANK1;	
	end
	
	/* VGA sync should be 1 at all times. */
	assign VGA_SYNC = vcc;
	
	/* Generate the VGA clock signal. */
	assign VGA_CLK = vga_clock;
	
	/* Brighten the colour output. */
	// The colour input is first processed to brighten the image a little. Setting the top
	// bits to correspond to the R,G,B colour makes the image a bit dull. To brighten the image,
	// each bit of the colour is replicated through the 10 DAC colour input bits. For example,
	// when BITS_PER_COLOUR_CHANNEL is 2 and the red component is set to 2'b10, then the
	// VGA_R input to the DAC will be set to 10'b1010101010.
	
	integer index;
	integer sub_index;
	
	always @(pixel_colour)
	begin		
		VGA_R <= 'b0;
		VGA_G <= 'b0;
		VGA_B <= 'b0;
		if (MONOCHROME == "FALSE")
		begin
			for (index = 10-BITS_PER_COLOUR_CHANNEL; index >= 0; index = index - BITS_PER_COLOUR_CHANNEL)
			begin
				for (sub_index = BITS_PER_COLOUR_CHANNEL - 1; sub_index >= 0; sub_index = sub_index - 1)
				begin
					VGA_R[sub_index+index] <= pixel_colour[sub_index + BITS_PER_COLOUR_CHANNEL*2];
					VGA_G[sub_index+index] <= pixel_colour[sub_index + BITS_PER_COLOUR_CHANNEL];
					VGA_B[sub_index+index] <= pixel_colour[sub_index];
				end
			end	
		end
		else
		begin
			for (index = 0; index < 10; index = index + 1)
			begin
				VGA_R[index] <= pixel_colour[0:0];
				VGA_G[index] <= pixel_colour[0:0];
				VGA_B[index] <= pixel_colour[0:0];
			end	
		end
	end

endmodule

// synopsys translate_on
module vga_pll (
	clock_in,
	clock_out);

	input	  clock_in;
	output	  clock_out;

	wire [5:0] clock_output_bus;
	wire [1:0] clock_input_bus;
	wire gnd;
	
	assign gnd = 1'b0;
	assign clock_input_bus = { gnd, clock_in }; 

	altpll	altpll_component (
				.inclk (clock_input_bus),
				.clk (clock_output_bus)
				);
	defparam
		altpll_component.operation_mode = "NORMAL",
		altpll_component.intended_device_family = "Cyclone II",
		altpll_component.lpm_type = "altpll",
		altpll_component.pll_type = "FAST",
		/* Specify the input clock to be a 50MHz clock. A 50 MHz clock is present
		 * on PIN_N2 on the DE2 board. We need to specify the input clock frequency
		 * in order to set up the PLL correctly. To do this we must put the input clock
		 * period measured in picoseconds in the inclk0_input_frequency parameter.
		 * 1/(20000 ps) = 0.5 * 10^(5) Hz = 50 * 10^(6) Hz = 50 MHz. */
		altpll_component.inclk0_input_frequency = 20000,
		altpll_component.primary_clock = "INCLK0",
		/* Specify output clock parameters. The output clock should have a
		 * frequency of 25 MHz, with 50% duty cycle. */
		altpll_component.compensate_clock = "CLK0",
		altpll_component.clk0_phase_shift = "0",
		altpll_component.clk0_divide_by = 2,
		altpll_component.clk0_multiply_by = 1,		
		altpll_component.clk0_duty_cycle = 50;
		
	assign clock_out = clock_output_bus[0];

endmodule

module wam_led (            // LED output
    input  wire [7:0] holes,
    output wire [7:0] ld
    );

    assign ld = holes;
endmodule // wam_led

module wam_lst (            // digital first bit (hardness bit) flashing for tap or hardness change
    input wire clk_19,
    input wire [7:0] tap,
    input wire lft,
    input wire rgt,
    input wire cout0,
    output reg lstn
    );

    reg  [3:0] cnt;     // counter
    wire trg;           // trigger signal
    wire cout0s;        // cout0 signal conveter

    wam_tch tchc( .clk_19(clk_19), .btn(cout0), .tch(cout0s));
    assign trg = tap[0] | tap[1] | tap[2] | tap[3] | tap[4] | tap[5] | tap[6] | tap[7] | lft | rgt | cout0s;

    always @ (posedge clk_19) begin
        if (cnt > 0) begin                  // lasting
            if (cnt > 4'b0100) begin        // long enough
                cnt <= 4'b0000;
                lstn <= 0;                  // dim
            end
            else begin
                cnt <= cnt + 1;
            end
        end
        else begin                          // idle
            if (trg) begin                  // if trigger then light up
                cnt <= 4'b0001;
                lstn <= 1;
            end
        end
    end
endmodule // wam_lst

module wam_dis(
input [11:0]score,
input [3:0] hrdn,
output [6:0]hardness,
output [6:0]seg7_dig0,
output [6:0]seg7_dig1);

reg [3:0] result_one_digit;
reg [3:0] result_ten_digit;
reg [3:0] result_hundred_digit;
reg result_is_negative;

seven_segment mmsb(score[7:4], seg7_dig1);
seven_segment lsb(score[3:0], seg7_dig0);
seven_segment dis_hrdn(hrdn, hardness);



endmodule

module wam_rdn(             // generate 8-bit random number
    input wire clk,
    input wire load,
    input wire [7:0] seed,
    output reg [7:0] num
    );

    always @( posedge clk or posedge load ) begin
        if(load)
            num <= seed;            // load seed
        else begin                  // shift with feed back
            num[0] <= num[7];
            num[1] <= num[0];
            num[2] <= num[1];
            num[3] <= num[2];
            num[4] <= num[3]^num[7];
            num[5] <= num[4]^num[7];
            num[6] <= num[5]^num[7];
            num[7] <= num[6];
        end
    end
endmodule // wam_rdn

module wam_gen (            // control lives of moles
    input wire clk_19,
    input wire clr,
    input wire [31:0] clk_cnt,
    input wire [7:0]  hit,
    input wire [3:0]  hrdn,
    output reg [7:0]  holes         // which hole has moles
    );

    reg  [2:0]  clk_22_cnt;         // clk_22 counter, 3 bits on 2^19
    reg  [31:0] holes_cnt;          // counter of roles, 3 bits for each hole on 2^22
    wire [7:0]  rnum;               // random number

    wire [3:0]  age;                // moles lifelength
    wire [7:0]  rto;                // moles appearance ratio

    reg  [2:0]  j;                  // select holes in different rounds
    integer i;                      // index for holes in one round

    // get parameters
    wam_par par( .hrdn(hrdn), .age(age), .rto(rto) );

    // make random number
    wam_rdn rdn( .clk(clk_cnt[21]), .load(clr), .seed(~clk_cnt[7:0]), .num(rnum) );

    // 1-phrase stage machine
    always @ ( posedge clk_19 or posedge clr ) begin
        if (clr) begin
            holes <= 8'b0;
            holes_cnt <= 32'b0;
            j <= 0;
        end
        else begin
            if (clk_22_cnt < 3'b111) begin      // the clk_19 control
                clk_22_cnt <= clk_22_cnt + 1;
                for (i=0; i<8; i=i+1) begin
                    if (hit[i]) begin           // handle hit event
                        holes_cnt[4*i+:4] <= 4'b0000;
                        holes[i] <= 0;
                    end
                end
            end
            else begin                          // the clk_22 control
                clk_22_cnt <= 3'b000;
                for (i=0; i<8; i=i+1) begin
                    if (holes[i] > 0) begin                         // already have mole
                        if ((holes_cnt[4*i+:4] > age) || hit[i]) begin      // age decide moles' life
                            holes_cnt[4*i+:4] <= 4'b0000;
                            holes[i] <= 0;
                        end
                        else begin                                  // count moles' life
                            holes_cnt[4*i+:4] <= holes_cnt[4*i+:4] + 1;
                        end
                    end
                    else begin                                      // no mole yet
                        if (rnum < rto) begin                       // rto decide new mole or not
                            if (j==i) begin                         // new mole in random hole j
                                holes_cnt[4*i+:4] <= 4'b0001;
                                holes[i] <= 1;
                            end
                        end
                    end
                end
                j <= j + 1;
            end
        end
    end
endmodule // wam_gen

// Switch input and hit control
//
// by nyLiao, April, 2019

module wam_tap (            // input switch
    input wire clk_19,
    input wire [7:0] sw,
    output reg [7:0] tap    // active high
    );

    reg [7:0]  sw_pre;      // last status
    wire [7:0] sw_edg;      // bilateral edge trigger
    reg [31:0] sw_cnt;      // state machine counter
    integer i;              // switch selector

    always @(posedge clk_19)    // bilateral edge detection
        sw_pre <= sw;
    assign sw_edg = ((sw_pre) & (~sw)) | ((~sw_pre) & (sw));

    always @ (posedge clk_19) begin
        for (i=0; i<8; i=i+1) begin
            if (sw_cnt[4*i+:4] > 0) begin               // filtering
                if (sw_cnt[4*i+:4] > 4'b0100) begin     // stable
                    sw_cnt[4*i+:4] <= 4'b0000;
                    tap[i] <= 1;                        // output status
                end
                else begin
                    if (sw_edg[i]) begin                // if switch then back to idle
                        sw_cnt[4*i+:4] <= 0;
                    end
                    else begin                          // count
                        sw_cnt[4*i+:4] <= sw_cnt[4*i+:4] + 1;
                    end
                end
            end
            else begin                                  // idle
                tap[i] <= 0;
                if (sw_edg[i]) begin                    // if switch then start filtering
                    sw_cnt[4*i+:4] <= 4'b0001;
                end
            end
        end
    end
endmodule // wam_tap

module wam_hit (            // get successful hit condition
    input wire clk_19,
    input wire [7:0] tap,
    input wire [7:0] holes,
    output reg [7:0] hit    // effective hit
    );

    reg [7:0] holes_pre;    // holes last status

    always @ (posedge clk_19) begin
        hit <= tap & holes_pre;     // both tap and have mole, then is successful hit
        holes_pre <= holes;         // save hole status
    end
endmodule // wam_hit

// Hardness control
//
// by nyLiao, April, 2019

module wam_tch (            // input button
    input wire clk_19,
    input wire btn,
    output reg tch              // active high
    );

    reg  btn_pre;               // button last status
    wire btn_edg;               // posedge trigger
    reg  [3:0] btn_cnt;         // counter

    always @(posedge clk_19)    // posedge detection
        btn_pre <= btn;
    assign btn_edg = (~btn_pre) & (btn);

    always @ (posedge clk_19) begin
        if (btn_cnt > 0) begin                  // filtering
            if (btn_cnt > 4'b0100) begin        // stable
                btn_cnt <= 4'b0000;
                tch <= 1;                       // output status
            end
            else begin
                if (btn_edg) begin              // if button then back to idle
                    btn_cnt <= 0;
                end
                else begin                      // count
                    btn_cnt <= btn_cnt + 1;
                end
            end
        end
        else begin                              // idle
            tch <= 0;
            if (btn_edg) begin                  // if button pressed then start filtering
                btn_cnt <= 4'b0001;
            end
        end
    end
endmodule // wam_tch

module wam_hrd (            // hardness control
    input wire clk_19,
    input wire clr,
    input wire lft,
    input wire rgt,
    input wire cout0,
    output reg [3:0] hrdn          // hardness of 0~9 or H (hard)
    );

    wire lfts;      // stable left button
    wire rgts;      // stable right button
    wire cout0s;    // shorter carry signal

    wire harder;
    wire easier;

    wam_tch tchl( .clk_19(clk_19), .btn(lft), .tch(lfts));
    wam_tch tchr( .clk_19(clk_19), .btn(rgt), .tch(rgts));
    wam_tch tchc( .clk_19(clk_19), .btn(cout0), .tch(cout0s));
    assign easier = lfts;
    assign harder = rgts | cout0s;

    always @ (posedge clk_19) begin
        if (clr)
            hrdn <= 0;
        else if (easier) begin          // lft: easier
            if (hrdn > 0) begin
                hrdn <= hrdn - 1'd1;
            end
        end
        else if (harder) begin          // rgt or cout0: harder
            if (hrdn < 10) begin
                hrdn <= hrdn + 1'd1;
            end
        end
    end
endmodule // wam_hrd

module wam_par (            // decide hardness parameters
    input wire [3:0] hrdn,
    output reg [3:0] age,
    output reg [7:0] rto
    );

    always @ ( * ) begin
        case (hrdn)
            'h0: begin
                age <= 4'd14;
                rto <= 42;
            end
            'h1: begin
                age <= 4'd11;
                rto <= 62;
            end
            'h2: begin
                age <= 4'd09;
                rto <= 76;
            end
            'h3: begin
                age <= 4'd07;
                rto <= 87;
            end
            'h4: begin
                age <= 4'd06;
                rto <= 93;
            end
            'h5: begin
                age <= 4'd05;
                rto <= 96;
            end
            'h6: begin
                age <= 4'd04;
                rto <= 93;
            end
            'h7: begin
                age <= 4'd04;
                rto <= 87;
            end
            'h8: begin
                age <= 4'd03;
                rto <= 76;
            end
            'h9: begin
                age <= 4'd03;
                rto <= 61;
            end
            'hA: begin
                age <= 4'd02;
                rto <= 93;
            end
            default: begin
                age <= 4'b0111;
                rto <= 70;
            end
        endcase
    end
endmodule // wam_par

`timescale 1ns / 1ps



module wam_main1(
    input  wire clk,        // clock (50MHz)
    input  wire clr,        // button - clear
    input  wire lft,        // button - left
    input  wire rgt,        // button - right
    input  wire pse,        // button - pause
    input  wire [7:0] sw,   // switch
    output [6:0]hardness,
	 output [6:0]seg7_dig0,
    output [6:0]seg7_dig1,
    output wire [7:0] ld,    // LED
    
	output [9:0]VGA_Rb, 
    output [9:0]VGA_Gb,
    output [9:0]VGA_Bb,
    output VGA_HSb,
    output VGA_VSb,
    output VGA_BLANKb,
    output VGA_SYNCb,
    output VGA_CLKb
	 );
	 

	 reg  [31:0] clk_cnt;    // clock count
    wire clk_16;            // clock at 2^16 (800Hz)
    reg  clk_19;            // clock at 2^19 (100Hz)
    reg  pse_flg;           // pause flag

    wire cout0;             // carry signal
    wire lstn;              // digital tube last signal

    wire [3:0]  hrdn;       // hardness of 0~9
    wire [7:0]  holes;      // 8 holes idicating have moles or not
    wire [7:0]  tap;        // 8 switch hit input
    wire [7:0]  hit;        // 8 successful hit
    wire [11:0] score;      // score

    // handle clock
    always @(posedge clk) 
	 begin
        if(clr)          // DO NOT clear main clock as it is seed of randomizer
             clk_cnt = 0;
        else 
		  begin
        clk_cnt = clk_cnt + 1;
        if(clk_cnt[31:28]>15)
           clk_cnt = 0;
		  end
	 end

    assign clk_16 = clk_cnt[16];

    // handle pause for clk_19
    always @ (posedge pse) begin
        pse_flg = ~pse_flg;
    end

    always @ (posedge clk) begin
        if (!pse_flg)
            clk_19 = clk_cnt[19];
    end

	 // generate VGA Background
	 projectVGA background(clk, 1'b1, 1'b1, holes, VGA_Rb, VGA_Gb, VGA_Bb, VGA_HSb, VGA_VSb, VGA_BLANKb, VGA_SYNCb, VGA_CLKb);
	
	 
	 // generate moles
    wam_gen sub_gen( .clk_19(clk_19), .clr(clr), .clk_cnt(clk_cnt), .hit(hit), .hrdn(hrdn), .holes(holes) );
    wam_hrd sub_hrd( .clk_19(clk_19), .clr(clr), .lft(lft), .rgt(rgt), .cout0(cout0), .hrdn(hrdn) );

    // handle input tap
    wam_tap sub_tap( .clk_19(clk_19), .sw(sw), .tap(tap) );
    wam_hit sub_hit( .clk_19(clk_19), .tap(tap), .holes(holes), .hit(hit) );

    // handle score count
    wam_scr sub_scr( .clk(clk), .clr(clr), .hit(hit), .num(score), .cout0(cout0) );

    // handle display on digital tube
    wam_led sub_led( .holes(holes), .ld(ld) );
    wam_lst sub_lst( .clk_19(clk_19), .tap(tap), .lft(lft), .rgt(rgt), .cout0(cout0), .lstn(lstn) );
    //wam_dis sub_dis( .clk_16(clk_16), .hrdn(hrdn), .score(score), .lstn(lstn), .an(an), .a2g(a2g) );
	 wam_dis sub_dis(
	 .score(score), 
	 .hrdn(hrdn), 
	 .hardness(hardness),  
	 .seg7_dig0(seg7_dig0), 
	 .seg7_dig1(seg7_dig1));
endmodule

// Score count
//
// by nyLiao, April, 2019

module wam_cnt(             // 1-bit 0-to-9 counter
    input wire clr,
    input wire cin,
    output reg cout,        // carry bit
    output reg [3:0] num    // DEC number in BCD
    );

    always @(posedge cin or posedge clr) begin
        if (clr)
            begin
                num <= 0;
            end
        else
            begin
                if (num < 9)
                    begin
                        num <= num + 1;
                        cout <= 0;
                    end
                else
                    begin
                        num <= 0;
                        cout <= 1;
                    end
            end
    end
endmodule // wam_cnt

module wam_scr(             // score count
    input wire clk,         // synchronize clock
    input wire clr,
    input wire [7:0] hit,
    output reg [11:0] num,
    output wire cout0       // carry bit on 10s is a hardness control signal
    );

    wire [11:0] cnum;       // counter number register
    wire cout1, cout2;      // carry bits as trigger of next counter
    wire scr;

    assign scr = hit[0] | hit[1] | hit[2] | hit[3] | hit[4] | hit[5] | hit[6] | hit[7];

    wam_cnt cnt0( .clr(clr), .cin(scr), .cout(cout0), .num(cnum[3:0]) );
    wam_cnt cnt1( .clr(clr), .cin(cout0), .cout(cout1), .num(cnum[7:4]) );
    wam_cnt cnt2( .clr(clr), .cin(cout1), .cout(cout2), .num(cnum[11:8]) );

    always @(posedge clk) begin
        num <= cnum;        // synchronize clock
    end
endmodule // wam_scr