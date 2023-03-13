#lang sicp
#|Ex 1.45 n-fold Average Damp
@Author - Soumitra Pandit
|#
(define(expo b n)
  (expo_iter b n 1))

(define(even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define(expo_iter b n a)
  (cond((= n 0)a)
       ((= n 1)b)
       ((even? n)(expo_iter (square b) (/ n 2) b))
       (else (* b (expo_iter b (- n 1) a)))))

(define (good-enough? x y)
  (> 0.00001 (abs(- x y))))

(define (find-fixed-point f guess)
  (let (
        (value-at-guess (f guess)))
    (if (good-enough? value-at-guess guess) (f value-at-guess)
        (find-fixed-point f value-at-guess))))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (find-fixed-point (lambda (y) (average y (/ x y))) 1.0))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (nth-repeat f n)
  (if (= n 1)
      f
      (compose f (nth-repeat f (- n 1)))))

;Combined Procedure
(define (damp-function x n)
  (lambda (y) (/ x (expo y n))))

(define (n-fold-damp n f)
  (lambda (x) ((nth-repeat (average-damp f) n)x)))

(define (nth-root x n)
  ((n-fold-damp n (damp-function x n))x))

(nth-root 16.0 4.0)