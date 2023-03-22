#lang sicp
#|Ex 2.21 Square List
@Author - Soumitra Pandit
|#

(define (map f list1)
  (if (null? list1)
      list1
      (cons (f (car list1)) (map f (cdr list1)))))

(define (square x)
 (* x x))

(define (square-list list1)
  (map square list1))

(define list1 (list 1 2 3 4 5 6))
(square-list list1)
  