#lang sicp
#|Ex 2.28 - Fringe
@Author - Soumitra Pandit
@Re date - 7th September 2023
Given a nested list, give all the elements ordered from left to right. 
|#
(define (append list-1 list-2)
  (if (null? list-1)
      list-2
      (cons (car list-1) (append (cdr list-1) list-2))))


;Okay, let me think. So we need a couple of auxillary functions
;What is the first one?
;go through a list and check if the first element is a list itself
;What if it is a list?
;Then we apply the procedure to the list

;I need a function that will take a nested list and put its elements in a sinlge list
;So we are mapping over trees. And I need an efficient way to do that. Okay, let's see.
;What are my options?
;I'd probably have to use the dot notation for list inputs. Yes, that seems like a likely solution
;Okay, so how do we do that?
;Let us define the problem again. What do I want the procedure to do if it encounters a tree?
;I want it to return its elements, right? That feels like it.

;oh wait, I can just use append on the two lists
;What is the mapping from
;(cons (cons a b) (cons c d))
;what is the mapping to
;(cons a (cons b (cons c (cons d))
         
(define (fringe x)
  (cond ((null? x) x)
        ((not (pair? x)) (list x))
        ;So this is quite subtle. We are doing (list x) here as
        ;append might need to append x with another list.
        ;We can get away with x being nil but not with x not
        ;being a pair. This is quite instructive. As I am positive that
        ;this is the approach I had tried out initially.
        
        (else (append (fringe (car x))
                      (fringe (cdr x))))))

(define x (list (list  1 2) (list 3 4)))
(define y (list (list 1 2) 3 (list 4 5)))
(define z (list (list 1 2) (list  3 4) (list 5 6)))

(define a (list x y z))

;Let me try to write fringe again, just as an exercise.
;The idea is to go down a nested list and write create a list made of
;its subelements.

(define (fringe2 seq)
  (cond ((null? seq) seq)
        ((not (pair? seq)) (list seq))
        ;once again, the (list seq) part tripped me
        ;However, I was able to see what I was doing incorrectly
        ;pretty cool to be honestss
        (else (append (fringe2 (car seq)) (fringe2 (cdr seq))))))

(fringe2 x)
(fringe2 y)
(fringe2 z)
(fringe2 a)
      