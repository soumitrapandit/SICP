#lang sicp
#|Rational Numbers
@Author - Soumitra Pandit
|#
;Lets make some rational number procedures
;Assumptions - We have been given contructors and selectors
;Such that (make-rat <n> <d>) will make a rational number
;(numer <x>) returns the numerator of the rational number
;(denom <x>) returns the denominator of the rational number

(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (remainder a b)))))

#|(define (make-rat numerator denominator)
  (let ((g (gcd numerator denominator)))
    (cons (/ numerator g)(/ denominator g))))|#

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
     (if (< 0 (* n d))
         (cons (/(abs n) g) (/(abs d) g))
         (cons (/(-(abs n)) g) (/(abs d) g)))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;So now, we want to furnish procedures which implement additon,
;multiplication, division (and subtraction I guess)

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))

(define one-half (make-rat 1 2))
(print-rat one-half)
(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (add-rat one-third one-third))

