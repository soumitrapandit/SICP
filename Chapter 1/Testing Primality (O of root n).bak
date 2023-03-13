#lang sicp
#|Testing for Primality|#
(define (divides? a b)
  (= (remainder a b) 0))

(define (square a)
  (* a a))

(define (find_smallest_divisor n)
  (find_divisor n 2))

(define (find_divisor n divisor)
  (cond((> (square divisor) n) n)
       ((divides? n divisor) divisor)
       (else (find_divisor n (+ divisor 1)))))

(define(is_prime? n)
  (= (find_smallest_divisor n) n))

;Test Cases
(is_prime? 54)
(is_prime? 4)
(is_prime? 13)
(is_prime? 5)
(is_prime? 64)