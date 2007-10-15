; ************************************************************************
; ACCCI:     02-42-1.SCO
; coded:     jpg 9/93

; GEN functions **********************************************************
; waveforms
f11 0 512 9   1 1 0
f12 0 512 9   3 1 0 4 1 0 5 1 0 5 1 0
f13 0 512 9   8 1 0 9 1 0 10 1 0 11 1 0 12 1 0 15 1 0 17 1 0 18 1 0

; envelopes
f31 0 512 7 1 512 1    ;steady state
f32 0 512 7 .85 512 1  ;increasing freq -3rd
f33 0 512 7 1 512 .85  ;decreasing freq. -3rd
f1 0 512 10 .1         ;orc. + .9 !! up & down -3rd

; score ******************************************************************
f0 1
s

; constant pitch
;     dur  amp1  fq1  amp2 fq2  amp3 fq3 pcf att1 dec1 att2 dec2 att3 dec3
i1  0 1.63 10000 160  6000  75  3000  61  31 .01  1.6  .01  1.61 .01  1.61
i1  2 1.7  10000 160  6000  75  3000  61  31 .03  1.6  .01  1.65 .01  1.65
; rising a third
i1  4 1.63 10000 160  6000  75  3000  61  32 .01  1.6  .01  1.61 .01  1.61
i1  6 1.7  10000 160  6000  75  3000  61  32 .03  1.6  .01  1.65 .01  1.65
; oscil pitch between .9 and 1.1 times ifq's
i1  8 1.63 10000 160  6000  75  3000  61   1 .01  1.6  .01  1.61 .01  1.61
i1 10 1.7  10000 160  6000  75  3000  61   1 .03  1.6  .01  1.65 .01  1.65
; going down a third
i1 12 1.63 10000 160  6000  75  3000  61  33 .01  1.6  .01  1.61 .01  1.61
i1 14 1.7  10000 160  6000  75  3000  61  33 .03  1.6  .01  1.65 .01  1.65
; non-realistic parameters
i1 16 2    10000 160  6000  75  8000  61  33 .01  1.95 1.9   .1  .9    .8

e
 
