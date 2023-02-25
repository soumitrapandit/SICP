#lang sicp
#|Exercise 1.18
We are continuing with this theme
But now we are going to use a reiterative process
|#

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (* a b)
  (if ((= b 0) 0)
      (+ a (* a (- b 1)))))

(define (even? n)
  (= (remainder n 2)0))

(define (fast-mult-iter a b sum)
  (cond ((= b 0) sum)
        ((= b 1) a)
        ((even? b)(fast-mult-iter (double a) (halve b) a))
        (else (+ a (fast-mult-iter a (- b 1) sum)))))

(define (fast-mult a b)
  (fast-mult-iter a b 0))

(fast-mult 2 2)
(fast-mult 2 1)
(fast-mult 2 3)
(fast-mult 5 5)