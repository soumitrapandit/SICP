#lang sicp
#|Ex 2.1
@Author - Soumitra Pandit
Better (make-rat n d)|#

(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (remainder a b)))))

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
     (if (< 0 (* n d))
         (cons (/(abs n) g) (/(abs d) g))
         (cons (/(-(abs n)) g) (/(abs d) g)))))