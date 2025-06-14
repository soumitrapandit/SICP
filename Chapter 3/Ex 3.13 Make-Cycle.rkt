#lang sicp
#|Exercise 3.13 Make-Cycle
@Author - Soumitra Pandit
@Date - 7th November 2023

Reminds me of a snake eating its own tail.

But seems interesting so lets try it out.
|#
(define (last-pair seq)
  (if (null?(cdr seq))
      seq
      (last-pair (cdr seq))))

(define (make-cycle seq)
  (set-cdr! (last-pair seq) seq)
  seq)

(make-cycle (list 1 2 3 4))


(define z (make-cycle '(a b c)))

;(last-pair z)

;Obviously, the program never stops.
;This is pretty cool. But also very obvious.
