#lang sicp
#|Ex 1.40
@Author - Soumitra Pandit
|#

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
  (let ((transformed-g (lambda (x) (- x (/ (g x) ((deriv g)x))))))
    (lambda (first-guess)(fixed-point transformed-g first-guess))))

(define (square x) (* x x))

;The task is to approximate the zeros of the cubic x^3+ ax^2 + bx + c

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

((cubic 2 3 4)1)

(define (cubic-reduce a b c)
  ((newtons-method (cubic a b c))1))

(cubic-reduce 1 2 3)


