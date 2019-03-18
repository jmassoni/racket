#lang racket

(define (divides? x y)
  (= 0 (mod y x)))

(define (mod n d)
  (cond
    ((< n d) n)
    (else (mod (- n d) d))))

(define (div n d)
  (cond
    ((< n d) 0)
    (else (+ 1 (div (- n d) d)))))

(define (NtoL n)
  (cond
    ((< n 10) (list n))
    (else (append (NtoL (div n 10)) (list (mod n 10))))))

;(NtoL 125)

(define (NtoB n)
  (cond
    ((< n 2) (list n))
    (else (append (NtoB (div n 2)) (list (mod n 2))))))

;(NtoB 125)


(define (preBAdd b1 b2 carry) ;We assume b1 and b2 are the same length and are binary representations in reverse.
  (cond
    ((null? b1) '())
    (else (cons (mod (+ (first b1) (first b2) carry) 2)
              (preBAdd (rest b1) (rest b2) (div (+ (first b1) (first b2) carry) 2))))))

;(preBAdd '(1 0 1 0 1) '(1 0 1 1 0) 0)

(define (BAdd b1 b2) ;We assume b1 and b2 have the same length
  (reverse (preBAdd (reverse b1) (reverse b2) 0)))
   
;(BAdd '(1 0 1 0 1) '(0 1 1 0 1))


(define (FourBit b)
  (cond
    ((= (length b) 4) b)
    ((< (length b) 4) (FourBit (cons 0 b)))
    (else (FourBit (rest b)))))

;(FourBit '(1 1 1 0 1 0 1))
;(BAdd (FourBit (NtoB 6)) (FourBit(NtoB 3)))

(define (Flip b)
  (cond
    ((null? b) b)
    (else (cons (mod (+ 1 (first b)) 2) (Flip (rest b))))))

;(Flip '(1 1 0 0 1 0 1))

(define (Neg b)
  (BAdd (FourBit '(1)) (Flip b)))

;(Neg '(0 0 1 1))

(define (BMinus b1 b2)
  (BAdd b1 (Neg b2)))

(BMinus '(0 1 0 0) '(0 1 1 1))

(BMinus '(0 0 1 1) '(1 1 0 0))


(define (Prime? d n)
 (cond
  ((> (* d d) n) #t)
  (else (and (not (divides? d n)) (Prime? (+ 1 d) n)))))

(define (prime? n)
  (Prime? 2 n))

(prime? 11111)

(define (PrimeSequence d n)
  (cond
    ((= n 1) '())
    ((divides? d n) (cons d (PrimeSequence d (div n d))))
    (else (PrimeSequence (+ d 1) n))))

(PrimeSequence 2 45)
