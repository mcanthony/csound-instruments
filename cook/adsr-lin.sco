f1 0 8193 -7 0 8192 1               ; Ramp
f2 0 8193 -7 0 2048 1 4096 1 2048 0 ; ADSR(Sustain=1)
f3 0 8193 -7 0 2048 1 2048 0 4096 0 ; ADSR(Sustain=0)

;     Strt  Leng  Levl  AtkT  DecT  SusL  RelT
i01   0.00  1.00  1.00  0.10  0.25  0.00  0.10
i01   1.00  1.00  1.00  0.00  0.50  0.75  0.25
i01   2.00  1.00  1.00  0.00  0.25  0.00  0.25
e