#lang sicp
#|Ex 2.4|#
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;Believe it or not, that
;does make perfect sense.
