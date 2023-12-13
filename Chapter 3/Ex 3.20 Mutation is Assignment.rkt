#lang sicp
#|Ex 3.20 Mutation is Assignment
@Author - Soumitra Pandit
@Date - 8th November 2023
|#

;Yes, this was definitely a huge spoiler.

(define (cons x y)
  (define (set-x! v) (set! x v))
  (define (set-y! v) (set! y v))
  (define (dispatch m)
    (cond ((eq? m 'car) x)
          ((eq? m 'cdr) y)
          ((eq? m 'set-car!) set-x!)
          ((eq? m 'set-cdr!) set-y!)
          (else (error "Underfined operation -- CONS" m))))
  dispatch)

(define (car z)
  (z 'car))

(define (cdr z)
  (z 'cdr))

(define (set-car! z y)
  ((z 'set-car!)y))

(define (set-cdr! z y)
  ((z 'set-cdr!)y))

(define x (cons 1 2))
(define z (cons x x))
z
(set-car! (cdr z) 17)

(car x)