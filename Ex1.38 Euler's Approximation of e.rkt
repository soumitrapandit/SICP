#lang sicp
#| Exercise 1.38
@Author - Soumitra Pandit|#

;So we are going to write a function that will
;produce the denominators
;So what is the sequence?
;1,2,1,1,4,1,1,6,1,1,8... and so on
;1,2,3,4,5,6,7,8,9,10,11


#|Exercise 1.37 Infinite Continued Fractions
Author - Soumitra Pandit|#

(define (euler-denom i)
  (let ((r (remainder (- i 3) 2)))
    (cond ((= i 1) 1)
          ((= i 2) 2)
          ((= r 0) (expt 2 r))
          (else 1))))

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
(define (eulers-approximation k)
  (cont-frac (lambda (i) 1.0)
             euler-denom 
             k))

#|(golden-ratio 12)
(golden-ratio 100)
(golden-ratio 10000)|#

(eulers-approximation 100)
(eulers-approximation 10000)