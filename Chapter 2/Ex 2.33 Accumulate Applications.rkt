#lang sicp
#|Ex 2.33 Accumulation
@Author - Soumitra Pandit
@Date - 9th September 2023
|#

(define test (list 1 nil 2 nil 3 nil))
test

;So I was thinking of an approach that could have
;used nil but apparently, it won't work as I thought

;Okay, so lets write down accumulation
;How would I devise a general accumulative function?

(define (accumulate procedure base-case seq)
  (if (null? seq)
      base-case
      (procedure (car seq) (accumulate procedure base-case (cdr seq)))))


;And now, how would I rewrite map, in terms of accumulate?

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(map (lambda (x) (* x x)) (list 1 2 3))

;Okay, so that was actually easy. Also revised some syntax.
;Defining append in terms of accumulate

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2 3) (list 4 5 6))

;That works as well, now moving onto the last piece fo the puzzle
;Finding the length of a sequence

(define (length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

(length (list 1 2 3))

#|General Notes on Accumulate
The basic idea is that the procedure we define must have
two arguments. And our return values must be carefully designed
to fit in the overarching accumulator cycle.
length is a particularly good example of this implementation|#