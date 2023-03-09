#lang sicp
#|Ex 1.39 Lambert's Formula for Tangent approximation
@Author - Soumitra Pandit
|#
(define (square x)(* x x))

(define (lamberts-numerator x)
  (lambda (k)
    (if (= k 1)
        x
        (square x))))

(define (lamberts-denominator k)
  ;Should return k'th odd number
  (- (* 2 k) 1))

(lamberts-denominator 4)

(define (cont-frac n d k)
  (define (cont-frac-iter n d k fraction)
    (if (= 0 k)
        fraction
        (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) fraction)))))
  (cont-frac-iter n d k 0))

(define (lambert-formula x k)
  (cont-frac (lamberts-numerator x) lamberts-denominator k))

(lambert-formula 3.14 122)