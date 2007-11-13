;Written by Iain McCurdy, 2006

<CsoundSynthesizer>

<CsOptions>
-+rtaudio=PortAudio -b4096
</CsOptions>


<CsInstruments>

sr 		= 	44100	;SAMPLE RATE
kr 		= 	441	;CONTROL RATE
ksmps 		= 	100	;NUMBER OF AUDIO SAMPLES IN EACH CONTROL CYCLE
nchnls 		= 	2	;NUMBER OF CHANNELS (2=STEREO)


;FLTK INTERFACE CODE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			LABEL  | WIDTH | HEIGHT | X | Y
		FLpanel	"pvoc",   500,    400,    0,  0

;BUTTONS                                            	ON | OFF | TYPE | WIDTH | HEIGHT | X | Y | OPCODE | INS | STARTTIM | DUR
gkOnOff,ihOnOff		FLbutton	"On/Off",	1,   -1,     2,    150,     30,    0,  0,    0,      2,      0,       -1
gkspec, ihskip 		FLbutton  	"Spec. Env", 	1,    0,     2,    150,     30,  350,  0,   -1


;VALUE_DISPLAY_BOXES			 	WIDTH | HEIGHT | X | Y
idpch				FLvalue	" ",     80,     20,     0, 100
idptr				FLvalue	" ",     80,     20,     0, 150
idspeed				FLvalue	" ",     80,     20,     0, 200

;SLIDERS					          						MIN |  MAX | EXP | TYPE | DISP  | WIDTH | HEIGHT | X | Y
gkpch,ihpch			FLslider 	"Pitch (Portamento Applied)",				.5,     2,   -1,    5,   idpch,    500,     30,    0,  70
gkptr,ihptr			FLslider 	"Pointer (Portamento Applied) (Pointer Mode Only)",	0,      1,    0,    5,   idptr,    500,     30,    0, 120
gkspeed,ihspeed			FLslider 	"Speed (Speed Control Mode Only)",			-5,     5,    0,    5,   idspeed,  500,     30,    0, 170
gkporttime,ihporttime		FLslider 	"Portamento Amount",					0,      1,    0,    5,   -1,       150,     10,  350,  40

;COUNTERS											MIN | MAX | STEP1 | STEP2 | TYPE | WIDTH | HEIGHT | X |  Y  | OPCODE
gkptrswitch, ihptrswitch	FLcount  "Pointer Switch: 0=Pointer 1=Speed Control", 		0,     1,     1,      1,      2,    200,     30,   150,   0,    -1
gkextractmode, ihextractmode	FLcount  "Extract Mode: 0=off 1=>Freq.Lim. 2=<Freq.Lim.",	0,     2,     1,      1,      2,    166,     30,     0, 230,    -1
gkfreqlim, ihfreqlim		FLcount  "Frequency Limit",					0,    20,     1,     20,      1,    166,     30,   166, 230,    -1
gkgatefn, ihgatefn		FLcount  "Gating Function (0=off)",				0,     2,     1,      1,      2,    167,     30,   332, 230,    -1
gkfile, ihfile			FLcount  "Analysis File: 1=Voice 2=Drums",			1,     2,     1,      1,      2,    150,     30,     0, 330,    -1

;TEXT BOXES															TYPE | FONT | SIZE | WIDTH | HEIGHT | X  | Y
ih		 	FLbox  	"Gating functions: 0=off 1=Amplitudes below 50% attenuated 2=Amplitude spectrum inverted", 	1,      1,     12,    500,     20,    0,  310

;SET_INITIAL_VALUES		VALUE | HANDLE
		FLsetVal_i	1, 	ihpch
		FLsetVal_i	.5, 	ihptr
		FLsetVal_i	-1, 	ihOnOff
		FLsetVal_i	0, 	ihptrswitch
		FLsetVal_i	1, 	ihspeed
		FLsetVal_i	0, 	ihextractmode
		FLsetVal_i	0, 	ihfreqlim
		FLsetVal_i	0, 	ihgatefn
		FLsetVal_i	1, 	ihfile
		FLsetVal_i	.5, 	ihporttime

		FLpanel_end	;END OF PANEL CONTENTS

;INSTRUCTIONS AND INFO PANEL
				FLpanel	" ", 515, 700, 512, 0
				FLscroll     515, 700, 0, 0

