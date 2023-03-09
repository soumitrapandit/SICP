#lang sicp
#|Newton's Method
@Author - Soumitra Pandit
So I have understood what we are doing with
Newton's Method. So let me try to code it
|#
;First we would need the notion of a derivative
(define dx 0.00001)
(define (deriv f)
  (lambda (x)
    (/(-(f (+ x dx))(f x)) dx)))
;That should work
;Let's test that
(define (cube x) (* x x x))
((deriv cube)5)
;So its working
;Now, expressing Newton's method
;We will need a fixed point function
(define tolerance 0.00001)
(define (fixed-point f x)
  (display (f x))
  (newline)
  (if (> tolerance (abs (- (f x) x)))
      x
      (fixed-point f (f x))))

(define (newtons-method g)
  (let ((f (lambda (x) (- x (/ (g x) ((deriv g)x))))))
    (lambda (first-guess)(fixed-point f first-guess))))

;So what would the sqrt approximation look like?
(define (square x) (* x x))

(define (sqrt x)
  ((newtons-method (lambda (y) (- (square y) x)))1.0))

(sqrt 16)
