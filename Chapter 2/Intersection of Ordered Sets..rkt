#lang sicp
#|Intersection of Ordered Sets
@Author - Soumitra Pandit
@Date - 18th September 2023
|#

; (1 2 3 4)
; (4 5 6 8)
; (5 20 42)

;How can I leverage the fact that _both_ of the
;Sets are ordered?

(define (element-of-set? x set)
  (cond ((null? x) true)
        ((null? set) false)
        ((< x (car set)) false)
        ((equal? x (car set)) true)
        (else(element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1)(null? set2))
      '()
      (let ((x1 (car set1))) ((x2 (car set2)))
        (cond ((= x1 x2)
               (cons (x1
                      (intersection-set (cdr set1)
                                        (cdr set2)))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              (else
               (intersection-set set1 (cdr set2)))))))

;I mean, this is a good way to "short" paths that would
;otherwise be taken in our earlier implementation.
;But I was thinking along the lines of moving windows
;where one of the lists is reversed.
;Maybe someday later.
;Oh wow. Apparently, this algorithm is reducing the complexity
;From O(n^2) to O(n).
;Which is substantial and impressive.
       