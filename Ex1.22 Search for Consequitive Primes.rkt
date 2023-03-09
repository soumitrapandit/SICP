#lang sicp
#|Ex 1.22 Search for prime
@Author - Soumitra Pandit|#
(define (square a)
  (* a a))

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

(define (timed-prime-test n)
  (newline)
  (display n)
  (newline)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))

;That last test is cheeky
;But now we can move onto the search for primes function
;So we want our function to test for primes in a range
;Well, I would need to devlop a function for that range

(define (next-odd a)
  (+ a 2))

;And I have to use timed-prime-test

;Wait wait, let me think. So we are testing odd numbers within a range for seriality
;so the main function is about looping through odd numbers
;given a range
;This is not that convoluted, so I don't have to make it hard unnecessarily

(define (primes-in-range range current next)
  (cond ((= range 0) (newline))
        ((prime? current) (and (timed-prime-test current)(primes-in-range (- range 1) (next current) next)))
        (else (primes-in-range range (next current) next))))

(define (search-for-primes start-value n)
  (if (odd? start-value)
      (primes-in-range n start-value next-odd)
      (primes-in-range n (+ 1 start-value) next-odd)))

(search-for-primes 10000 1)
(search-for-primes 100000 1)
(search-for-primes 1000000 1)
(search-for-primes 10000000 1)
