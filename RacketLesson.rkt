#lang Racket
;Everything is either an atom or a list.

;ATOMS:
3
'a ;quote means that it's an atom - not an expression to be evaluated.
2/3 ;This is a fraction, not an expression.
'34ab+=^ ;This is just an atom - any characters are acceptable.
pi


;LISTS:  (Can be evaluated or not.)
'(asdf 1234 *** 3) ;Again, quote means don't evaluate.
'() ;Empty set




(newline)
(newline)
(display "Some evaluated lists.")
(newline)
(+ 3 7 12) ;Is to be evaluated. How to turn infix to prefix? 
; Consider: 8 + (3 - 6 / 2) - 3 * 4



(* (+ 3 7 (/ (* (+ 3 5 7)(/ 30 10)) 2)) 3)
(* (+ #i3 7 (/ (* (+ 3 5 7)(/ 30 10)) 2)) 3)
(sqrt 9)
(sqrt 2)
(expt 2 500)
(remainder 8 3)
(log 3.75)
(sin 3.14)
(null? '())
(null? '(234))
(list? '3)

(display "Now let's define our own functions.")
(newline)

;Area of a circle.
(define (areaOfCircle r)
    (* pi (* r r)))

(display "The area of a circle with radius 5 is ")
(areaOfCircle 5)
(newline)

;Area of washer (disk with a hole in it.)
(define (areaOfWasher rout rin)
    (- (areaOfCircle rout) (areaOfCircle rin)))

(display "The area of a washer with outer radius 7 and inner radius 3 is ")
(areaOfWasher 7 3)
(newline)



;Page 23 of How to design programs.
;At $5.00/ticket, 120 attendees.
;For every $.10 decrease in price, 15 more attendees.
;Cost of performance is $180 + $.04/attendee.
;What is the profit, given a ticket price?

(define (maximum value1 value2)
  (if (> value1 value2) value1 value2))
   

(define (attendees ticketPrice)
    (maximum 0 (+ 120 
       (* 15 (/ (- 5.00 ticketPrice) 0.10)))))

(define (cost ticketPrice)
    (+ 180 (* (attendees ticketPrice) 0.04)))

(define (revenue ticketPrice)
    (* ticketPrice (attendees ticketPrice)))

(define (profit ticketPrice)
    (- (revenue ticketPrice)(cost ticketPrice)))

(display "Profit at $5.00: $")
(profit 5.00)

(display "Profit at $4.00: $")
(profit 4.00)

(display "Profit at $1.00: $")
(profit 1.00)

(display "Profit at $6.00: $")
(profit 6.00)

;Let A={1, 3, 4} and B={house, car, boat}.  F1 = {(1,boat), (3, boat), (4, car)}




(define (f1 a)

    (cond 
      ((= a 1) 'boat)  ;(question answer)
      ((= a 3) 'boat)  ;(question answer)
      ((= a 4) 'car)   ;(question answer)
      (else #f)))     ;(else finalAnswer; note not needed domain only A, just to show)
(first '(3 7 12 8))
(rest '(3 7 12 8))
(car (cdr (cdr '(3 7 12 8))))

(define (power3 n)
  (if (= n 0) 1 (* 3 (power3 (- n 1)))))
(power3 3)
(power3 361)

