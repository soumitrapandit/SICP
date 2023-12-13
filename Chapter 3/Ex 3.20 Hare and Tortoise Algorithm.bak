#lang sicp
#|Ex 3.19 Cyclic with Constant Space
@Author - Soumitra Pandit
@Date - 8th November 2023
Now, how would we do this with constant space?
|#

;I think this is the hare and tortise  algorithm.
;So how would I implement it?
;Also, why am I going so slowly? It feels like I am walking through mud.
;Okay, the good thing is that lisp is forcing me to think about environments
;And everything that goes on in them. So that's good.
;Now, I have to think about the level at which I want to make this assignment.

#|
(define (cyclic? seq)
  (cond((not (pair? seq))false)
       ((or (not (pair? (cdr seq)))
            (not (pair? (cddr seq))))
        false)
       (else (let ((hare (cdr seq))
                   (tortoise (cddr seq)))
               (if (eq? hare tortoise)
                   true
                   (or (cyclic? (car seq))
                       (cyclic? (cdr seq))))))))
|#

(define (cyclic? seq)
  (define (run tortoise hare)
    (cond ((null? tortoise) false)
          ((null? hare)false)
          ((null?(cdr hare))false)
          ((null?(cddr hare)) false)
          ((eq? (car tortoise) (car hare)) true)
          (else (run (cdr tortoise) (cddr hare)))))
  (run seq (cdr seq)))

(define (cycle? x)
  (define (run tortoise hare)
    (cond ((null? tortoise)
           #f)
          ((null? hare)
           #f)
          ((null? (cdr hare))
           #f)
          ((null? (cddr hare))
           #f)
          ((eq? (car tortoise) (car hare))
           #t)
          (else
           (run (cdr tortoise) (cddr hare)))))
  (run x (cdr x)))

(define x (list 'a 'c))

(define z2 (list x x x))

(define (last-pair seq)
  (if (null?(cdr seq))
      seq
      (last-pair (cdr seq))))


(define (make-cycle seq)
  (set-cdr! (last-pair seq) seq)
  seq)

(make-cycle (list 1 2 3 4))


(define z (make-cycle '(a b c)))

(cyclic? x)

(cyclic? z2)

(cyclic? z)