#lang sicp
#|Exercise 1.17
Okay,
so what is the logic here?
let me think
I will have to check if b is even
if b is even then what can I do?
2a = a + a
4a = 2a + 2a
so this is exactly equivalent to what
we just did
should be straightforward
|#

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (* a b)
  (if ((= b 0) 0)
      (+ a (* a (- b 1)))))

(define (even? n)
  (= (remainder n 2)0))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

(fast-mult 2 2)
(fast-mult 2 1)
(fast-mult 2 3)

