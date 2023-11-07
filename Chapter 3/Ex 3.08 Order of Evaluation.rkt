#lang sicp
#|Ex 3.08 Order of Subexpression Evaluation
@Author - Soumitra Pandit
@Date - 10th October 2023
|#

(define (f n)
  (let ((output 1))
    (if (= n 0)
        (begin (set! output 0) output)
        (begin (set! output 1) output))))

;(f 0)
;(f 1)

;(+ (f 1) (f 0))

;(+ (f 0) (f 1))

;Somehow, I am capturing the variable, right?
;What else could be the explanation of my results?

;Also, it is becoming painfully obvioius to me that I don't
;really understand assignment. So let me think about it.
;What do I not understand?
;First of all, the function above is just incorrect.
;Its not logical at all. I am using an if statement but I am using
;it in a "functional way, if that makes sense.
;What can I do?

(define (g n)
  (let ((output 1))
    (set! output (* output n))
    output))

;(+ (g 0) (g 1))

;(+ (g 1) (g 0))

;I think I am still making a logical mistake.
;I want a function that sets the state of an
;internal variable to 0 if the input is 0
;And sets the internal state variable to 1
;if the input is 1.


(define k
  (lambda (input)
    (let ((state 0) (next 0))
      (begin (set! state next)
             (set! next (+ state input))
             state))))

(+ (k 0) (k 1))
;Perfect!

;I learnt that :-
;This is something I have struggled with before.
;I think it was my first factorial program where I tripped on
;Imperative programming.
;For some reason, functional programming comes naturally to me
;But with imperative programming, something as simple as adding another
;local variable is the last thing I think of.
;It just feels ...clumsy. Like I am cheating somehow.
;Anyway, I think part of the charm of this process is going to be learning to
;think in terms of state variables and tracking change.