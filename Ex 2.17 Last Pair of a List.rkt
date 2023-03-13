#lang sicp
#|Ex 2.17 Last Pair
@Author - Soumitra Pandit
|#

;Given a list, how do you find the last element?

(define (last-pair list-1)
  (if (null? (cdr list-1))
      (car list-1)
      (last-pair (cdr list-1))))

(define test-list (list 1 3 4 5 6))
(last-pair test-list)