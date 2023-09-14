#lang sicp
(#%require sicp-pict)
#|Ex 2.46 Make Vect
@Author - Soumitra Pandit
@Date - 13th September 2023
Idea - Something about vector representation
so that we can deal with frames. Honestly, I don't
think that the application matters for this exercise to
work. And at this point, I am just trying to get as close to
the finish line as possible.
|#


(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

;For this to work, I will have to define the constructor
;make-vect
;and the selectors (xcor-vect) (ycor-vect)
;What about frames?

;Also add-vect should return a vector

;We're just shifting the vector into the frame.

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

