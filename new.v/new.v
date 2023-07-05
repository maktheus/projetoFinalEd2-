module ScoreDecoder(in, Hex2, Hex1);
input [4:0]in;
output reg [6:0] Hex2,Hex1;

	parameter zero = 7'b1000000;
	parameter one = 7'b1111001;
	parameter two = 7'b0100100;
	parameter three = 7'b0110000;
	parameter four = 7'b0011001;
	parameter five = 7'b0010010;
	parameter six = 7'b0000010;
	parameter seven = 7'b1111000;
	parameter eight = 7'b0000000;
	parameter nine = 7'b0011000;
		
	parameter blank = 7'b1111111;
	
	always@(*) begin
	case(in)
		0:		begin
				Hex1 <= zero;
				Hex2 <= blank;
				end
		1:		begin
				Hex1 <= one;
				Hex2 <= blank;
				end
		2:		begin
				Hex1 <= two;
				Hex2 <= blank;
				end
		3:		begin
				Hex1 <= three;
				Hex2 <= blank;
				end
		4:		begin
				Hex1 <= four;
				Hex2 <= blank;
				end
		5:		begin
				Hex1 <= five;
				Hex2 <= blank;
				end
		6:		begin
				Hex1 <= six;
				Hex2 <= blank;
				end
		7:		begin
				Hex1 <= seven;
				Hex2 <= blank;
				end
		8:		begin
				Hex1 <= eight;
				Hex2 <= blank;
				end
		9:		begin
				Hex1 <= nine;
				Hex2 <= blank;
				end
		10:	begin
				Hex1 <= zero;
				Hex2 <= one;
				end
		11:	begin
				Hex1 <= one;
				Hex2 <= one;
				end
		12:	begin
				Hex1 <= two;
				Hex2 <= one;
				end
		13:	begin
				Hex1 <= three;
				Hex2 <= one;
				end
		14:	begin
				Hex1 <= four;
				Hex2 <= one;
				end
		15:	begin
				Hex1 <= five;
				Hex2 <= one;
				end
	endcase
	end
	
endmodule
	

	// This is a controller written for a VGA Monitor with resolution 1280 by 1024 with an refresh rate of 60 fps
// VGA Controller use to generate signals for the monitor 
module VGAController (PixelClock,
							 inRed,
							 inGreen,
							 inBlue,
							 outRed,
							 outGreen,
							 outBlue,
							 VertSynchOut,
							 HorSynchOut,
							 XPosition,
							 YPosition);
//======================================================= 
// Parameter Declarations 				
//=======================================================
// Parameters are set for a 1280 by 1024 pixel monitor running at 60 frames per second
// X Screen Constants	 
parameter XLimit = 1688;
parameter XVisible = 1280;
parameter XSynchPulse = 112;
parameter XBackPorch = 248;
// Y Screen Constants
parameter YLimit = 1066;
parameter YVisible = 1024;
parameter YSynchPulse = 3;
parameter YBackPorch = 38;

//=======================================================			 
// Port Declarations 				
//=======================================================
input PixelClock;
input [7:0] inRed;
input [7:0] inGreen;
input [7:0] inBlue;
output [7:0] outRed;
output [7:0] outGreen;
output [7:0] outBlue;
output VertSynchOut;
output HorSynchOut;
output [10:0] XPosition;
output [10:0] YPosition;

//========================================================
// REG/WIRE declarations
//========================================================

reg [10:0] XTiming;
reg [10:0] YTiming;
reg HorSynch;
reg VertSynch;

//========================================================
// Structural coding
//========================================================
assign XPosition = XTiming - (XSynchPulse + XBackPorch);
assign YPosition = YTiming - (YSynchPulse + YBackPorch);


always@(posedge PixelClock)// Control X Timing
begin
	if (XTiming >= XLimit)
		XTiming <= 11'd0;
	else
		XTiming <= XTiming + 1;
end
	
always@(posedge PixelClock)// Control Y Timing
begin
	if (YTiming >= YLimit && XTiming >= XLimit)
		YTiming <= 11'd0;
	else if (XTiming >= XLimit && YTiming < YLimit)
		YTiming <= YTiming + 1;
	else
		YTiming <= YTiming;
end

always@(posedge PixelClock)// Control Vertical Synch Signal
begin
	if (YTiming >= 0 && YTiming < YSynchPulse)
		VertSynch <= 1'b0;
	else
		VertSynch <= 1'b1;
end
	
