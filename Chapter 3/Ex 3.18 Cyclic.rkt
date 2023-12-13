#lang sicp
#|Ex 3.18 Cycle?
@Author - Soumitra Pandit
@Date - 8th November 2023
|#

;This takes me back to Tideman.
;And the question still is, how do you find a Cycle?
;I think with Tideman, I solved it with the number of
;repetitions or something like that.
;And it might even be worth revisiting that solution.
;But with this, I need a generalised approach.

;Lets write pseudo-code


(define (cyclic? seq)
  (let ((seq-list '()))
    (define (find-cycles seq)
      (cond ((not (pair? seq))
             false)
            ((memq seq seq-list)
             true)
            (else
             (set! seq-list (cons seq seq-list))
             (or (find-cycles (car seq))
                 (find-cycles (cdr seq))))))
    (find-cycles seq)))


(define (cycle? x)
  (let ((visited '()))
    (define (cycle-helper x)
      (cond ((not (pair? x))
             #f)
            ((memq x visited)
             #t)
            (else
             (set! visited (cons x visited))
             (or (cycle-helper (car x))
                 (cycle-helper (cdr x))))))
    (cycle-helper x)))


;This should work
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