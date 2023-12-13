#lang sicp
#|Ex 3.28
@Author - Soumitra Pandit
@Date - 25th November 2023

This is quite straightforward.
Just for the record, this implementation won't run here
but it will run in the script named "Digital Cricuit Simulator"
or something along those lines. I have not decided yet.
|#

(define (or-gate a1 a2 output)
  (define (or-gate-procedure)
    (let ((new-value (logical-or (get-signal a1)
                                 (tget-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal output new-value)))))
  (add-action! a1 or-gate-procedure)
  (add-action! a2 or-gate-procedure)
  'or)