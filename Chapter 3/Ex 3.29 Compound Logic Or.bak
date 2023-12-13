#lang sicp
#|Ex 3.29 Compound Logical Or Gate
@Author - Soumitra Pandit
@Date - 25th November 2023
So how can we make an Or-Gate from And Gates and Inverters?
This is how, apparantly.
|#


(define (get-signal input)
  'ok)
(define (set-signal! input)
  'ook)
(define (add-action! input)
  'oook)

(define inverter-delay 10)
(define and-gate-delay 10)
(define or-gate-delay 20)

(define (after-delay type action)
  (cond ((= type 'inverter-delay) 'okay)
        ((= type 'and-gate-delay) 'okay)
        ((= type 'or-gate-delay) 'okay)))
;----------------------------------------------------------
;Inverter
(define (inverter input output)
  (define (invert-input)
    ;Becuase I guess we need a wrapper
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay 
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'inverted)


(define (logical-not input)
  (cond ((= input 0) 1)
        ((= input 1) 0)
        (else (error "Invalid signal" input))))
;---------------------------------------------------------
;And Gate
(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value (logical-and (get-signal a1)
                                  (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'and)

(define (logical-and a1 a2)
  (cond ((and (= 1 a1) (= 1 a2)) 1)
        ((not(and
              (or (= 1 a1) (= 0 a1))
              (or (= 1 a2) (= 0 a2))))
         (error "Invalid Input" a1 a2))
        (else 0)))
;---------------------------------------------------------
;Complex Or-Gate

;So the first question that comes up is do we need to use
;add-action!
;And I think that the answer is yes, unequivocally as we need
;a crucial part of its functionality.
;But won't we be using it implicity with our network of and-gates and inverters?
;Okay, let me first understand the logical arrangement and then I can ponder over this.

#|
How can I represent or as a set of ands and nots?

             or|and|(and (not a1) a2)|(and a1 (not a2)) |
(proc 1 1) = 1 | 1 | 0               | 0                |   
(proc 0 1) = 1 | 0 | 1               | 0                |
(proc 1 0) = 1 | 0 | 0               | 1                |    
(proc 0 0) = 0 | 0 | 0               | 0                |


Okay so that definitely took a lot longer than needed.
But that's fine, I enjoyed the journey.

(not (and (not a) (not b)))

|#
(define (or-gate a1 a2 output)
  (define (or-gate-procedure)
    (make-wire a3)
    (make-wire a4)
    (make-wire a5)
    (lambda ()
      (invert a1 a3)
      (invert a2 a4)
      (and-gate a3 a4 output)
      (invert a5 output)))
  (add-action! a1 or-gate-procedure)
  (add-action! a2 or-gate-procedure)
  'or)