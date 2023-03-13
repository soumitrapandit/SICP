#lang sicp
#|1.2.4 Exponentiation
The idea is quite simple. But how do we convert it to
code that actually reduces the number of calculations?
Because that's the whole point of this section
When I do (fast-expt b n) I want it to do what?
What is the base case?
if n == 1
return b
else
(* b (fast-expt b (- n 1)))
Okay, that is pretty good. But how is that going to save me
any multiplications? This seems like good old fashioned
exponentiation.
b^2 = b*b
b^4 = b^2*b^2
b^8 = b^4*b^4
okay
b^3 = b*b^2
So the real question is - How do I write this so that
I don't have to calculate b^n twice
b^2 is the only time, I will have to do b*b
oh,
if n == 0
return 1
if n == 1
return b
if n is odd
return b*(fast-exp b (- n 1))
if n is even
return (fast-exp (* b b) (- n 2))
should work, no?
Wait, did I fuck up? Aye. Shouldn't be n-2. it should be n/2
Though I am kinda curious about what happens if I roll with this logic instead.
|#

(define (even? n)
 (=(remainder n 2) 0))

(define (sqaure n)
  (* n n))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n)
         (square (fast-expt b n/2)))
        (else (* b (fast-expt b (- n 1))))))

;This is quite beautiful though.
         
 