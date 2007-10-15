; ************************************************************************
; ACCCI:     20-10-2.SCO
; coded:     jpg 8/92

; GEN functions **********************************************************
; carriers
f1  0  512  10  1
; envelopes
f31 0 512 7   1 64 0  448 0                ; index envelope
f51 0 513 5  .8 113 1   10   1 390 .0001   ; amplitude envelope

; score ******************************************************************
;    idur  iamp   pch
i1  0 .2   8000   3.00    ; scale in wood drum...
i1  +  .   .      3.02
i1  .  .   .      3.04
i1  .  .   .      3.05
i1  .  .   .      3.07
i1  .  .   .      3.09
i1  .  .   .      3.11
i1  .  .   .      4.00
s
i1  2 .2   8000   2.00    ; an octave lower
i1  +  .   .      2.02
i1  .  .   .      2.04
i1  .  .   .      2.05
i1  .  .   .      2.07
i1  .  .   .      2.09
i1  .  .   .      2.11
i1  .  .   .      3.00
e
