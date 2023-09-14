#lang sicp
#|Ex 2.29 - Binary Mobile
@Author - Soumitra Pandit
@Date - 7th September 2023

|#

(define (make-mobile left right)
  (list left right))

;I guess I am still struggling with the idea that a list in itself is
;a compound structure. Maybe, I should stop thinking of it in terms of
;nested cons and look at it for what it is - a sequence.
;And then, cons is merely a tool to add an element to the beggining of the
;sequence. Which is pretty neat.
;But, I think I need to experiment just a bit more


(define (make-branch length structure)
  (list length structure))

(define branch1 (make-branch 1 2))
(define branch2 (make-branch 3 4))
(define branch3 (make-branch 5 branch2))
(define mobil1 (make-mobile branch1 branch3))
mobil1

#|Selectors for Binary Mobile|#
(define (left-branch binary-mobile)
  (car binary-mobile))

(define (right-branch binary-mobile)
  (car(cdr binary-mobile)))

#|Selectors for branch|#
(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car(cdr branch)))

#|Total Weight Procedure
Okay, so given a binary mobile, how do we find its total weight?
So basically we want to add the cdr of every pair
That shouldn't be too hard, should it?
The caveat is that we have to use the selectors we have defined
thus far. Otherwise, it would be really straightforward, I think.
|#

;I think I should split this up into two
;Lets start with brach weight
;A function that returns the weight of the branch;
;Won't that be a recursive procedure itself?
;Okay, so that approach won't work.
;Lets try none the less
;Okay, so what I should be working on is individual branches
;And then try it in with the tree

;Okay, so how would I put this into words?

(define (branch-weight branch)
  (cond((not (pair? (branch-structure branch)))
         (branch-structure branch))
       (else
         (+ (branch-weight (left-branch (branch-structure branch)))
            (branch-weight (right-branch (branch-structure branch)))))))

(define (total-weight binary-mobile)
  (+ (branch-weight (left-branch binary-mobile)) (branch-weight (right-branch binary-mobile))))

(branch-structure(left-branch mobil1))

(total-weight mobil1)