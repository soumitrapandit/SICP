#lang sicp
#|Ex 3.34 Squarer
@Author - Soumitra Pandit
@Date - 29th November 2023

So apparently, there is a flaw in this logic and I have to find it.
Okay.

|#

(define (squarer a b)
  (multiplier a a b))

;Okay, so what's wrong with this?

;We are assuming that a and b have been defined as connectors.
;So where can we go wrong?

;Oh, if we start with b, there is no way to get to either of the a's.

;The ciruit will fail.

;Amazing. You need two independent connectors
;And I guess you need an additional constraint which states that a1 and a2 are the same
;or something like that.
;Because the multiplier doesn't take this into account and will think that there is insufficient
;information.