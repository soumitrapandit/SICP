#lang sicp
#|Ex 2.59 Union Set
@Author - Soumitra Pandit
@Date - 18th September 2023

Lets continue with the unordered lists
representation and write a function to
give us the union of two sets.
Should be relatively straightforward.|#


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? (car set) x) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1); Is this condition truly necessary?
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))


(define set-a (list 1 2 3 4 5))
(define set-b (list 3 4 5 6 7))

;Primary test
(union-set set-a set-b)
;Okay, works.
;More tests
(union-set '() '())
(union-set (list nil) (list nil))
(union-set (list 1 2 3) (list 4 5 6))


