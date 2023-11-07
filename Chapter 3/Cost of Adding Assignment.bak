#lang sicp
#|Cost of Adding Assignment
@Author - Soumitra Pandit
@Date - 9th Ocotber 2023

We're learning the costs of introducing assignment in our so far
functional world. Suddenly, procedures are no longer functions.
But something more?
|#

(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance))

(define W (make-simplified-withdraw balance 25))

(W 20)

(W 10)


(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))

;Notice that there is no assignment in the second case.
;So I expect it to run with balance to be whatever we defined it to be
;Which is kind of cool.

;If I am forced to think about set functionally, I would describe it like this.
;
;(define (change-this-variable n)
;Wait, I can't. Because I would end up using set in the definition itself. So there is
;truly no way to do this functionally, I believe.

;The substitution model can explain make-decrementer. But not the other program, can it?
;