#lang sicp
#|Append and other experiments
@Author - Soumitra Pandit
|#

;A few experiments first


(define (append list-1 list-2)
  (if (null? list-1)
      list-2
      (cons (car list-1) (append (cdr list-1) list-2))))
(define (append2 list-1 list-2)
  (cons list-1 list-2))

(define odd-list (list 1 3 5 7))
(define square-list (list 1 4 9 16))

(define odd-square (append odd-list square-list))
odd-square

(define odd-square2 (append2 odd-list square-list))
odd-square2

;A few more experiments with cons

(define list-a (cons (cons 1 2) (cons 3 4)))
(define list-b (cons 1 (cons 2 (cons 3 (cons 4 nil)))))
(define list-c (cons (cons 1 (cons 2 3)) 4))

list-a
list-b
list-c

#|Oh, I get it now
Lists are implemented in nested cons
That's why the append function works
Because we're just stacking on nested cons
|#