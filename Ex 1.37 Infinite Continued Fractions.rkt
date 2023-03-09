#lang sicp
#|Exercise 1.37 Infinite Continued Fractions
Author - Soumitra Pandit|#

(define (cont-frac a b k)
  (define (add-frac a b i)
    (if (= i k)
        (/ (a i) (b i))
        (/ (a i) (+ (b i) (add-frac a b (+ i 1))))))
  (add-frac a b 1))

(define (golden-ratio k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(golden-ratio 12)
(golden-ratio 100)
(golden-ratio 10000)