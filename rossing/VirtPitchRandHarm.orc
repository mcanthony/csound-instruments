
;*****************************   VIRTUAL PITCH WITH RANDOM HARMONICS   **************************

; THIS DEMONSTRATION COMPARES THE VIRTUAL PITCH AND THE TIMBRE OF COMPLEX TONES WITH LOW AND HIGH HAR-
; MONICS OF A MISSING FUNDAMENTAL. WITHIN THREE GROUPS (LOW,MEDIUM,HIGH HARMONICS) THE HARMONIC NUMBER
; ARE RANDOMLY CHOSEN. THE WESTMINISTER CHIME MELODY IS CLEARLY RECOGNIZABLE IN ALL THREE CASES. THIS 
; SHOWS THAT THE VIRTUAL-PITCH MELODY IS NOT BASED ON AURAL TRACKING OF A PARTICULAR HARMONIC IN THE
; SUCCESSIVE COMPLEX-TONE STIMULI.
; THE TUNE OF THE WESTMINISTER CHIME IS PLAYED WITH TONE COMPLEXES OF THREE RANDOM SUCCESSIVE HARMON-
; ICS. IN THE FIRST PRESENTATION HARMONIC NUMBERS ARE LIMITED BETWEEN 2 AND 6, THEN BETWEEN 5 AND 9,
; AND FINALLY BETWEEN 8 AND 12.

;*****************************************   HEADER   **********************************************



  sr        =  44100
  kr        =  4410
  ksmps     =  10
  nchnls    =  2

instr         1

  iamp      =  ampdb(p4)               
  ifunc     =  p6
  k1        linen     iamp,.03,p3,.03         
  a1        oscili    k1,p5,ifunc             
            outs      a1,a1
endin  
 
 
 
