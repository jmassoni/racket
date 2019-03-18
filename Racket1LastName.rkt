;HW1 - the greetings program.  Change the greeting so 
;it tells me something about you.
#lang Racket
(define part1 "Hello, I'm ")
(define myName "Joey")
(define part2 ", and I'm majoring in ")
(define major "Computer Science")
(define part3 " and I have no ")
(define minor "minor")

(define (greeting p1 p2 p3 p4 p5 p6)
    (display (string-append p1 p2 p3 p4 p5 p6 ".")))

;The following outputs (tests) the greeting.
(greeting part1 myName part2 major part3 minor)
(newline)
;- We're going to write and test some simple functions.
;I've done the first three for you as examples.  You 
;do those not already done.

;The constant function.
(define (constant x) 42)
;and to test it:
(display "Test of constant function with x = 37, x = -5, x = 0; results should all be 42")
(newline)
(constant 37)
(constant -5)
(constant 0)

;The successor function.
(define (successor n)
  (+ n 1))
;and test here with the same three values. 
(display "Test successor with same three values. Results should be 38, -4, and 1.")
(newline)
(successor 37)
(successor -5)
(successor 0)
(newline)

;Let A={1, 3, 4} and B={house, car, boat}.  F1 = {(1,boat), (3, boat), (4, car)}
(define (f1 a)
  (cond 
    ((= a 1) 'boat)
    ((= a 3) 'boat)
    ((= a 4) 'car)
    (else #f)))

(display "Test with 3, 4, and 37. Results should be boat, car, #f.")
(newline)
(f1 3)
(f1 4)
(f1 37)
(newline)


;Let A={1, 3, 4} and B={3, 4, 5, 6}.  Now F2 = {(1, 5), (3, 4), (4, 5)}

(define (f2 a)
  (cond 
    ((= a 5) '5)
    ((= a 4) '4)
    (else #f)))

(newline)
(f2 5)
(f2 4)
(f2 37)

;F3 is the squaring function. That is F3(x) = x^2.

(define (f3 x)
    (* x x))

(newline)
(f3 3)

;F4 is from Z to Z.  (x, y) in F4 if y = x + 7, that is, F4(x) = x + 7.



;F5 is from R to R.  (x, y) in F5 if y = 3 + 6.2*x^2 - 4.

;F6 is from R to R. (x, y) in F6 if y = (2x - 3)^2. Use your F3.

