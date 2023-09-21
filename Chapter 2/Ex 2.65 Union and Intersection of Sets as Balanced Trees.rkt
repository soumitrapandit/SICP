#lang sicp
#|Ex 2.65 Union-set and Intersection-set in Balanced Trees
@Author - Soumitra Pandit
@Date - 20th September 2023
And we're supposed to implement these in O(n).
The procedure I have developed for converting an ordered set to
a balanced binary tree is O(n), right?
Let me think.
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

;================================================================================================
;Tree to List
(define (tree->list1 tree)
  (if (null? tree)
      '()
      (append (tree->list1 (left-subtree tree))
              (list (element tree))
              (tree->list1 (right-subtree tree)))))

(define (tree->list2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-subtree tree)
                              (cons (element tree)
                                    (copy-to-list (right-subtree tree)
                                                  result-list)))))
  (copy-to-list tree '()))

;==================================================================================================
;My implementation of Balanced Trees from ordered Lists

;--------------------------------------------------------------------------------------------------

;Main function:
(define (list->tree set)
  (cond ((null? set) '())
        ((= (length set) 1) (make-tree (car set) '() '()))
        ((= (length set) 2) (make-tree (car set) '() (list->tree (cdr set))))
        (else (let ((mid (middle-of-set set)))
                ;(display mid)
                ;(newline)
                (let ((remaining-set (exclude mid set)))
                  ;(display remaining-set)
                  ;(newline)
                  (let ((mid-split (split-set remaining-set)))
                    ;(display mid-split)
                    ;(newline)
                    (let ((left-half (car mid-split)) (right-half (cdr mid-split)))
                      ;(and (display left-half) (display right-half))
                      ;(newline)
                      (make-tree mid (list->tree left-half) (list->tree right-half)))))))))

;-------------------------------------------------------------------------------------------------

;Accumulate:
(define (accumulate op base-value seq)
  (if (null? seq)
      base-value
      (op (car seq) (accumulate op base-value (cdr seq)))))

;-------------------------------------------------------------------------------------------------

;Length implemented as a special case of Accumulate
(define (length set)
  (accumulate (lambda (x y) (+ 1 y)) 0 set))

;-------------------------------------------------------------------------------------------------

;Find the Middle element of a Set
(define (middle-of-set set)
  (define (nth-element set n)
    (if (= n 0)
        (car set)
        (nth-element (cdr set) (- n 1))))
  (cond ((null? set) '())
        ((= (length set) 1) (car set))
        (else (nth-element set (- (round (/ (length set) 2)) 1)))))

;--------------------------------------------------------------------------------------------------

;Split a set into two halves
(define (split-set set)
  (define (nth-split set n result-set)
    ;(and (display "n is ")(display n))
    ;(newline)
    ;(and (display set) (display result-set))
    ;(newline)
    (cond ((null? set) '())
          (else (if (= 0 n)
                    (cons result-set set)
                    (nth-split (cdr set) (- n 1) (append result-set (list (car set))))))))
   (nth-split set (-(round (/ (length set) 2)) 1) '()))

;---------------------------------------------------------------------------------------------------

;Find the right half of a set
(define (right-half set)
  (cdr (split-set set)))

;Find the left half of a set
(define (left-half set)
  (car (split-set set)))

;---------------------------------------------------------------------------------------------------

;Filter
(define (filter predicate seq)
  (cond ((null? seq) seq)
        ((predicate (car seq))
         (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

;---------------------------------------------------------------------------------------------------
;Exclude as a special case of filter
(define (exclude x set)
  (filter (lambda (y) (not (equal? x y))) set))

;---------------------------------------------------------------------------------------------------
;I think algorithmically, a union would be the union of two ordered sets. The intersection
;would be the intersection of two ordered sets and as the conversion operations and everything in
;between is O(n), the entire procedure would be O(n).
;Lets try it out.

;===================================================================================================
;Set operations -> Intersection of two sets and Union of Two sets. (Ordered Sets).

;Intersection of Sets.
(define (intersection-set set1 set2)
  (if (or (null? set1)(null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                        (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              (else
               (intersection-set set1 (cdr set2)))))))
(intersection-set (list 1 2 3 4) (list 3 4 5 6))
;Union of Sets.
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((< (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        ((= (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) (cdr set2))))
        ((> (car set1) (car set2))
         (cons (car set2) (union-set set1 (cdr set2))))))

;=====================================================================================================
;Intersection-Trees
(define (intersection-trees tree1 tree2)
  (intersection-set (tree->list1 tree1) (tree->list1 tree2)))


;Union-Trees
(define (union-tree tree1 tree2)
  (union-set (tree->list1 tree1) (tree->list1 tree2)))

;======================================================================================================
;Testing.

;Test trees
(define test-tree1 (list->tree (list 2 4 5 6)))
;(middle-of-set (list 2 4 5 6))
;(right-half (list 2 4 5 6))
(define test-tree2 (list->tree (list 5 8 9 10)))
(tree->list1 test-tree2)
(define test-tree3 (list->tree (list 1 2 3 4 5 7)))
(define test-tree4 (list->tree (list '())))
(define test-tree5 (list->tree '()))


;test-tree2
;test-tree3
;test-tree4
;test-tree5

;Test Intersection

(tree->list1 test-tree1)

(intersection-trees test-tree1 test-tree2)
;Okay, this works sufficiently enough that I am happy to move on.

