#lang sicp
#|Ex 2.26
@Author - Soumitra Pandit
|#

(define (append list-1 list-2)
  (if (null? list-1)
      list-2
      (cons (car list-1) (append (cdr list-1) list-2))))

(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
(cons x y)
(list x y)