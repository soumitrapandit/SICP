#lang sicp
#|Ex 2.6 Church Numerals
@Author - Soumitra Pandit
|#

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lamda (x)
           (f ((n f) x)))))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f ((one f) x)))))

(define (addition n m)
  (lambda (f)
    (lambda (x)
      ((n f) ((m f) x)))))

;That should work. But how do we test it?
