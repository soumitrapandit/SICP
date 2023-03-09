#lang sicp
#|Ex 1.43 nth repeated application of f
@Author - Soumitra Pandit
|#

(define (compose f g)
  (lambda (x) (f (g x))))

(define (nth-repeat f n)
  (if (= n 1)
      f
      (compose f (nth-repeat f (- n 1)))))

(define (square x) (* x x))

((nth-repeat square 2)5)