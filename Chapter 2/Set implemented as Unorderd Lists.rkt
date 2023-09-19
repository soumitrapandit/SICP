#lang sicp
#|Sets as Un-Ordered Lists
@Author - Soumitra Pandit
@Date - 18th September 2023
Any great idea has humble beginnings.
Perhaps, representing sets as unordered
lists is the germ that grows into something
beautiful.
|#

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
        (intersection-set (cdr set1) set2)))
