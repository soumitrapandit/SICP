#lang sicp
#|Sets represented as Trees
@Author - Soumitra Pandit
@Date - 19th September 2023
The tree data structure is not new.
But damn is it powerful. I am still
trying to wrap my mind around the possibilites
that arise due to this simple structure.
|#

(define (make-tree element left right)
  (list element left right))

(define (element tree)
  (car tree))

(define (left-subtree tree)
  (cadr tree))

(define (right-subtree tree)
  (caddr tree))

(define (element-of-set? x set)
  ;we are assuming that set is in tree form
  (cond ((equal? (element set) x) true)
        ((< (element set) x)
         (if (null? (right-subtree set))
             false
             (element-of-set? x (right-subtree set))))
        ((> (element set) x)
         (if (null? (left-subtree set))
             false
             (element-of-set? x (left-subtree set))))))

;How do we implement adjoin?
(define (adjoin x set)
  (

(define tree-1 (make-tree 3 (make-tree 2 '() '()) (make-tree 4 '() '())))
(define tree-0 (make-tree 5 tree-1 (make-tree 6 '() '())))

tree-0
(element-of-set? 4 tree-0)
(element-of-set? 5 tree-0)
(element-of-set? 1 tree-0)