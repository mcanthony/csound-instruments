  sr        =  44100
  kr        =  4410
  ksmps     =  10
  nchnls    =  2


            massign   1,1

instr          1

  inote     cpsmidib  
  iveloc    ampmidi   1
  kgate     linenr    iveloc,0,1,.01
; HAMMER/PULL
    
  kamp      linseg    0.0, 0.015, 12000*2, p3-0.065, 12000*2, 0.05, 0.0
  kfreq     linseg    inote*2, .125*3, inote, 0.005, (inote*2)-30, (1-.125)*3-0.005, (inote-30)*2
  asig      pluck     kamp, kfreq, inote, 0, 1
  af1       reson     asig, 110, 80
  af2       reson     asig, 220, 100
  af3       reson     asig, 440, 80
  aout      balance   0.6*af1+af2+0.6*af3+0.4*asig, asig
            outs      aout*kgate,aout*kgate
  ga1       =  aout*kgate
endin
