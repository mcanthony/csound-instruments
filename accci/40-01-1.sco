; ************************************************************************
; ACCCI:   40-01-1.SCO
; coded:   jpg 8/93


; GEN functions **********************************************************
; carrier
f1   0 2048 10 1               ; sinus

; transfer function
f31  0  512 -7  -1  512  1                                      ; f(x) = x
f32  0  512 -7  -1  256  0  50 .2 1 0 205 1         ; linear discontinuous
f33  0  512 -7  0  103 -.2 103 -1 100 1 206 0   ; linear with sharp points
f80  0  513  3  -1  1    0 0 1                         ; even: f(x) = x**2
f81  0  512  3  -1  1    0 0 0 1                        ; odd: f(x) = x**3


; score ******************************************************************

;           idur   iamp   ipch  itf
i1    0      2     8000   7.00  31
i1    +      .     .      .     32
i1    .      .     .      .     33
i1    .      .     .      .     80
i1    .      .     .      .     81

s


i1    0      .5    5000   7.00  33
i1    0      .     .      8.00  . 
i1    0      .     .      9.04  .
i1    0      .     .      8.07  .
i1    0      .     .      8.11  .

s 

i1    0      2     5000   7.00  33
i1    0      .     .      8.00  . 
i1    0      .     .      9.04  .
i1    0      .     .      8.07  .
i1    0      .     .      8.11  .

e

