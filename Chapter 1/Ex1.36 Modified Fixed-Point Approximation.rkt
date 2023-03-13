#lang sicp
#|Exercise 1.35
Author - Soumitra Pandit
Modified Fixed Point Approximation |#

(define (good-enough? x y)
  (> 0.00001 (abs(- x y))))

(define (find-fixed-point f guess step-number)
  (let (
        (value-at-guess (f guess)))
    (newline)
    (display step-number)
    (newline)
    (display value-at-guess)
    (if (good-enough? value-at-guess guess) (and (newline) (f value-at-guess))
        (find-fixed-point f value-at-guess (+ 1 step-number)))))

;(find-fixed-point cos 1.0 0)
;(find-fixed-point (lambda (y) (+ (sin y) (cos y)))  1.0 0)

;Works ;)
;We can revisualise the sqrt function as a fixed point
;for the function f(y) = x/y
;and keeping that observation in our mind, we can write

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (find-fixed-point (lambda (y) (average y (/ x y))) 1.0 0))

(define (undampened-log)
  (find-fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0 0))

(define (dampened-log)
  (find-fixed-point (lambda (x) (average x (/(log 1000) (log x)))) 2.0 0))

(undampened-log)

(dampened-log)

;(sqrt 16)
;(sqrt 36)