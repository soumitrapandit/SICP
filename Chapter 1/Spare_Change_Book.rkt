#lang sicp
#|This is the book solution for the problem
I was surprisingly close to it
I have to code this because I am getting a contract violation
on my code and don't exactly get it
|#

(define (count-change amount) (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 50)
(count-change 100)

#|I Learnt That
I need better variable names
I also need clearer thinking
I don't know why my code didn't even run
But I am going to figure that out
I also really like the level of abstraction
Abstraction, when dealt with properly, makes life easier
Also, this is fundamentally different in a few key ways
than what I was trying to implement
I was trying to split the node simultaneous
But the book chose a more stepwise approach
where the nth coin calls the n-1th coin
That is pretty neat. I was calling them independently
Twice. This is really beautiful code though. I love it|#