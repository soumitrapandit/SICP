#lang sicp
#|Ex 2.31 Tree Map
@Author - Soumitra Pandit
@Date - 7th September 2023
The idea is to build a higher order procedure
that just applies a function to a tree in the way
that a map does a list
Kind of beautiful, if you think about it
I think I can even use map to achieve this|#

;I think the real challenge actually is using map
;in this implementation.
;I think I need to use like let statements and
;lambda functions in this implementation
;which would be a good revision

;Quick map implementation
(define (map f seq)
  (if (null? seq)
      nil
      (cons (f (car seq)) (map f (cdr seq)))))

;Square for testing
(define (square x) (* x x))

;Straightforward implementation
(define (tree-map-reg func tree)
  (cond ((null? tree) nil)
        ((not(pair? tree)) (func tree))
        (else (cons (tree-map-reg func (car tree))
                    (tree-map-reg func (cdr tree))))))

;Okay, so this, in my view, is the more elegant way
;to do this
;But its not working :(

(define (t-map tree)
  (lambda (f)
    (if (not(pair? tree))
        (f tree)
        (map t-map tree))))

(define (tree-map func tree)
  (t-map tree)func)

(define (square-tree tree) (tree-map square tree))

(define tree1 (list 1 2 (list 3 4) (list 5 6) 7 8))

(tree-map-reg square tree1)

(square-tree tree1)