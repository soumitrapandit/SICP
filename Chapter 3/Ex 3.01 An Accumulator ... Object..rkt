#lang sicp
#|Ex 3.01 An Accumulator Object
@Author - Soumitra Pandit
@Date - 7th October 2023
|#

(define (make-accumulator base)
  (lambda (increment)
         (begin (set! base (+ base increment))
                base)))

(define A (make-accumulator 5))
(A 10)
(A 10)

;Yeah this is...different.