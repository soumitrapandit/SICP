#lang sicp
#|Rediscovering lists
@Author - Soumitra Pandit
@Date - 5th September 2023
The idea is to remember the things that I had learnt
before I stopped working on this.
|#
(define x (list 1 2 3 4 5))
x

(define y (cons 1 (cons 2 (cons 3 nil))))
y

(define z (cons 1 nil))
z

(define a (cons 1 x))
a

(define b (cons a z))
b

;Let me try, very quickly, to write a program for append

(define (append x y)
  (if (null? y)
      x
      (append (cons x (car y)) (cdr y))))

(define (append2 x y)
  (if (null? x)
      y
      (cons (car x) (append2 (cdr x) y))))


(define l1 (list 1 2 3))
(define l2 (list 4 5 6))

(append l1 l2)
(append2 l1 l2)

(cons l1 (car l2))

#|I guess this is the first instructive moment
The way I was doing it was kind of funny
Lists are defined as (cons a1 (cons a2 ...(cons an nil))))
So, if we want to add on to the list, we can add on to the left,
but not the right, fi that makes sense.
This is just one of those things that I indeed had forgotten.
Now, let me try using map and also solve the strong induction problem
while I am at it.|#

(define (map func input)
  (if (null? input)
      nil
      (cons (func (car input))
            (map func (cdr input)))))

(define (squared-elements l)
  (map (lambda (x) (* x x)) l))

(squared-elements l1)