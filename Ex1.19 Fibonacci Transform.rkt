#lang sicp
#|Exercise 1.19|#
#|Fibonacci using Transforms|#
#|This is truly a brilliant algorithm
and I for one cannot imagine how you'd
land at something like this. The basic
insight is so subtle - seeing a function
and thinking that it can probably be expressed
as a special case of an iterable transform.
I want to be able to do this - to be creative
at this level. Don't underestimate yourself.
You probably can be this creative.|#

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)b)
        ((even? count)
         (fib_iter a
                   b
                   (+(square q) (* 2 p q))
                   (+ (square p) (square p))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
