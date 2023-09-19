#lang sicp
#|Ex 2.60 Sets with recurring elements
@Author - Soumitra Pandit
@Date - 18th September 2023
For educational purposes, we are going to
ignore the unique members only clause that sets
usually have. I already don't like it.
We can have multiple copies of elements and we
would still have to go through the entire list
to get a match.|#

;How is the intersection procedure going to change?
;How is the union procedure going to change?
;Do they even have to change?
;Can't we just work with the stuff
;That we have already created? I personally don't see
;A significant drawback to this.



(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? (car set) x) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (intersection-set (cdr set1) set2)))


(element-of-set? 4 (list 1 3 5 5 5 4))

;So yeah, we can just use the old procedures because they still do
;their job.
;And no, I would never use this representation for set.
;Kind of looses the meaning of a "set".