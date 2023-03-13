#lang sicp
#|Ex 2.5
@Author - Soumitra Pandit
|#

;I am trying to understand the prompt
;Oh, I get it
(define (iterative-exp base exponent product target)
  (if (= product target)
      exponent
      (iterative-exp base (+ 1 exponent) (* product base) target)))

(define (cons a b)
  (* (expt 2 a)(expt 3 b)))

(define (even? x)
  (= 0 (remainder x 2)))

(define (car z)
  (define (extract2 x n)
    (if (even? x)
        (extract2 (/ x 2) (+ n 1))
        n))
  (extract2 z 0))

(define (cdr z)
  (iterative-exp 3 0 1 (/ z (expt 2 (car z)))))

(define test (cons 2 4))
(car test)
(cdr test)
