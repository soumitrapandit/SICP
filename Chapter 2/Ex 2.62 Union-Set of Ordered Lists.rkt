#lang sicp
#|Ex 2.62 Union Set for ordered lists
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

;I am trying to understand how to do this.
;And why ordering a list might help out in this case
;Also, isn't my original implementation O(n)?
;(1 2 3) (2 3 4 5 6)
;What does the algorithm look like in English?
;Is there any meaningful way to leverage the fact that
;the sets are ordered?
;Not that I can think of, right now.

;I think we can work down just a single set

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((< (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        ((= (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) (cdr set2))))
        ((> (car set1) (car set2))
         (cons (car set2) (union-set set1 (cdr set2))))))

;This should work

(union-set (list 1 2 3) (list 0 1 2 3 4 5))

;Works.