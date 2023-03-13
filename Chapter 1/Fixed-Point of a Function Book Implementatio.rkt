#lang sicp
#|Book Implementation of Fixed Point|#
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (> tolerance (abs (- v1 v2))))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          (next)
          (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (/ x y)) 1.0))

(sqrt 9)
(sqrt 16)

;So this function won't converge
;But can I consider this to be the function
;Where I am trying to find the zeroes of something?
;That's where my mind instinctively goes to
;Let me think
;So essentially, I'm talking about combining the
;Half-Interval method and the fixed point method