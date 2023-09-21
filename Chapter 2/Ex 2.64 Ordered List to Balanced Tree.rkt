#lang sicp
#|Ex 2.64 Ordered List to Tree
@Author - Soumitra Pandit
@Date - 20th September 2023
The idea is to convert an Ordered List to a Balanced Tree
And I think I can do that.
Its all predicated on our definition of "balance".
Lets try this.|#

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
;--------------------------------------------------------------------------------

;Okay, so how do we do this?
;When is a tree balanced?
;How many subcases would I have to define?
;Lets say the set is empty
;Then that's the balanced tree
;If not, the set eithr has even number of elements
;OR an odd number of elements.

;IF we start with an odd number of elements,
;we can go to the middle of the list, get that element and have that
;as the begining of the tree.
;The left subtree would consist of the elements to the left of the middle,
;and the right subtree would consist of the elements to the right of the middle.
;At some point, we'd reach two elements.
;And how we deal with two elements is going to be the key to this thing.

;If we start with a single element, then that's it, we already have the tree.

;Let me write pseudo code for this. But this is really easy imo.
;==================================================================================================


;My implementation of Balanced Trees from ordered Lists

;--------------------------------------------------------------------------------------------------

;Main function:
(define (list->tree set)
  (cond ((null? set) '())
        ((= (length set) 1) (make-tree (car set) '() '()))
        ((= (length set) 2) (make-tree (car set) '() (list->tree (cdr set))))
        (else (let ((mid (middle-of-set set)))
                (let ((remaining-set (exclude mid set)))
                  (let ((mid-split (split-set remaining-set)))
                    (let ((left-half (car mid-split)) (right-half (cdr mid-split)))
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
    (cond ((null? set) '())
          (else (if (= 0 n)
                    (cons result-set set)
                    (nth-split (cdr set) (- n 1) (cons (car set) result-set))))))
   (nth-split set (round (/ (length set) 2)) '()))

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

;Exclude as a special case of filter
(define (exclude x set)
  (filter (lambda (y) (not (equal? x y))) set))


;====================================================================================================

;Testing

(define test-set1 (list 1 2 3 4 5 6))
(define test-set2 (list 1 2 3))
(define test-set3 (list 1 2))
(define test-set4 '())
(define test-set5 (list 1))

(length test-set1)
(length test-set2)
(length test-set3)
(length test-set4)
(length test-set5)

(middle-of-set test-set1)
(middle-of-set test-set2)
(middle-of-set test-set3)
(middle-of-set test-set4)
(middle-of-set test-set5)

(split-set test-set1)
(right-half test-set1)
(left-half test-set1)

(split-set test-set2)
(split-set test-set3)
(split-set test-set4)
(split-set test-set5)

(exclude 3 test-set1)

(list->tree test-set1)
(list->tree test-set2)
(list->tree test-set3)
(list->tree test-set4)
(list->tree test-set5)

;==============================================================================================
;The implementation given above is my implementation.
;And I absolutely love it. Now in some while, I will look at the
;Book implementation but its tough to see how it would be any
;different in essence.
;The thing I have created above shows the effect of SICP.
;I was thinking in terms of map, accumulate and filter.
;And the functions I have designed, show that.
;I am pretty sure that I missed a lot of opportunities to use these
;General functions, but whatever I do have, is beautiful.
;==============================================================================================