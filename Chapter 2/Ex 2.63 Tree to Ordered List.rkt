#lang sicp
#|Ex 2.63 Tree to List
@Author - Soumitra Pandit
@Date - 20th September 2023
I think the book is forcing me to
think algorithmnically and make
educated guesses about the
complexities of programs.
I have love/hate relationship with
this topic because its really cool
but also really tedious.
|#

;================================================
;Implementing a Tree Structure
;================================================
(define (make-tree element left right)
  (list element left right))

(define (element tree)
  (car tree))

(define (left-subtree tree)
  (cadr tree))

(define (right-subtree tree)
  (caddr tree))

(define tree-1 (make-tree 3 (make-tree 2 '() '()) (make-tree 4 '() '())))
(define tree-0 (make-tree 5 tree-1 (make-tree 6 '() '())))

tree-0

;------------------------------------------------------------------------
;Test trees

(define test-tree1 (make-tree 7
                               (make-tree 3
                                          (make-tree 1 '() '())
                                          (make-tree 5 '() '()))
                               (make-tree 9
                                          '()
                                          (make-tree 11 '() '()))))

(define test-tree2 (make-tree 3
                               (make-tree 1
                                          '()
                                          '())
                               (make-tree 7
                                          (make-tree 5 '() '())
                                          (make-tree 9
                                                     '()
                                                     (make-tree 11
                                                                '()
                                                                '())))))

(define test-tree3 (make-tree 5
                               (make-tree 3
                                          (make-tree 1 '() '())
                                          '())
                               (make-tree 9
                                          (make-tree 7 '() '())
                                          (make-tree 11 '() '()))))
test-tree1
test-tree2
test-tree3
;------------------------------------------------------------------------
(define (tree->list1 tree)
  (if (null? tree)
      '()
      (append (tree->list1 (left-subtree tree))
              (list (element tree))
              (tree->list1 (right-subtree tree)))))

(tree->list1 tree-0)
(tree->list1 test-tree1)
(tree->list1 test-tree2)
(tree->list1 test-tree3)
;-------------------------------------------------------------------------
(define (tree->list2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-subtree tree)
                              (cons (element tree)
                                    (copy-to-list (right-subtree tree)
                                                  result-list)))))
  (copy-to-list tree '()))


(tree->list2 tree-0)
(tree->list2 test-tree1)
(tree->list2 test-tree2)
(tree->list2 test-tree3)