always@(posedge PixelClock)// Control Horizontal Synch Signal
begin
	if (XTiming >= 0 && XTiming < XSynchPulse)
		HorSynch <= 1'b0;
	else
		HorSynch <= 1'b1;
end
	
// Draw black in off screen areas of screen
assign outRed = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inRed : 8'b0;
assign outGreen = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inGreen : 8'b0;
assign outBlue = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inBlue : 8'b0;

assign VertSynchOut = VertSynch;
assign HorSynchOut = HorSynch;


// Initialization registers block
initial
begin
	XTiming = 11'b0;
	YTiming = 11'b0;
	HorSynch = 1'b1;
	VertSynch = 1'b1;
end
	
	
endmodule

// Note: This code is written to support monitor display resolutions of 1280 x 1024 at 60 fps

// (DETAILS OF THE MODULES)
// VGAInterface.v is the top most level module and asserts the red/green/blue signals to draw to the computer screen
// VGAController.v is a submodule within the top module used to generate the vertical and horizontal synch signals as well as X and Y pixel positions
// VGAFrequency.v is a submodule within the top module used to generate a 108Mhz pixel clock frequency from a 50Mhz pixel clock frequency using the PLL

// (USER/CODER Notes) 
// Note: User should modify/write code in the VGAInterface.v file and not modify any code written in VGAController.v or VGAFrequency.v

module DE2_115(

	//////////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,

	//////////// LED //////////
	LEDG,
	LEDR,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,

	//////////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS 
);

//////////// CLOCK //////////
input		          		CLOCK_50;
input		          		CLOCK2_50;
input		          		CLOCK3_50;

//////////// LED //////////
output		     [8:0]		LEDG;
output		    [17:0]		LEDR;

//////////// KEY //////////
input		     [3:0]		KEY;

//////////// SW //////////
input		    [17:0]		SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0;
output		     [6:0]		HEX1;
output		     [6:0]		HEX2;
output		     [6:0]		HEX3;
output		     [6:0]		HEX4;
output		     [6:0]		HEX5;
output		     [6:0]		HEX6;
output		     [6:0]		HEX7;

//////////// VGA //////////
output		     [7:0]		VGA_B;
output		          		VGA_BLANK_N;
output		          		VGA_CLK;
output		     [7:0]		VGA_G;
output		          		VGA_HS;
output		     [7:0]		VGA_R;
output		          		VGA_SYNC_N;
output		          		VGA_VS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg	aresetPll = 0; // asynchrous reset for pll
wire 	pixelClock;
wire	[10:0] XPixelPosition;
wire	[10:0] YPixelPosition; 
reg	[7:0] redValue;
reg	[7:0] greenValue;
reg	[7:0] blueValue;

reg	[1:0] movement = 0;
parameter r = 15;

// slow clock counter variables
reg 	[20:0] slowClockCounter = 0;
wire 	slowClock;

// fast clock counter variables
reg 	[20:0] fastClockCounter = 0;
wire 	fastClock;

// variables for the dot 
reg	[10:0] XDotPosition = 500;
reg	[10:0] YDotPosition = 500; 

// variables for paddle 1 
reg	[10:0] P1x = 225;
reg	[10:0] P1y = 500;

// variables for paddle 2
reg	[10:0] P2x = 1030;
reg	[10:0] P2y = 500;

// variables for player scores
reg 	[3:0] P1Score = 0;
reg		[3:0] P2Score = 0;
reg 	flag =1'b0;



//=======================================================
//  Structural coding
//=======================================================

// output assignments
assign VGA_BLANK_N = 1'b1;
assign VGA_SYNC_N = 1'b1;			
assign VGA_CLK = pixelClock;

// display the X or Y position of the dot on LEDS (Binary format)
// MSB is LEDR[10], LSB is LEDR[0]
assign LEDR[10:0] = SW[1] ? YDotPosition : XDotPosition; 



assign slowClock = slowClockCounter[16]; // take MSB from counter to use as a slow clock

always@ (posedge CLOCK_50) // generates a slow clock by selecting the MSB from a large counter
begin
	slowClockCounter <= slowClockCounter + 1;
end

assign fastClock = fastClockCounter[17]; // take Middle Bit from counter to use as a slow clock

always@ (posedge CLOCK_50) // generates a fast clock by selecting the Middle Bit from a large counter
begin
	fastClockCounter <= fastClockCounter + 1;
