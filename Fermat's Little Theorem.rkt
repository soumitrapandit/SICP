#lang sicp
#|Fermat's Little Theorem
@Author - Soumitra Pandit|#
#|The theorem states that given n and a, if n is prime
and a is a positive number less than n then a^n is congruent
to a modulo n, whatever that means. Apparently, it means
that a^n - a is divisible by n.|#

;So we need a function that compares the modulo of two separate
;but related quanities
(define (square a)
  (* a a))

(define (even? a)
  (= 0 (remainder a 2)))

(define (odd? a)
  (= 0 (remainder (- a 1) 2)))


(define (exponent a n)
  (if (= n 0)
      1
      (cond ((even? n)
             (exponent (square a) (/ n 2)))
            ((odd? n)
             (* a (exponent a (- n 1)))))))

(define (expmod n);Thats the prime to be tested
  (let ((a-raisedto-n (lambda (a) (exponent a n))))
    ;So I have a raised to n
    ;Now I need to ascertain if its congruent modulo
    (lambda (a) (= (remainder (a-raisedto-n a) n)
                   a))))

;(define (fermats-test a suspected-prime)
; ((expmod suspected-prime)a))

;So now I need a function that will do the fermat's Test some n
;number of times
;So fermat's test is performed by choosing at random a number a between
;1 and n-1 inclusive. We can do this with Random which returns a nonnegetive
;integer less than its integer input

(define (fermats-test suspected-prime)
  ((expmod suspected-prime) (random suspected-prime)))

;So now I guess the idea is to conduct this test multiple times

(define (fast-prime? n times)
  (cond((= times 0)true)
       ((fermats-test n) (fast-prime? n (- times 1)))
       (else false)))
  

;So how many do we actually need to test?
(fast-prime? 17 6)



(exponent 3 1)
(exponent 3 2)
(exponent 2 2)
(exponent 2 5)
