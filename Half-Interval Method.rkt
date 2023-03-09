#lang sicp
#|Half Interval Method|#
#|The idea is simple but potent|#
;Pseudocode:
;Given an interval where f(a) < 0 < f(b)
;-> Find midpoint of interval
;-> Evaluate function on the midpoint
;-> Check if window is within tolerable range
;-> If not evaluate function again with new intervals

(define (find-root f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (good-enough? neg-point pos-point)
           midpoint
          (let ((test-point (f midpoint)))
            (cond ((positive? test-point)
                   (find-root f neg-point midpoint))
                  ((negative? test-point)
                   (find-root f midpoint pos-point))
                  (else midpoint))))))

(define (average a b)
  (/ (+ a b) 2))

(define (half-interval-method f a b)
  (let ((f-a (f a))
        (f-b (f b)))
    (cond ((and (positive? f-a) (negative? f-b))
           (find-root f b a))
          ((and (positive? f-b) (negative? f-a))
           (find-root f a b))
          ((= f-a 0) a)
          ((= f-b 0) b)
          (else (error "Values are not of opposite sign" a b)))))

(define (positive? x)
  (>= x 0))

(define (negative? x)
  (< x 0))

(define (good-enough? x y)
  (> 0.001 (abs(- x y))))

(half-interval-method sin 2.0 4.0)
(half-interval-method (lambda (x) (-(* x x x) (* 2 x) 3)) 1.0 2.0)
         