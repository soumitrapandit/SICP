#lang sicp
#|Ex 1.42 Composition
@Author - Soumitra Pandit
|#

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose square inc)6)