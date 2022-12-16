#lang sicp
#| Exercise 1.11 |#
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* (f (- n 2)) 2) (* (f (- n 3)) 3))))
(f 2)
(f 4)
(f 6)