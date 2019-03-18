#lang racket

(define (addOn anItem LOL)
  (cond
    ((null? LOL) '())
    (else (cons (cons anItem (first LOL)) (addOn anItem (rest LOL))))))
    

(addOn 1 '( (0 0) (0 1) (1 0) (1 1)))