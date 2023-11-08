#lang sicp
#|Exercise 3.14 Mystery Function
@Author - Soumitra Pandit
@Date - 7th November 2023

I can kinda see what this is doing?
Though I am not a hundred percent sure.
Its basically going to give me (car x) (I think)|#

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd))

(define w (mystery v))

v
w

;I think I was correct as far as what it does to the original list
;I did not see the list reversal.
;Also, its interesting that we achieved that without using cons.
;So there is an implicit cons hidden somewhere in our mystery function.
;quite cool, actually.