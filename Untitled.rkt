#lang racket

(define (prime d n)
  (cond
    (( >(* d d) n) #t)
    (else (and (not (divides? d n) (prime? (+ d 1) n))))))