;TEXT BOXES												TYPE | FONT | SIZE | WIDTH | HEIGHT | X | Y
ih		 	FLbox  	"                            pvoc                             ", 	1,      5,     14,    490,    15,     5,  0
ih		 	FLbox  	"-------------------------------------------------------------", 	1,      5,     14,    490,    15,     5,  20
ih		 	FLbox  	"Pvoc performs FFT resynthesis on a analysis data file that   ", 	1,      5,     14,    490,    15,     5,  40
ih		 	FLbox  	"has been previously created using the pvanal utility that    ", 	1,      5,     14,    490,    15,     5,  60
ih		 	FLbox  	"comes with Csound. (This example uses a pre-prepared analysis", 	1,      5,     14,    490,    15,     5,  80
ih		 	FLbox  	"file but you are encouraged to replace it with one of your   ", 	1,      5,     14,    490,    15,     5, 100
ih		 	FLbox  	"own.)                                                        ", 	1,      5,     14,    490,    15,     5, 120
ih		 	FLbox  	"The input arguments required by the opcode include one for   ", 	1,      5,     14,    490,    15,     5, 140
ih		 	FLbox  	"pitch ratio between the resynthesized sound and the original ", 	1,      5,     14,    490,    15,     5, 160
ih		 	FLbox  	"sound, and an argument for time location within the analysis ", 	1,      5,     14,    490,    15,     5, 180
ih		 	FLbox  	"file from which to resynthesise.                             ", 	1,      5,     14,    490,    15,     5, 200
ih		 	FLbox  	"This example offers two ways in which to control the time    ", 	1,      5,     14,    490,    15,     5, 220
ih		 	FLbox  	"location variable according to how the 'Pointer Switch' is   ", 	1,      5,     14,    490,    15,     5, 240
ih		 	FLbox  	"counter is set. When on 'Pointer' mode the 'Pointer' slider  ", 	1,      5,     14,    490,    15,     5, 260
ih		 	FLbox  	"is simply used to move the variable ('Speed Control' slider  ", 	1,      5,     14,    490,    15,     5, 280
ih		 	FLbox  	"is ignored). When 'Pointer Switch' is set to 'Speed Control' ", 	1,      5,     14,    490,    15,     5, 300
ih		 	FLbox  	"then the 'Speed Control' slider is used to control the speed ", 	1,      5,     14,    490,    15,     5, 320
ih		 	FLbox  	"of the movement (and direction) of the pointer through the   ", 	1,      5,     14,    490,    15,     5, 340
ih		 	FLbox  	"analysis file. This value is given as a ratio between the    ", 	1,      5,     14,    490,    15,     5, 360
ih		 	FLbox  	"resynthesized sound to the original sound. In this mode      ", 	1,      5,     14,    490,    15,     5, 380
ih		 	FLbox  	"'Pointer' slider is ignored. Optional arguments are also used", 	1,      5,     14,    490,    15,     5, 400
ih		 	FLbox  	"in this example. When 'Spec. Env.' (spectral enveloping) is  ", 	1,      5,     14,    490,    15,     5, 420
ih		 	FLbox  	"on the opcode attempts to preserve the spectral envelope of  ", 	1,      5,     14,    490,    15,     5, 440
ih		 	FLbox  	"the original sound. The audible upshot of this is most       ", 	1,      5,     14,    490,    15,     5, 460
ih		 	FLbox  	"clearly heard when resynthesizing speech in which            ", 	1,      5,     14,    490,    15,     5, 480
ih		 	FLbox  	"transpositions up or down are heard as the person speaking   ", 	1,      5,     14,    490,    15,     5, 500
ih		 	FLbox  	"higher or lower rather than as a complete transformation of  ", 	1,      5,     14,    490,    15,     5, 520
ih		 	FLbox  	"the character of the voice.                                  ", 	1,      5,     14,    490,    15,     5, 540
ih		 	FLbox  	"'Extract Mode' and 'Frequency Limit' are used in combination ", 	1,      5,     14,    490,    15,     5, 560
ih		 	FLbox  	"and can be set to filter either resonant components of the   ", 	1,      5,     14,    490,    15,     5, 580
ih		 	FLbox  	"sound or noise based components of the sound. If 'Extract    ", 	1,      5,     14,    490,    15,     5, 600
ih		 	FLbox  	"Mode' is set to '1' (greater than frequency limit) and       ", 	1,      5,     14,    490,    15,     5, 620
ih		 	FLbox  	"'Frequency Limit' is given a value grater than zero then     ", 	1,      5,     14,    490,    15,     5, 640
ih		 	FLbox  	"noise aspects of the sound are favoured in the resynthesis   ", 	1,      5,     14,    490,    15,     5, 660
ih		 	FLbox  	"and if 'Frequency Limit' is set to '2' (less than frequency  ", 	1,      5,     14,    490,    15,     5, 680
ih		 	FLbox  	"limit) and 'Frequency Limit' is given a value greater than   ", 	1,      5,     14,    490,    15,     5, 700
ih		 	FLbox  	"zero then resonant aspects of the sound will be favoured.    ", 	1,      5,     14,    490,    15,     5, 720
ih		 	FLbox  	"Using a gating function (table) allows spectrally informed   ", 	1,      5,     14,    490,    15,     5, 740
ih		 	FLbox  	"dynamic modification of the sound (akin to a complex multi-  ", 	1,      5,     14,    490,    15,     5, 760
ih		 	FLbox  	"-band compressor). Two function shapes are offered by this   ", 	1,      5,     14,    490,    15,     5, 780
ih		 	FLbox  	"example.                                                     ", 	1,      5,     14,    490,    15,     5, 800
				FLscrollEnd
				FLpanel_end

				FLrun	;RUN THE FLTK WIDGET THREAD
