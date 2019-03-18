#lang Racket
; Illustrating Scheme's built-in AND operator, (and p q).
(display "Illustrating Scheme's built-in (and p q)")
(newline)
(display "(and #f #f) has value  ")
(and #f #f)

(display "(and #f #t) has value  ")
(and #f #t)

(display "(and #t #f) has value  ")
(and #t #f)

(display "(and #t #t) has value  ")
(and #t #t)
(newline)

; Illustrating Scheme's built-in NOT operator, (not p).
(display "Illustrating Scheme's built-in (not p)")
(newline)
(display "(not #t) has value  ")
(not #t)

(display "(not #f) has value  ")
(not #f)
(newline)

; NOTE: As illustrated above, the Scheme syntax for calling  
; any built-in or user-defined function is a 
; parenthesized list whose first element is the name of
; the function followed by its parameter(s).

; The following procedure outputs the truth table for a
; propositional form pf having two propositional variables.
(define (truthTable pf)
    (newline)
    (display " p  q  value")   
    (newline)
    (display "#f #f   ")  
    (display (pf #f #f))
    (newline)
    (display "#f #t   ")
    (display (pf #f #t))
    (newline)
    (display "#t #f   ")
    (display (pf #t #f))
    (newline)
    (display "#t #t   ")
    (display (pf #t #t))
    (newline)
    (newline))

;implementation of nand
(define (nand p q)
    (not (and p q)))

;display the truthTable
(display "Truthtable for NAND")
(truthTable nand)

(display "Truthtable for ex2.1")
( define ( ex2.1 p q )
(nand (nand( nand p p) q) #t))
(truthTable ex2.1)

;Using only my nand function, define a ex2.1 function, an ex2.2, (both examples 
;from Unit 2), and an exor function.  In the first two cases,
;start with the simpler version.  Be sure 
;you display the truthTable as a way of checking each.

(display "Truthtable for ex2.2")
( define ( ex2.2 p q )
(nand (nand (nand q q)(nand p p)) #t))
(truthTable ex2.2)

(display "Truthtable for EXOR")
( define ( exor p q )
(nand (nand p #t) q) nand (nand q #t ) p)
(truthTable exor)

;Write functions and_, or_, and not_ that work the same way as and, or and not, except
;they take ones and zeros as parameters instead of true and false.  Make a truthTable_
;that displays your function results for the and_ and or_ (The not_ can just be
;displayed separately.)

(define (truthTable_ pf)
    (newline)
    (display " p  q  value")   
    (newline)
    (display " 0  0   ")  
    (display (pf 0 0))
    (newline)
    (display " 0  1   ")
    (display (pf 0 1))
    (newline)
    (display " 1  0   ")
    (display (pf 1 0))
    (newline)
    (display " 1  1   ")
    (display (pf 1 1))
    (newline)
    (newline))
   



(display "Truthtable for AND_")
( define ( and_ p q )
(if (= p 0) 0 q))
(truthTable_ and_)

(display "Truthtable for OR_")
( define ( or_ p q )
(if (= p 1) 1 q))
(truthTable_ or_)

( define ( not_ p )
(if (= p 0) 1 0))

(not_ 1)
(not_ 0)

;Use your functions to write and display a nand_ and an exor_.


