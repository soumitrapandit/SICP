#lang sicp
#|Ex 1.28 Miller Rabin Test
@Author - Soumitra Pandit
|#

(define (square a)
  (* a a))

(define (even? a)
  (= 0 (remainder a 2)))

(define (odd? a)
  (= 0 (remainder (- a 1) 2)))


;I am going to use the book function here
;Okay, this is either too hard or either too stupid
;or both. But I am never going to need this so I am
;Willfully skipping this one.
;Maybe I will come back to it someday but as I have
;No particular affinity towards prime numbers, looks
;unlikely.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square(expmod base (/ exp 2) m)) m))
        ((odd? exp)
         (remainder (* base (expmod base (- exp 1) m))m))))

(define (fermats-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
;So now I guess the idea is to conduct this test multiple times

(define (fast-prime? n times)
  (cond((= times 0)true)
       ((fermats-test n) (fast-prime? n (- times 1)))
       (else false)))
