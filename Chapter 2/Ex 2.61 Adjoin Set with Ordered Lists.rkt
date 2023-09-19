#lang sicp
#|Ex 2.61 Adjoin Set for ordered lists
@Author - Soumitra Pandit
@Date - 18th September 2023
|#

(define (element-of-set? x set)
  (cond ((null? x) true)
        ((null? set) false)
        ((< x (car set)) false)
        ((equal? x (car set)) true)
        (else(element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1)(null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons (x1
                      (intersection-set (cdr set1)
                                        (cdr set2)))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              (else
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (cond((null? set) (list x))
       ((= x (car set)) set)
       ((< x (car set))(cons x set))
       (else(cons (car set) (adjoin-set x (cdr set))))))

;This should work

(adjoin-set 4 (list 1 2 3))
(adjoin-set 4 (list 1 2 3 5 6))
(adjoin-set 4 (list 1 2 3 4))