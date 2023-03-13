#lang sicp
#|Ex 1.33 Filtered Accumulate|#
;So this seems like a bit of boolean logic sprinkled into
;our general accumulator

(define (prime? n)
  (= (find-lowest-divisor n) n))

(define (divides? a b)
  (= (remainder a b) 0))

(define (find-divisor n divisor)
  (cond ((> (square divisor) n) n)
        ((divides? n divisor) divisor)
        (else (find-divisor n (+ divisor 1)))))

(define (find-lowest-divisor n)
  (find-divisor n 2))

(define (square n)
  (* n n))

(define (identity t)
  t)

(define (inc a)
  (+ a 1))

(define (filtered-accumulate term a next b null combiner filter)
  (cond ((= a b) null)
        ((filter a)(combiner (term a) (filtered-accumulate term (next a) next b null combiner filter)))
        (else (filtered-accumulate term (next a) next b null combiner filter))))

(define (sum-of-prime-squares a b)
  (filtered-accumulate square a inc b 0 + prime?))

;(sum-of-prime-squares 0 2)
;(sum-of-prime-squares 1 4)
(sum-of-prime-squares 4 19)