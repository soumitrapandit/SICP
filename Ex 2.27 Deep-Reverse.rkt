#lang sicp

(define (last-pair list-1)
  (if (null? (cdr list-1))
      (car list-1)
      (last-pair (cdr list-1))))

(define (but-last list-2)
    (if (null? (cdr list-2))
        (cdr list-2)
        (cons (car list-2) (but-last (cdr list-2)))))

(define (reverse list-1)
  (cond ((null? list-1)list-1)
        ((not (pair? list-1)) list-1)
        (else (cons (last-pair list-1) (reverse (but-last list-1))))))

;(define (deep-reverse list2)
  ;So how do we say this in english?
  ;if the elements of the list are lists
  ;reverse the elements
  ;then reverse the list
  ;OR
  ;We reverse the list
  ;Then we go to each element and reverse it if it is a list
  ;Or let it be if it not
  ;(reverse-sub (reverse list2)))

(define (reverse-sub list2)
  (cond((null? list2) list2)
       ((not(pair? (car list2)))(car list2))
       (else (cons (reverse (car list2)) (reverse-sub (cdr list2))))))

;Okay, so my deep reverse is not deep enough.
;That's fine. I have a strategy for that.
;What I should have always targetted was the smallest problem - we have a nested list.
;And we want to get the elements out.
;Okay, so how do we do that?


;If we are given a list,
;The first element can be a list.
;In that case, we apply the reverse procedure on that list.
;and the "deep Reverse" procedure on the remaining list.
;Let's try using the for-each function on this list.

;Okay let's think of another approach
;Lets define a procedure that we can use for each element of the list
;if the element is a list, it returns the reversed list
;if the element is not a list, it keeps it as is.

;How do we add laers to this thing?
;What is the general trend?
;If you have a list, reverse the list
;Got it.

(define (deep-reverse list3)
  (cond ((null? list3) (list3))
        ((not (pair? list3)) list3)
        ((pair? list3) (reverse (map deep-reverse list3)))))


(define x (list (list 1 2) (list 3 4)))
(define y (list (list 2 (list 3 4)) (list  5 6)))
x
y
(deep-reverse x)
(deep-reverse y)