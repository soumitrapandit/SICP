#lang sicp
#|Exercise 1.35|#
#|Author - Soumitra Pandit|#
;I have realised that I need to add my name on my scripts more often
;Anyway, Golden Rule by Fixed Point Approximation

(define (good-enough? x y)
  (> 0.00001 (abs(- x y))))

(define (find-fixed-point f guess)
  (let (
        (value-at-guess (f guess)))
    (if (good-enough? value-at-guess guess) (f value-at-guess)
        (find-fixed-point f value-at-guess))))

(find-fixed-point cos 1.0)
(find-fixed-point (lambda (y) (+ (sin y) (cos y)))  1.0)

;Works ;)
;We can revisualise the sqrt function as a fixed point
;for the function f(y) = x/y
;and keeping that observation in our mind, we can write

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (find-fixed-point (lambda (y) (average y (/ x y))) 1.0))

(sqrt 16)
(sqrt 36)

(define golden-ratio-approximation
  (find-fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

golden-ratio-approximation