  sr        =  48000
  ksmps     =  64
  nchnls    =  2

#include "base_macros.h.orc"

  ga0       init      0

instr 1

  ixdur     =  0.05                               ; release time
  p3        =  p3 + ixdur

; output amplitude

  iamp      =  $VELOC2AMP(p5) * 1500

; grain duration

  kgdur     port      0.04, 0.25, 0.2

; 4 * sr = 192000Hz (sample rate of input file)

  a1        grain2    4 * sr / ftlen(1), 0, kgdur, 50, 1, 2

; filters

  kflvl     port      4, 0.2, 1
  kfq       =  kflvl * 0.7071
  a1        pareq     a1, 10000, kflvl, kfq, 0
  a1        butterhp  a1, 500
  a1        butterlp  a1, 16000

; amp. envelope

  aenv1     linseg    0, 0.003, 0.5, 0.02, 1, 1, 1
  aenv2     expon     1, 0.22, 0.5
  aenv3     linseg    1, p3 - ixdur, 1, ixdur - 0.002, 0, 1, 0

            vincr     ga0, a1 * iamp * aenv1 * aenv2 * (aenv3 * aenv3)

endin

; ---- instr 99: stereo output ----

instr 99

  a1, a2, a3, a4      spat3di                     ga0 + 0.000001, -0.5, 2.5, 0, 0.3, 225, 3
            clear     ga0
; decode to 2 chnls with phase shift
  a1re, a1im   hilbert  a1
  a2re, a2im   hilbert  a2
  a3re, a3im   hilbert  a3
  aL        =  0.7071 * (a1re - a1im) + 0.5 * (a2re + a2im + a3re - a3im)
  aR        =  0.7071 * (a1re + a1im) + 0.5 * (a2re - a2im - a3re - a3im)

            outs      aL, aR

endin

