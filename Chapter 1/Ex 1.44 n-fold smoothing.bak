#lang sicp
#|Ex 1.44 n-fold smoothing
@Author - Soumitra Pandit
|#
;Work done till now
(define (compose f g)
  (lambda (x) (f (g x))))

(define (nth-repeat f n)
  (if (= n 1)
      f
      (compose f (nth-repeat f (- n 1)))))

(define (square x) (* x x))
;New work
(define (average a b c)
  (/ (+ a b c) 3))

(define dx 0.00001)

(define (smoothing f x)
  (average (f (+ x dx)) (f x) (f (- x dx))))

(define (n-fold-smoothing f n)
  (lambda (x) ((nth-repeat smooth n) x)))

;I don't know what function I would test it on
