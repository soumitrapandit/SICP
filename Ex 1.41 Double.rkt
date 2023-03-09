#lang sicp
#|Ex 1.41 Double
@Author - Soumitra Pandit
|#

(define (inc a) (+ a 1))

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 1)

(((double (double double)) inc) 5)

;The answer is 21