;END OF FLTK INTERFACE CODE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		instr		1	;(ALWAYS ON - SEE SCORE) PLAYS FILE AND SENSES FADER MOVEMENT AND RESTARTS INSTR 2 FOR I-RATE CONTROLLERS
kSwitch		changed		gkspec, gkptrswitch, gkextractmode, gkfreqlim, gkgatefn, gkfile	;GENERATE A MOMENTARY '1' PULSE IN OUTPUT 'kSwitch' IF ANY OF THE SCANNED INPUT VARIABLES CHANGE. (OUTPUT 'kSwitch' IS NORMALLY ZERO)
;				ITRIGGER | IMINTIM | IMAXNUM | IINSNUM | IWHEN | IDUR (-1 MEANS A NOTE OF INFINITE DURATION)
		schedkwhen	kSwitch,      0,        0,        2,        0,    -1	;RESTART INSTRUMENT 2 WITH A SUSTAINED (HELD) NOTE WHENEVER kSwitch=1
		endin

		instr 		2	;pvoc INSTRUMENT
if gkOnOff!=-1	kgoto		CONTINUE	;SENSE FLTK ON/OFF SWITCH
		turnoff				;TURN THIS INSTRUMENT OFF IMMEDIATELY
CONTINUE:
#define  	AnalysisFile1 	#AndItsAll.pvx#		;DEFINE A TEXT MACRO FOR THE .pvx FILE USED. THIS SAVES HAVING TO RE-TYPE SEVERAL TIMES WHENEVER WORKING WITH A DIFFERENT FILE.
#define  	AnalysisFile2 	#808loopMono.pvx#	;DEFINE A TEXT MACRO FOR THE .pvx FILE USED. THIS SAVES HAVING TO RE-TYPE SEVERAL TIMES WHENEVER WORKING WITH A DIFFERENT FILE.
iporttime	=		.1			;DEFINE A VALUE FOR PORTAMENTO TIME (THIS WILL BE USED TO SMOOTH FLTK SLIDER MOVEMENTS) 
kporttime	linseg		0, .001, iporttime, 1, iporttime	;DEFINE A RAMPING UP, K-RATE FUNCTION THAT WILL BE USED FOR PORTAMENTO TIME (BASED ON THE I-RATE VALUE DEFINED IN THE PREVIOUS LINE). RAMPING UP THIS VALUE FROM ZERO PREVENTS VARIABLE FROM SLIDING UP TO THEIR REQUIRED INITIAL VALUES EACH TIME THE INSTRUMENT IS RESTARTED.
kporttime	=		kporttime * gkporttime	;FLTK SLIDER FOR PORTAMENTO TIME MULTIPLIED TO kporttime FUNCTION
kptr		portk		gkptr, kporttime	;APPLY PORTAMENTO TO THE FLTK SLIDER DERIVED VAIABLE 'gkptr'. A NEW VARIABLE CALLED 'kptr' IS OUTPUTTED.
kpch		portk		gkpch, kporttime	;APPLY PORTAMENTO TO THE FLTK SLIDER DERIVED VAIABLE 'gkpch'. A NEW VARIABLE CALLED 'kpch' IS OUTPUTTED.
		if		gkfile!=1	kgoto	SKIP1	;CONDITIONALLY SKIP TO 'SKIP1' LABEL IF gkfile ISN'T EQUAL TO 1 	
