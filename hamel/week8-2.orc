; ORQUESTRA FILE
 
  sr        =  44100
  kr        =  4410
  ksmps     =  10.0



instr 1
  iptch     =  cpspch(p5)
  asig      pluck     p4, iptch, iptch, 1, 3, .5  ; simple drum with roughness .5
            out       asig
endin


