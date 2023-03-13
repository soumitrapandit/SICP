#lang sicp
#|Ex 1.31|#
;The idea is identical to the one we used for product
;The only difference is that we're going to multiply instead of adding
;How does that change the procedures?
;Let's find out

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)(product term (next a) next b))))

;defining factorial in terms of product
(define (inc k)
    (+ k 1))

(define (factorial n)
  (define (identity t)
    t)
  (product identity 1 inc n))

(factorial 10)
(factorial 3)

;Finding out the approximations to pi
(define (even? n)
  (= (remainder n 2) 0))

(define (pi_approx n)
  (define (pi_term t)
    (if (even? t)
        (/ (+ t 1) (+ t 2))
        (/ (+ t 2) (+ t 1))))
  (*(product pi_term 1.0 inc n) 4))

(pi_approx 1000)
