#lang sicp
#|Heirarchical Structures
@Author - Soumitra Pandit
|#

;How can we count the leaves of such a structure?
;Lets see
;So what is different between the two tree?
;Lets add a third tree and see?
;this is very interesting
;Lets play around more

;So to build count-leaves, we would most probably have to go through each branch till there is no leaf

(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree)) (count-leaves (cdr tree))))))


(define tree1 (cons (cons (cons (list 1 2) (list 3 4)) (list 5 6)) (list 7 8)))
(define tree2 (cons (list 1 2 3 4) (list 5 6 7 8)))
(define tree3 (cons (cons (cons (cons 1 2) (cons 3 4)) (cons 5 6)) (cons 7 8)))
(define tree4 (cons (list 1 2) (list 3 4)))
tree1
tree2
tree3
tree4

(car tree4)
(cdr tree4)
(count-leaves tree4)