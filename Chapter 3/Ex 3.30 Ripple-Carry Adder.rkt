#lang sicp
#|Ex 3.30 Ripple Carry Adder
@Author - Soumitra Pandit
@Date - 26th November 2023

So we want to conjure up a full adder for every element of the input lists.
And then we want to output the result in a list as well.
This is a bit involved.
Also, I am not entirly sure what is being tested here.
Well, lets find out.

|#

(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    ;So we now have two environments for the two wires, I think.
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

;Oh this is brilliant.

(define (ripple-adder A B S C)
  ;The first thing we notice is that
  ;all the Sk are already defined within S
  ;So are we just changing their state?
  ;And we _do_ need to do it serially for the sake of C
  ;That is super cool
  (cond ((null? A) S)
        (else
         (full-adder (car A) (car B) (car C) (car S) (cadr C))
         (ripple-adder (cdr A) (cdr B) (cdr S) (cdr C))))
  'This is fucking amazing)

;I think this is the first time that we have actually used the power of functional
;programming in conjunction with assignment.
;Or at least this is the first seamless instance.