ifilelen      	filelen    	"$AnalysisFile1"		;DERIVE THE TOTAL DURATION OF THE ORIGINAL SOUND FILE FROM THE ANALYSIS FILE
kptr		=		kptr * ifilelen		;REDEFINE THE VARIABLE 'kptr' TAKING INTO ACCOUNT THE ACTUAL DURATION OF THE ORIGINAL SOUND FILE (ifilelen)
kphs		phasor		gkspeed/ifilelen	;DEFINE A MOVING PHASE VALUE THE FREQUENCY OF WHICH IS DIRECTLY PROPORTIONAL TO THE SPEED DEFINED BY THE FLTK SLIDER AND INVERSELY PROPORTIONAL TO THE DURATION OF THE ORIGINAL SOUND FILE
kphs		=		kphs * ifilelen		;RESCALE THE AMPLITUDE OF THE MOVING PHASE VALUE ACCORDING TO THE DURATION OF THE ORIGINAL SOUND FILE
kptr		=		(gkptrswitch == 0 ? kptr : kphs) ;CHECK TO SEE WHICH POINTER MODE HAS BEEN SELECTED AND DEFINE THE FINAL VALUE OF 'kptr' ACCORDINGLY
;OUTPUT		OPCODE		REQUIRED INPUT ARGS         |OPTIONAL INPUT ARGS...
ares		pvoc		kptr, kpch, "$AnalysisFile1", i(gkspec), i(gkextractmode), i(gkfreqlim), i(gkgatefn)
SKIP1:
		if		gkfile!=2	kgoto	SKIP2	;CONDITIONALLY SKIP TO 'SKIP2' LABEL IF gkfile ISN'T EQUAL TO 2	
ifilelen      	filelen    	"$AnalysisFile2"		;DERIVE THE TOTAL DURATION OF THE ORIGINAL SOUND FILE FROM THE ANALYSIS FILE
kptr		=		kptr * ifilelen		;REDEFINE THE VARIABLE 'kptr' TAKING INTO ACCOUNT THE ACTUAL DURATION OF THE ORIGINAL SOUND FILE (ifilelen)
kphs		phasor		gkspeed/ifilelen	;DEFINE A MOVING PHASE VALUE THE FREQUENCY OF WHICH IS DIRECTLY PROPORTIONAL TO THE SPEED DEFINED BY THE FLTK SLIDER AND INVERSELY PROPORTIONAL TO THE DURATION OF THE ORIGINAL SOUND FILE
kphs		=		kphs * ifilelen		;RESCALE THE AMPLITUDE OF THE MOVING PHASE VALUE ACCORDING TO THE DURATION OF THE ORIGINAL SOUND FILE
kptr		=		(gkptrswitch == 0 ? kptr : kphs) ;CHECK TO SEE WHICH POINTER MODE HAS BEEN SELECTED AND DEFINE THE FINAL VALUE OF 'kptr' ACCORDINGLY
;OUTPUT		OPCODE		REQUIRED INPUT ARGS         |OPTIONAL INPUT ARGS...
ares		pvoc		kptr, kpch, "$AnalysisFile2", i(gkspec), i(gkextractmode), i(gkfreqlim), i(gkgatefn)
SKIP2:
		outs		ares, ares	;SEND pvoc OUTPUT TO THE OUTPUTS
		endin

</CsInstruments>

<CsScore>
;GATING FUNCTIONS USED BY PVOC (OPTIONAL)
f 1 0 512 7 0 256 1 256 1	;50% THRESHOLD SHARP GATING
f 2 0 512 5 1 512 .001		;INVERT AMPLITUDES
;INSTR | START | DURATION
i  1       0       3600	;INSTRUMENT 1 PLAYS FOR 1 HOUR
</CsScore>

</CsoundSynthesizer>


























