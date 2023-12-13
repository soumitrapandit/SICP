#lang sicp
#|Ex 3.33 Averager Constraint Network
@Author - Soumitra Pandit
@Date - 29th November 2023

So the idea is to familiarize yourself with the (higher level)
implementation of the constraint system and then design an averager.

I think I can do that.


|#

(define (averager a b c)
  ;So here, a b and c are already connectors, I am guessing
  ;So for an averager,
  ;all we need is a constant, 2
  ;an adder
  ;and a multiplier
  (let ((u (make-connector))
        (v (make-connector))
        (w (make-connector)))
    (adder a b u)
    (constant 2 v)
    (multiplier v c u)
    'ok))

;This should work.