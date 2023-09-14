#lang sicp
#|Ex 2.39 Folded Reverse
@Author - Soumitra Pandit
@Date - 11th September 2023
The idea is to implement reverse
using fold, I believe.
Okay, that should be easy, right?
I mean reverse is associative,
isn't it?|#

;How do we normally implement reverse?
;A function that gives you the last elem
;of the list

(define (last seq)
  (if (null? (cdr seq))
       (car seq)
      (last (cdr seq))))

(define (pop seq)
  (if (null? (cdr seq))
      nil
      (cons (car seq) (pop (cdr seq)))))

(define (reverse seq)
  (if (null? seq)
      nil
      (cons(last seq) (reverse (pop seq)))))
(last (list 1 2 3 4))
(pop (list 1 2 3 4))
(reverse (list 1 2 3 4))

;Okay, that was interesting.
;How have I done that in the past?
;In the exact same way. And I faced the
;same hurdles there as well. The only difference is
;that I was able to converge onto the solution much
;faster this time (~21 minutes)

;moving on. How can we implement this with fold?
;What would a right folded reverse look like?

(define (right-fold op init seq)
  (if (null? seq)
      init
      (op (car seq) (right-fold op init (cdr seq)))))

(define (right-reverse seq)
  (right-fold (lambda (x y) (append y (list x))) nil seq))

(right-reverse (list 1 2 3 4))

;My current implementation of reverse is not in the
;"Fold right format"
;And for the life of me, I can't figure out how to
;Convert this output to t list

(append (list 1 2 3 4) (list 4 5 6 6))
;That's right. I don't want cons. I want append


