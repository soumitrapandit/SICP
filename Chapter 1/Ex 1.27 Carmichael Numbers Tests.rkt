#lang sicp
#|Ex 1.27 Carmichael Numbers
@Author - Soumitra Pandit
Testing out the expmod function with Carmichael Numbers
|#

;Write a procedure that takes an integer n and tests whether a^n is
;congruent to a modulo n for every a<n
(define (square a)(* a a))
(define (even? a)
  (= 0 (remainder a 2)))
(define (odd? a)
  (even? (+ a 1)))

(define (divides? a b)
  (= 0 (remainder a b)))

(define (find-divisor n divisor)
  (cond ((> (square divisor) n) n)
        ((divides? n divisor) divisor)
        (else (find-divisor n (+ divisor 1)))))

(define (find-lowest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (find-divisor n 2)))

(define (a-raised-to-n a n)
  (cond ((= n 0) 1)
        ((even? n) (a-raised-to-n (square a) (/ n 2)))
        ((odd? n) (* a (a-raised-to-n a (- n 1))))))

(define (expmod a n)
  (= a (remainder (a-raised-to-n a n) n)))

(define (carmichael? n)
  (define (carmichael-test a)
    (cond ((= a n) true)
          (else (and (expmod a n) (carmichael-test (+ a 1))))))
  (and (not(prime? n))(carmichael-test 2)))

(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)