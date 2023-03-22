#lang sicp
#|Mapping Over Lists
@Author - Soumitra Pandit
|#

;Given some function f
;How can I return a list with f applied to each element?

(define (map f list)
  (if (null? list)
      list
      (cons (f (car list)) (map f (cdr list)))))

;This should work, right?

(define (scale factor)
  (lambda (x) (* factor x)))

(define (scale-list list)
  (lambda (factor) (map (scale factor) list)))

(define list1 (list 1 2 3 4 5 6))

((scale-list list1)2)