#lang sicp
#|A Simulator for Digital Circuits
@Author - Soumitra Pandit
@Date - 25th November 2023

The idea is to build the elements of a digital circuit and have fun while doing so.
Lets see what we can create.

|#
#|
(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
(define d (make-wire))
(define e (make-wire))
(define f (make-wire))
|#

;An Inverter is a primitive function box that inverts the input
;Also, we have a time delay before the input is released.
;Primitive function boxes implement the "forces" by which a change in the signal on one
;wire influences the signals on other wires.
;And thus we have these interfaces
;(get-signal wire) - returns the current value of the signal on the wire.
;(set-signal! wire new-value) - changes the value of the sigal on the wire to the new value
;(add-action! wire procedure-without-arguments) - asserts that the designated procedure should be run whenever the signal on the wire changes value
;Okay so the last one is quite interesting. So we have to somehow keep a watchful eye on the state of a variable.
;How do we do that, exactly?
;And what about conflicts? What if the value is changed when we are in the refactory period?

;==============================================================================================
;Define Make Wire
(define (make-wire)
  (let ((signal-value 0) (action-procedures '()))

    (define (set-my-signal! new-value)
      (if (not (= signal-value new-value))
          (begin (set! signal-value new-value)
                 (call-each action-procedures))
          'done))
    
    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures))
      (proc))

    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
            ((eq? m 'set-signal!) set-my-signal!)
            ((eq? m 'add-action!) accept-action-procedure!)
            (else (error "Unknown operation -- WIRE" m))))
    dispatch))

(define (call-each procedures)
  (if (null? procedures)
      'done
      (begin
        ((car procedure)) ; Calling the last procedure added to the list
        (call-each (cdr procedure)))))


;Okay so the message passing itself makes sense.
;I am trying to make sense of the implementaion.
;action-procedure is basically a "history"of the procedures
;that have used the wire.
;So why does it make sense to invoke the last addition first?
;Shouldn't we start fromt the first procedure and then work our
;way to the last?
;What the fuck is happening?



(define (get-signal wire)
  (wire 'get-signlal))

(define (set-signal! wire new-value)
  ((wire 'set-signal) new-value))

(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure))

(define inverter-delay 10)
(define and-gate-delay 10)
(define or-gate-delay 20)

;===========================================================================
;The Agenda
;So this seems to be the path towards concurrency
;Or at least time dependency.
;Lets see how this data structure is implemented. And what it does.


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
;Or Gate
(define (or-gate a1 a2 output)
  (define (or-gate-procedure)
    (let ((new-value (logical-or (get-signal a1)
                                 (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 or-gate-procedure)
  (add-action! a2 or-gate-procedure)
  'or)

(define (logical-or a1 a2)
  (cond ((or (= 1 a1) (= 1 a2)) 1)
        ((not(and
              (or (= 1 a1) (= 0 a1))
              (or (= 1 a2) (= 0 a2))))
         (error "Invalid Input" a1 a2))
        (else 0)))
;--------------------------------------------------------

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


(logical-and 1 0)