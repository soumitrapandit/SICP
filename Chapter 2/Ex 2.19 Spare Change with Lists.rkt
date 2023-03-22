#lang sicp
#|Ex 2.19 Count Change Varied
@Author - Soumitra Pandit
|#

;Okay, How would I do this, if I wanted to count change
;in different currency types?

;Well, the basic program remains the same
;Let me quickly write that down


(define (cc amount coin-values)
  (cond ((= amount 0)1)
        ((or (< amount 0)(no-more? coin-values))0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                (first-denomination coin-values))
                coin-values)))))

(define (first-denomination coin-values)
  ;returns the first element of the list
  (car coin-values))

(define (except-first-denomination coin-values)
  ;returns the list without the first element
  (cdr coin-values))

(define (no-more? coin-values)
  ;checks if list is empty
  (null? coin-values))

(define uk-list (list 100 50 20 10 5 2 1 0.5))
(define us-list (list 50 25 10 5 1))
(cc 50 us-list)
(cc 100 us-list)
(cc 50 uk-list)