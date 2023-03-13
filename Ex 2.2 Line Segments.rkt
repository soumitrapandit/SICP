#lang sicp
#|Ex 2.2
@Author - Soumitra Pandit
|#

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (mid-point segment)
  (make-point (/(+(x-point(start-segment segment))
                  (x-point(end-segment segment)))2)
              (/(+(y-point(start-segment segment))
                  (y-point(end-segment segment)))2)))

(define (print-point point)
  (newline)
  (display (x-point point))
  (display ",")
  (display (y-point point)))

(define p1 (make-point 3 4))
(define p2 (make-point 58 17))
(define segment1 (make-segment p1 p2))
(print-point (mid-point segment1))