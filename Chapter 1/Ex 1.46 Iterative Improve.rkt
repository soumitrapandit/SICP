#lang sicp
#|Ex 1.46 Iterative Improvement
@Author - Soumitra Pandit
|#

(define (iterative-improve validation improvement)
  (lambda (guess)
    (if (validation guess)
        guess
        ((iterative-improve validation improvement)(improvement guess)))))

;Rewriting fixed-point as a iterative improve
(define tolerance 0.0001)
(define (good-enough? v1 v2)
  (> tolerance (abs (- v1 v2))))

;I think that the program is partialy accurate
;But I would like it to be cleaner
;How can I rewrite good-enough?
(define (fixed-point-validation f)
  (lambda (x) (good-enough? x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp x)
  (lambda (y) (average y (/ x y))))

(define (fixed-point f)
  ((iterative-improve (fixed-point-validation f) f)1.0))

(define (sqrt x)
  (fixed-point (average-damp x)))

(sqrt 16)
