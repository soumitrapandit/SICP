#lang sicp
#|Ex 2.30 - Mapping over trees
@Author - Soumitra Pandit
@Date - 7th September 2023
The idea is to use higher order procedures,
in this case, map, to make life easier
|#

(define (map f seq)
  (if (null? seq)
      nil
      (cons (f (car seq)) (map f (cdr seq)))))

(define (square x) (* x x))

(define list1 (list 1 2 3 4))

;Lets test it quickly
(map square list1)

;Now, moving onto the square-tree

(define (square-tree seq)
  (cond
    ;The tree can be empty
    ((null? seq) nil)
    ;Or it can be a leaf
    ((not(pair? seq)) (square seq))
    ;Or we can hit a subtree
    (else (cons (square-tree (car seq))
                (square-tree (cdr seq))))))

;And now we want an implementation with map
;Should be easy, right?
;What part of the execution is map handling?
;You give it a list and a procedure, it will apply the
;procedure to the list

(define (square-tree-map seq)
  (if (not(pair? seq))
      (square seq)
      (map square-tree seq)))
      
;If I were to plainly use map, how would I do it?
;I mean, it works but I don't exactly understand how I did this?
;Intuitively, I feel like I have to use cons at least once
;But I guess the map function is taking care of that. 


(define tree1 (list 1 2 (list 3 4) (list 5 6) 7 8))

tree1

(square-tree tree1)
(square-tree-map tree1)
