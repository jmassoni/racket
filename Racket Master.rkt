#lang racket

(define A '(1 2 3 4))
(define B '(1 3 5 7))
(define C '(1 5 7 3))
(define D '(1 3))
(define E '(0 (1) (2 3)))

; Returns #t if anItem is a member of aList. Otherwise, it returns #f.
(define (member? anItem aList)
  (cond
    ((null? aList) #f)
    ((equal? anItem (first aList)) #t)
    (else (member? anItem (rest aList)))))

;(member? 1 '(1 2 3 4 ))

;(member? '(1) '(1 2 (1) (1 2)))

; Returns aList, but with no repeated items.
(define (listToSet aList)
  (cond
    ((null? aList) aList)
    ((member? (first aList) (rest aList)) (listToSet (rest aList)))
    (else (cons (first aList) (listToSet (rest aList))))))

;(listToSet '( 1 2 1 2 3 5 4 3 2 1 7 9 0 14 '(1 2 3 4)))

;Returns #t if set1 is a subset of set2. Otherwise, it returns #f.
(define (subset? set1 set2)
  (cond
    ((not (list? set1)) #f)
    ((null? set1) #t)
    ((member? (first set1) set2) (subset? (rest set1) set2))
    (else #f)))

; Returns #t if set1 = set2. Otherwise, it returns #f.
(define (setEqual? set1 set2)
  (and (subset? set1 set2) (subset? set2 set1)))





; Returns the union of set1 and set2
;(define (union set1 set2)
 ; (cond
  ;  (null? set1) set2)
   ; (member? first set1) set2) (union (rest set1) set2)
   ; (else (cons (first set1) (union (rest set1) set2)))

;(union A B)


; Returns the intersection of set1 and set2
;(define (intersection set1 set2)
 ; (cond
  ;  (null? set1) '())
   ; (member? (first set1) set2) (cons (first set1) (intersection (rest set1) set2)))
    ;(else (intersection (rest set1) set2))






; Add On Procedure

(define (addOn anItem LOL)
  (cond
    ((null? LOL) '())
    (else (cons (cons anItem (first LOL)) (addOn anItem (rest LOL))))))
    

(addOn 1 '( (0 0) (0 1) (1 0) (1 1)))


; Powerset Procedure

(define (powerSet aSet)
  (cond
    ((null? aSet) '(()) )
    (else (append (addOn (first aSet)(powerSet (rest aSet))) (powerSet (rest aSet))))))
  

(powerSet '(1 2 3 4))

; Cartesian Product Procedure

;(define (cartProd set1 set2 makeList)
 ; (cond
  ;  ((null? aSet) '())
   ; (else (cons (first (set1))
  

; x is an element of (Z2)^2
(define (f0 x)
   (cons 1 x))

(f0 '(1 0))

; D={0, 1}^4 , T={0, 1}^3, R={0, 1}^3
(define (f1 x)
   (rest x))

(f1 '(1 0 0 0))

;f1 is not one-to-one:

(f1 '(0 0 0 0))
(f1 '(1 0 0 0))

;f1 is onto.




;Excercise 2.3.4 b)

(define (f2 x)
  (rest x) (cons 1 x))

(f2 '(0 0))

;c)

(define (f3 x)
  (cond
    ((null? x) '())
    (else (append (f3 (rest x)) (list (first x))))))

(f3 '(1 1 0))