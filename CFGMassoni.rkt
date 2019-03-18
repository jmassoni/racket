#lang Racket
;Please change the name of this file to CFGYourLastName.

;These first five definitions are useful 
;for all grammars.

(define inString empty)

;initializes the input string
(define (initString s)
    (set! inString s))

;returns the current symbol
(define (currentSymbol)
  (first inString))

;Before returning the current symbol, 
;resets the input string to the rest
;of the string so we're looking at the
;next symbol.
(define (moveToNextSymbol)
  (let ((x (first inString)))
    (begin
      (set! inString (rest inString))
    x)))

;Checks to make sure the current symbol
;is the expected one and if so, we go on to the next
;symbol.
(define (match expected)
    (cond
      ((null? inString) #f)
      ((eq? expected (currentSymbol))
       (begin 
         (moveToNextSymbol)
          #t))
      (else #f)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;Implements the rule S -> aSb
;Matches the a, checks to see if there should be another 
;call to S then, whether there is or not, matches the b.
; Note the AND.  The match of 'a AND the possible inside S AND
; the match of the 'b all have to be true.
(define (S1)
    (and
    (match 'a)
     (if (eq? (currentSymbol) 'a) (S1) #t)
     (match 'b)))

;Initializes the input string and returns true if
; the input string is empty, S -> e
;Otherwise, makes sure that S1 returns true AND we've read 
;the whole input string by the time we get back.
(define (isS1? in)
    (begin
      (initString in)
       (if (null? inString) #t (and (S1) (null? inString)))))

;Testing S1
(display "Testing S1 -> aS1b | e")
(newline)
(display "S1 -> (a a a b b b) should be true: ")
(isS1? '(a a a b b b))
(display "S1 -> (a a a b b) should be false: ")
(isS1? '(a a a b b))
(display "S1 -> () should be true: ")
(isS1? '())
(display "S1 -> (a a b b b) should be false: ")
(isS1? '(a a b b b))
;;;;;;;;;;;

 ; S2 -> aA2 | bB2
 ; A2 -> baA2 | e
 ; B2 -> abB2 | e
 
(define (A2)
   (if (null? inString) #t 
       (and (match 'b) (match 'a) (A2))))
 
(define (B2)
   (if (null? inString) #t 
       (and (match 'a) (match 'b) (B2))))

(define (S2)
    (cond
      ((null? inString) #f)
      ((eq? (currentSymbol) 'a)(and (match 'a) (A2)))
      (else (and (match 'b) (B2)))))

(define (isS2? in)
     (begin
       (initString in)
       (and (S2) (null? inString))))
;Testing S2

(newline)
(display "Testing S2 -> aA2 | bB2    A2 -> baA2 | e   B2 -> abB2 | e")
(newline)
(display "S2 -> (a b a b a) should be true: ")
(isS2? '(a b a b a))
(display "S2 -> (b a b a b) should be true: ")
(isS2? '(b a b a b))
(display "S2 -> () should be false: ")
(isS2? '())
(display "S2 -> (a) should be true: ")
(isS2? '(a))
(display "S2 -> (b a b b) should be false: ")
(isS2? '(b a b b))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;3. For you to do:
; Grammar to implement and test:
; S3 -> aaS3 | B3
; B3 -> bB3ab | e

(define (S3)
  (cond
    ((null? inString) (B3))
    ((eq? (currentSymbol) 'a)(and (match 'a)(match 'a) (S3)))
    (else (B3))))

(define (B3)
  (if (null? inString) #t (and (match 'b) (if (eq? (currentSymbol) 'b) (B3) #t) (match 'a) (match 'b))))

(define (isS3? in)
    (begin
      (initString in)
       (and (S3) (null? inString))))

;Testing S3

(newline)
(display "Testing S3 -> aaS3 | b3       B3 -> bB3ab | e")
(newline)
(display "S3 -> (a b a b a) should be true: ")
(isS2? '(a b a b a))
(display "S2 -> (b a b a b) should be true: ")
(isS2? '(b a b a b))
(display "S2 -> () should be false: ")
(isS2? '())
(display "S2 -> (a) should be true: ")
(isS2? '(a))
(display "S2 -> (b a b b) should be false: ")
(isS2? '(b a b b))


;4. For you to do:
; This is the language wcwR (That is, w is a word consisting of a's and b's, then there's a c,
; then we have the same word but reversed.)
; S4 -> aS4a | bS4b | c



;5. For you to do:
; This is the language of an odd number of a's and an even number of b's.
; S5 -> aD | bE
; D -> aS5 | bF | e
; E -> bS5 | aF
; F -> bD | aE

(define (S5)
  (cond
    ((null? inString) #f)
    ((eq? (currentSymbol) 'a) ( and (match 'a) (D)))
    (else (and (match 'b) (E)))))

(define (D)
  (cond
    ((null? inString) #t)
    ((eq? (currentSymbol) 'a) ( and (match 'a) (S5)))
    (else (and (match 'b) (F)))))

(define (E)
  (cond
    ((null? inString) #f)
    ((eq? (currentSymbol) 'b) ( and (match 'b) (S5)))
    (else (and match 'a) (F))))

(define (F)
  (cond
    (null? inString #f)
    ((eq? (currentSymbol) 'b) ( and (match 'b) (D)))
    (else (and (match 'a) (E)))))

(define (isS5? in)
  (begin
    (initString in)
    (and (S5) (null? inString))))

;Testing S5

(newline)
(display "Testing S5 -> aD | bE     D -> aS5 | bF | e     E -> bS5 | aF      F -> bD | aE")
(newline)
(display "S5 -> (a b a b a) should be true: ")
(isS2? '(a b a b a))
(display "S5 -> (b a b a b) should be true: ")
(isS2? '(b a b a b))
(display "S5 -> () should be false: ")
(isS2? '())
(display "S5 -> (a) should be true: ")
(isS2? '(a))
(display "S5 -> (b a b b) should be false: ")
(isS2? '(b a b b))