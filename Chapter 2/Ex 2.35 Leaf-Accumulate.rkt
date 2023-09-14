#lang sicp
#|Ex 2.35 Count Leaves as Accumulate
@Author - Soumitra Pandit
@Date - 9th September 2023
The idea is to use accumulate to formulate
count leaves. And thats not the worst idea.
I do think we'd need to use map
Lets try this.|#
;Side note, I am really appreciating the
;starter code because it is giving me a more
;defined problem to solve.
;For instance, I am already on a time crunch and
;Having to do this without subtle hints would easily
;take twice as long.

;Let me try to understand this
;Lets do an implementation of accumulate

(define (accumulate procedure base-case seq)
  (if (null? seq)
      base-case
      (procedure (car seq) (accumulate procedure base-case (cdr seq)))))

(define (square-list seq)
  (accumulate (lambda (x y) (+ (* x x) y)) 0 seq))

(define test (list 1 2 3))

(square-list test)

;okay, so my accumulate is working
;Now, let me try to rewrite count leaves
;And understand how the mapping would work

;(define (map procedure seq)
;  (accumulate (lambda (x y) (cons (procedure x) y)) nil seq))

(map (lambda (x) (* x x)) test)

;And my map is working as well.
;Now, I need to think about count leaves.
;What are we accumulating?
;Well, we can just make a list of leaves
;in the sub trees and then accumulate them
;Oh, wait, can I just use map to get a list of lists of
;the number of leaves in each sub branch?
;Yeah, I think that is the solution

(define (length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

(length test)

(define test-tree (list 1 2 (list 2 3) (list 4 5 (list 6 7)) 8 9))

test-tree

;Also, perhaps I should do a tree-map
;How would I do a tree map using accumulate?
;Okay the issue is that accumulate can only handle 1D lists
;And so can map
;So lets give them 1D lists
#|
(define (count-leaves trees)
  (accumulate (lambda (x y)
                (if (not (pair? x))
                    (+ 1 y)
                    (map count-leaves x)))
              0
              trees))
|#


;this is kind of pesky, I will come back to this shortly
;How would I do count leaves in the regular old fashioned way?
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))

;lets see if it works
;So thats working
;How would I write it using map?
;And accumulate

(define (leaf-accumulate tree)
  (accumulate (lambda (x y)
                (if (not (pair? x))
                    (+ 1 y)
                    (+ (leaf-accumulate x) y)))
              0
              tree))

(leaf-accumulate test-tree)

;Okay, so that's not half bad, actually.
;Now why would they use map?
;I am going to lookup the solution for this one.
 
(count-leaves test-tree)






               