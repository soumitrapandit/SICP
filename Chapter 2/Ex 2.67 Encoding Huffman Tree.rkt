#lang sicp
#|Ex 2.67 Encoding Trees
@Author - Soumitra Pandit
@Date - 4th October 2023
I have tried this on my own and I am more or less aware of the
potential pitfalls. However, I am going to now check out the
book's implementation and see where and how we differ in thought,
approach and execution.
|#

;Constructors
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))


;Selectors
(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbols-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

;Tree constructors
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))


;Tree selectors
(define (left-branch tree) (car tree))

(define (right-branch tree) (cdr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbols-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

;Decoding Procedure
;Given the bits and the Huffman Tree,
;Return the message

;Algorithm the way I see it.
;Follow directions.
;Take right for 1
;Take left for 0
;If you have reached a leaf, return the symbol
;and restart with the remaining bits and the Tree


;So at every step, I want to
;Reduce the list
;Optionally reduce the tree (if we are at a leaf).

;I am pretty sure I need to do this reiteratively,
;In order to maintain a copy of the original tree.

;So what would the reiterative procedure do?
;It will take the bit-list and the tree.
;And then it will start "cutting the tree"
;Using the directions till it reaches a leaf.
;Once it reaches the leaf, it will return the symbol


(define (till-symbol-found bit-list tree)
  (if (leaf? tree)
      (cons bit-list (symbols tree))
      (cond ((equal? 0 (car bit-list))
             (till-symbol-found (cdr bit-list) (left-branch tree)))
            ((equal? 1 (car bit-list))
             (till-symbol-found (cdr bit-list) (right-branch tree)))
            ((null? (car bit-list) (error "Symbol Not Found"))))))

(define (decode bit tree)
  (define (decode-iterator bit tree message)
    (if (null? bit)
        message
        (let ((pruned-bit-found-symbol (till-symbol-found bit tree)))
          (let ((found-symbol (cdr pruned-bit-found-symbol))
                (pruned-bit (car pruned-bit-found-symbol)))
            (decode-iterator pruned-bit tree (append message found-symbol))))))
  (decode-iterator bit tree '()))

;This should work, no?

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

sample-tree

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)

       