end
//Velocidade de movimento do paddle
always@(posedge fastClock) // process moves the y position of player1 paddle
begin
if (SW[0] == 1'b0) 
begin
	if (KEY[2] == 1'b0 && KEY[3] == 1'b0) 
		P1y <= P1y;
	else if (KEY[2] == 1'b0) begin
		if (P1y+125 >896)
			P1y <= 771;
		else
		P1y <= P1y + 3;
		end
	else if (KEY[3] == 1'b0) begin
		if(P1y < 128)
			P1y <= 128;
		else
		P1y <= P1y - 3;
		end
end
else if (SW[0] == 1'b1 || flag==1)
P1y <= 500;
//flag =1'b0;
end

always@(posedge fastClock) // process moves the y position of player2 paddle
begin
if (SW[0] == 1'b0) 
begin
	if (KEY[0] == 1'b0 && KEY[1] == 1'b0) 
		P2y <= P2y;
	else if (KEY[0] == 1'b0) begin
		if(P2y+125 > 896)
			P2y <= 771;
		else
		P2y <= P2y + 3;
		end
	else if (KEY[1] == 1'b0) begin
		if(P2y < 128)
			P2y <= 128;
		else
		P2y <= P2y - 3;
		end
end
else if (SW[0] == 1'b1 || flag ==1)
	P2y <= 500;
end

always@(posedge slowClock) // Moves Ball
begin
if (SW[0] == 1'b0)
	begin
	case(movement)
		0:		begin //Ball moves in NE direction
				XDotPosition <= XDotPosition + 1;
				YDotPosition <= YDotPosition - 1;
				end
		1:		begin //Ball moves in SE direction
				XDotPosition <= XDotPosition + 1;
				YDotPosition <= YDotPosition + 1;
				end
		2:		begin //Ball moves in SW direction
				XDotPosition <= XDotPosition - 1;
				YDotPosition <= YDotPosition + 1;
				end
		3:		begin //Ball moves in NW direction
				XDotPosition <= XDotPosition - 1;
				YDotPosition <= YDotPosition - 1;
				end
	endcase
	
	if(YDotPosition - r <= 128 && movement == 0) //bounce top wall from NE
		movement = 1;
	else if (YDotPosition - r <= 128 && movement == 3)// bounce top wall from NW
		movement = 2;
	else if (YDotPosition + r >= 896 && movement == 1)	// bounce bottom wall from SE
		movement = 0;
	else if (YDotPosition + r >= 896 && movement == 2) // bounce bottom wall from Sw
		movement = 3;
	else if (XDotPosition -r <= P1x+25 && YDotPosition > P1y && YDotPosition < P1y+125 &&  movement == 2)//bounce left paddle from SW
		movement = 1;
	else if (XDotPosition -r<= P1x+25 && YDotPosition > P1y && YDotPosition < P1y+125 &&  movement == 3)//bounce left paddle from NW
		movement = 0;
	else if (XDotPosition + r >= P2x && YDotPosition > P2y && YDotPosition < P2y+125 &&  movement == 1)//bounce right paddle from SE 
		movement = 2;
	else if (XDotPosition + r >= P2x && YDotPosition > P2y && YDotPosition < P2y+125 &&  movement == 0)//bounce right paddle from NE
		movement = 3;
	else if (XDotPosition - r <= 160) begin
		P2Score = P2Score + 1;
		//reset ball
		XDotPosition <= 640;
		YDotPosition <= 512;
		end
	else if (XDotPosition + r >= 1120)begin
		P1Score = P1Score + 1;
		//reset ball
		XDotPosition <= 640;
		YDotPosition <= 512;
		end
		
		if(P1Score == 10 || P2Score ==10) begin
			P1Score<=0;
			P2Score<=0;
			flag <=1;
			end
end
else //reset ball and score
	begin
	XDotPosition <= 500;
	YDotPosition <= 500;
	P1Score <= 0;
	P2Score <= 0;
	end
	
end


// PLL Module (Phase Locked Loop) used to convert a 50Mhz clock signal to a 108 MHz clock signal for the pixel clock
VGAFrequency VGAFreq (aresetPll, CLOCK_50, pixelClock);

// VGA Controller Module used to generate the vertial and horizontal synch signals for the monitor and the X and Y Pixel position of the monitor display
VGAController VGAControl (pixelClock, redValue, greenValue, blueValue, VGA_R, VGA_G, VGA_B, VGA_VS, VGA_HS, XPixelPosition, YPixelPosition);


// COLOR ASSIGNMENT PROCESS (USER WRITES CODE HERE TO DRAW TO SCREEN)
always@ (posedge pixelClock)
begin		
	begin
		if (XPixelPosition < 160) //set left green border
		begin
			redValue <= 8'b11111111; 
			blueValue <= 8'b11111111;
			greenValue <= 8'b11111111;
		end
		else if (XPixelPosition > 1120) // set right green border
		begin
			redValue <= 8'b11111111; 
			blueValue <= 8'b11111111;
			greenValue <= 8'b11111111;
		end

		else if (YPixelPosition < 128 && XPixelPosition > 150 && XPixelPosition < 1420) begin //set top magenta border
			
			if(XPixelPosition > 170 && XPixelPosition < 200) begin // draw a U in the top
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end
			else if(XPixelPosition > 220 && XPixelPosition < 250) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end
			else if(XPixelPosition > 170 && XPixelPosition < 250 && YPixelPosition < 128 &&  YPixelPosition > 90) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end
			else if(XPixelPosition > 280 && XPixelPosition < 310) begin // draw a F in the top
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end

			else if(XPixelPosition > 300 && XPixelPosition < 340 && YPixelPosition <30) begin 
			
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end

			else if(XPixelPosition > 300 && XPixelPosition < 340 && YPixelPosition > 50 && YPixelPosition < 80 ) begin 
			
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end

			//draw an A
			else if(XPixelPosition > 370 && XPixelPosition < 400) begin
				redValue <= 8'b11111111;
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end
			else if(XPixelPosition > 430 && XPixelPosition <460) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end

			else if(XPixelPosition > 370 && XPixelPosition <460 &&  YPixelPosition < 30) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end

			else if(XPixelPosition > 370 && XPixelPosition <460  && YPixelPosition > 50 && YPixelPosition < 80 ) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end

			//draw an M
			else if(XPixelPosition > 490 && XPixelPosition < 520) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end
			else if(XPixelPosition > 550 && XPixelPosition < 580) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end
			// primeira metade do 'V' invertido
			else if(XPixelPosition > 520 && XPixelPosition < 535 && YPixelPosition > 30 && YPixelPosition < (30 + XPixelPosition - 520)) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end

			// segunda metade do 'V' invertido
			else if(XPixelPosition >= 535 && XPixelPosition < 550 && YPixelPosition > 30 && YPixelPosition < (80 - (XPixelPosition - 535))) begin
				redValue <= 8'b11111111; 
				blueValue <= 8'b00000000;
				greenValue <= 8'b11111111;
			end


			else begin	
				redValue <= 8'b11111111; 
				blueValue <= 8'b11111111;
				greenValue <= 8'b11111111;
					
			end
		end
		else if (XPixelPosition < 1420 && XPixelPosition > 150 && YPixelPosition > 896) // set bottom magenta border
		begin
			redValue <= 8'b11111111; 
			blueValue <= 8'b11111111;
			greenValue <= 8'b11111111;
		end

		else if (XPixelPosition > P1x && XPixelPosition < P1x+25 && YPixelPosition > P1y && YPixelPosition < P1y+125) // draw player 1 paddle
		begin
			redValue <= 8'b11111111; 
			blueValue <= 8'b111111111;
			greenValue <= 8'b11111111;
		end
		else if (XPixelPosition > P2x && XPixelPosition < P2x+25 && YPixelPosition > P2y && YPixelPosition < P2y+125) // draw player 2 paddle
		begin
			redValue <= 8'b11111111; 
			blueValue <= 8'b11111111;
			greenValue <= 8'b11111111;
		end
		//draw ball using (x-a)^2 + (y-b)^2 = r^2 where (a,b) is the center of the circle and r = 15
		//a = XDotPosition, b = YDotPosition
		else if (((XPixelPosition-XDotPosition)**2 
						+ (YPixelPosition-YDotPosition)**2) < 15**2) 
		begin
			redValue <= 8'b11111111; 
			blueValue <= 8'b11111111;
			greenValue <= 8'b11111111;
		end
		//draw a U in the top

		else // default background is black
		begin
			redValue <= 8'b00000000; 
			blueValue <= 8'b00000000;
			greenValue <= 8'b00000000;
		end
	end
end

ScoreDecoder p1(P1Score, HEX7, HEX6);
ScoreDecoder p2(P2Score, HEX5, HEX4);

endmodule


module VGAFrequency (
	areset,
	inclk0,
	c0);

	input	  areset;
	input	  inclk0;
	output	  c0;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [0:0] sub_wire2 = 1'h0;
	wire [4:0] sub_wire3;
	wire  sub_wire0 = inclk0;
	wire [1:0] sub_wire1 = {sub_wire2, sub_wire0};
	wire [0:0] sub_wire4 = sub_wire3[0:0];
	wire  c0 = sub_wire4;

	altpll	altpll_component (
				.areset (areset),
				.inclk (sub_wire1),
				.clk (sub_wire3),
				.activeclock (),
				.clkbad (),
				.clkena ({6{1'b1}}),
				.clkloss (),
				.clkswitch (1'b0),
				.configupdate (1'b0),
				.enable0 (),
				.enable1 (),
				.extclk (),
				.extclkena ({4{1'b1}}),
				.fbin (1'b1),
				.fbmimicbidir (),
				.fbout (),
				.fref (),
				.icdrclk (),
				.locked (),
				.pfdena (1'b1),
				.phasecounterselect ({4{1'b1}}),
				.phasedone (),
				.phasestep (1'b1),
				.phaseupdown (1'b1),
				.pllena (1'b1),
				.scanaclr (1'b0),
				.scanclk (1'b0),
				.scanclkena (1'b1),
				.scandata (1'b0),
				.scandataout (),
				.scandone (),
				.scanread (1'b0),
				.scanwrite (1'b0),
				.sclkout0 (),
				.sclkout1 (),
				.vcooverrange (),
				.vcounderrange ());
	defparam
		altpll_component.bandwidth_type = "AUTO",
		altpll_component.clk0_divide_by = 25,
		altpll_component.clk0_duty_cycle = 50,
		altpll_component.clk0_multiply_by = 54,
		altpll_component.clk0_phase_shift = "0",
		altpll_component.compensate_clock = "CLK0",
		altpll_component.inclk0_input_frequency = 20000,
		altpll_component.intended_device_family = "Cyclone IV E",
		altpll_component.lpm_hint = "CBX_MODULE_PREFIX=VGAFrequency",
		altpll_component.lpm_type = "altpll",
		altpll_component.operation_mode = "NORMAL",
		altpll_component.pll_type = "AUTO",
		altpll_component.port_activeclock = "PORT_UNUSED",
		altpll_component.port_areset = "PORT_USED",
		altpll_component.port_clkbad0 = "PORT_UNUSED",
		altpll_component.port_clkbad1 = "PORT_UNUSED",
		altpll_component.port_clkloss = "PORT_UNUSED",
		altpll_component.port_clkswitch = "PORT_UNUSED",
		altpll_component.port_configupdate = "PORT_UNUSED",
		altpll_component.port_fbin = "PORT_UNUSED",
		altpll_component.port_inclk0 = "PORT_USED",
		altpll_component.port_inclk1 = "PORT_UNUSED",
		altpll_component.port_locked = "PORT_UNUSED",
		altpll_component.port_pfdena = "PORT_UNUSED",
		altpll_component.port_phasecounterselect = "PORT_UNUSED",
		altpll_component.port_phasedone = "PORT_UNUSED",
		altpll_component.port_phasestep = "PORT_UNUSED",
		altpll_component.port_phaseupdown = "PORT_UNUSED",
		altpll_component.port_pllena = "PORT_UNUSED",
		altpll_component.port_scanaclr = "PORT_UNUSED",
		altpll_component.port_scanclk = "PORT_UNUSED",
		altpll_component.port_scanclkena = "PORT_UNUSED",
		altpll_component.port_scandata = "PORT_UNUSED",
		altpll_component.port_scandataout = "PORT_UNUSED",
		altpll_component.port_scandone = "PORT_UNUSED",
		altpll_component.port_scanread = "PORT_UNUSED",
		altpll_component.port_scanwrite = "PORT_UNUSED",
		altpll_component.port_clk0 = "PORT_USED",
		altpll_component.port_clk1 = "PORT_UNUSED",
		altpll_component.port_clk2 = "PORT_UNUSED",
		altpll_component.port_clk3 = "PORT_UNUSED",
		altpll_component.port_clk4 = "PORT_UNUSED",
		altpll_component.port_clk5 = "PORT_UNUSED",
		altpll_component.port_clkena0 = "PORT_UNUSED",
		altpll_component.port_clkena1 = "PORT_UNUSED",
		altpll_component.port_clkena2 = "PORT_UNUSED",
		altpll_component.port_clkena3 = "PORT_UNUSED",
		altpll_component.port_clkena4 = "PORT_UNUSED",
		altpll_component.port_clkena5 = "PORT_UNUSED",
		altpll_component.port_extclk0 = "PORT_UNUSED",
		altpll_component.port_extclk1 = "PORT_UNUSED",
		altpll_component.port_extclk2 = "PORT_UNUSED",
		altpll_component.port_extclk3 = "PORT_UNUSED",
		altpll_component.width_clock = 5;
endmodule
