#lang sicp
#|Odd implementation of cons
@Author - Soumitra Pandit
|#

(define (cons x y)
  (define (dispatch m)
    (cond ((= 0 m) x)
          ((= 1 m) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

;Now why would that work? Like Seriously, why would that work?

(define (car z) (z 0))
(define (cdr z) (z 1))

;Procedural Representation of Data
