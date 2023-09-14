#lang sicp
#|Ex 2.32 Subsets
@Author - Soumitra Pandit
@Date - 7th September 2023
Given a list of numbers, create all possible subsets
and return as a list of lists
|#

;So how do we find subsets
;If a list is empty, then the subset is nil
;If not, then the subsets of the list are the first element
;combined with the subsets of the rest of the list
;and the subsets of the rest of the list
;So that's the basic recursive idea.
;How do I implement it?

(define (append seq1 seq2)
  (if (null? seq1)
      seq2
      (cons (car seq1) (append (cdr seq1) seq2))))

;I want to define a function that given a list of elements,
;combines the first elment with the other elements and returns a list

(define (f element seq)
  (cons element seq))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map
                      (lambda (x)
                        (cons (car s) x))
                      rest)))))

(define list1 (list 1 2 3))

(subsets list1)

;So what is f?

;Fuck this, how would I find the subsets?
;Well, that's tricky
;I think I have to think in terms of
;Nested sets.
;(list nil) is the universal subseet
;If (a) , (b) are subsets then (a, b) is also a subset
;I think that's the key rule to exploit, no?
;can I separate the elements and then mix and match?
;How would I do this naturally?
;Lets assume that I do have append in my toolbox
;And I also have map
