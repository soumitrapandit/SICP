#lang sicp
#|Fixed Points of Functions|#
;The idea is quite simple.
;We are trying to find the point f(x) st f(x) = x
;And one (bad) approach is applying f to a guess x multiple times
;Now, I have no idea why this is better than random chance
;But if I were to code this, how would I?
;There would have to be a good-enough?

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