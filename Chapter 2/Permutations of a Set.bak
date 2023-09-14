#lang sicp
#|Permutations of a Set
@Author - Soumitra Pandit
@Date - 11th September 2023
|#

#|How would I define the permutations of
set in a natural inductive way?
That's really the only question I need answered.
A very natrual answer involves the permutations
of the subsets of S, I believe.
But can I do without having to find the subsets?
Okay what is a permutation of a set?
It is the permutaions of its subsets + the leading element.
No, that's not what I want.
For Every Element, it is that element appended to the permutations
without that element.|#

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (accumulate op init seq)
  (if (null? seq)
      nil
      (op (car seq) (accumulate op init (cdr seq)))))

(define (permutations-i set)
  (map (lambda (element)
         (append (list element) (permutations-i (remove element set))))
       set))

(define (permutations set)
  (if (null? set)
      (list nil)
      (flatmap (lambda (element)
                 (map
                  (lambda (permutation)
                    (cons element permutation))
                  (permutations (remove element set))))
               set)))

;Okay, I am going to keep this here as this is an instructional mistake.
;In the implementation of permutations above, I have made a critical error.
;I am mapping the function that takes an element and applied it to every
;element of the set.
;But what I am not doing is appending to each and every subset.
;I need a nested map to 

(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq))
         (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (remove element set)
  (filter (lambda (x) (not(= element x))) set))

(remove 3 (list 1 2 3 4))

(permutations (list 1 2 3))