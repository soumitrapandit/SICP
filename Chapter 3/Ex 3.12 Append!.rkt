#lang sicp
#|Ex 3.12 Append!
@Author - Soumitra Pandit
@Date - 7th November 2023

We're touching upon something quite cool. And that is assignment
using set-cdr! and set-car! which allows us to modify the lists.
So, how would I do that with append?
Well, lets start with our general append.
|#

(define (append seq1 seq2)
  (if (null? seq1)
      seq2
      (cons (car seq1) (append (cdr seq1) seq2))))

(append (list 1 2 3 4) (list 5 6 7 8))

;Okay, so that works
;Now, let me think of a way to do this with Assignment

#|(define (append! seq1 seq2)
  (if (null? seq1)
      seq2
      (begin
        (define seq3 seq2)
        (set-car! seq2 seq1)
        (set-cdr! seq2 seq3)
        seq2)))
|#


;Oh wow, the book implementation is even better and is exploiting the fact that
;the last pair of the list would be null

(define (append! seq1 seq2)
  (set-cdr! (last-pair seq1) seq2)
  seq1)

(define (last-pair seq)
  (if (null? (cdr seq))
      seq
      (last-pair (cdr seq))))
  
(append! (list 1 2 3 4) (list 5 6 7 8))

;this is amazing.
(define x (list 'a 'b))

(define y (list 'c 'd))

(define z (append x y))

(cdr x)

(define w (append! x y))

w

(cdr x)


;Well, this is straightforward. we are destructively altering x with append!

;So now the cdr box would point at '(b c d)

;This indeed is beautiful.