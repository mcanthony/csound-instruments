;---------------------------------------------------------------------------; A MULTI-EFFECTS SYSTEM;---------------------------------------------------------------------------; 3002. PLUCK; 3011. COMPRESSOR/LIMITER/EXPANDER; 3099. MIXER;---------------------------------------------------------------------------; PLAIN PLUCK;---------------------------------------------------------------------------;       STA  DUR    AMP   FQC   FUNC  METH OUTCHi 3002  0.0  1.6  16000  7.00   0     1    1i 3002  0.2  1.4  12000  7.05   .     .    .i 3002  0.4  1.2  10400  8.00   .     .    .i 3002  0.6  1.0  12000  8.05   .     .    .i 3002  0.8  0.8  16000  7.00   .     .    .i 3002  1.0  0.6  12000  7.05   .     .    .i 3002  1.2  0.4  10400  8.00   .     .    .i 3002  1.4  0.2  12000  8.05   .     .    .;---------------------------------------------------------------------------; MIXER;    STA DUR  CH1  GAIN  PAN  CH2  GAIN  PAN  CH3  GAIN  PAN  CH4  GAIN  PANi3099 0   2    1    1     1    1    1     0    3    0     1    4    0     0;---------------------------------------------------------------------------; COMPRESSION;---------------------------------------------------------------------------i 3002  2.0  1.6  16000  7.00   0     1    1i 3002  2.2  1.4  12000  7.05   .     .    .i 3002  2.4  1.2  10400  8.00   .     .    .i 3002  2.6  1.0  12000  8.05   .     .    .i 3002  2.8  0.8  16000  7.00   .     .    .i 3002  3.0  0.6  12000  7.05   .     .    .i 3002  3.2  0.4  10400  8.00   .     .    .i 3002  3.4  0.2  12000  8.05   .     .    .;---------------------------------------------------------------------------; COMPRESSION CURVEf 6 2 1024 7 1 128 1 128 .4 256 .2 256 .1 256 .01;---------------------------------------------------------------------------; COMPRESSOR/LIMITER;       STA  DUR  RMSTIME  DELTIME  TABLE  POSTGAIN  INCH  OUTCHi 3011  2    1.6  .02      .01       6     1.5       1     2; MIXER;     STA DUR  CH1  GAIN  PAN  CH2  GAIN  PAN  CH3  GAIN  PAN  CH4  GAIN  PANi 3099 2   2    2    1     1    2    1     0    6    0     1    7    0     0s;---------------------------------------------------------------------------; PLAIN PLUCK;---------------------------------------------------------------------------;       STA  DUR  AMP    FQC   FUNC  METH  OUTCHi 3002  0.0  1.6  16000  7.00   0     1    1i 3002  0.2  1.4  12000  7.05   .     .    .i 3002  0.4  1.2  10400  8.00   .     .    .i 3002  0.6  1.0  12000  8.05   .     .    .i 3002  0.8  0.8  16000  7.00   .     .    .i 3002  1.0  0.6  12000  7.05   .     .    .i 3002  1.2  0.4  10400  8.00   .     .    .i 3002  1.4  0.2  12000  8.05   .     .    .;--------------------------------------------------------------------------; MIXER;    STA DUR  CH1  GAIN  PAN  CH2  GAIN  PAN  CH3  GAIN  PAN  CH4  GAIN  PANi3099 0   2    1    1     1    1    1     0    3    0     1    4    0     0;---------------------------------------------------------------------------; LIMITING;---------------------------------------------------------------------------i 3002  2.0  1.6  16000  7.00   0     1    1i 3002  2.2  1.4  12000  7.05   .     .    .i 3002  2.4  1.2  10400  8.00   .     .    .i 3002  2.6  1.0  12000  8.05   .     .    .i 3002  2.8  0.8  16000  7.00   .     .    .i 3002  3.0  0.6  12000  7.05   .     .    .i 3002  3.2  0.4  10400  8.00   .     .    .i 3002  3.4  0.2  12000  8.05   .     .    .;---------------------------------------------------------------------------; LIMITING CURVEf 6 2 1025 7 1 256 1 512 .01 257 .01; COMPRESSOR/LIMITER;       STA  DUR  RMSTIME  DELTIME  TABLE  POSTGAIN  INCH  OUTCHi 3011  2    1.6  .02      .01       6     1.5       1     2; MIXER;     STA DUR  CH1  GAIN  PAN  CH2  GAIN  PAN  CH3  GAIN  PAN  CH4  GAIN  PANi 3099 2   2    2    1     1    2    1     0    6    0     1    7    0     0