#lang sicp
(#%require sicp-pict)
#|Ex 2.48 mak-segment
@Author - Soumitra Pandit
@Date - 13th September 2023
|#
;====================================================
;Vector Operations

(define (make-vect x y)
  (list x y))


(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cadr vect))

(define (op-vect op v1 v2)
  (make-vect (op (xcor-vect v1) (xcor-vect v2))
             (op (ycor-vect v1) (ycor-vect v2))))

(define (add-vect v1 v2)
  (op-vect + v1 v2))

(define (sub-vect v1 v2)
  (op-vect - v1 v2))

(define (scale-vect c v1)
  (make-vect (* c (xcor-vect v1))
             (* c (ycor-vect v1))))
;=======================================================
;make-segment

(define (make-segment start end)
  (list start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cadr segment))
;=======================================================