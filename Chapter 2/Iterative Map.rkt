#lang sicp
#|Iterative map
@Author - Soumitra Pandit
@Date - 6th September 2023
|#

(define (iter-map seq return func)
  (if (null? seq)
      return
      (iter-map (cdr seq) (cons (func (car seq)) return) func)))

(define (square x)
  (* x x))

(define list1 (list 1 2 3 4))

(define (square-list l)
  (iter-map l nil square))

(square-list list1)

;Okay, so the point here might be that this is difficult to
;achieve in the way we've defined lists.
;However, I think I can reverese a list and then pass it through
;This function to get an accurte result. Using just car and cdr, though
;and also using an iterative procedure
;Difficult.
;Well, more like very inefficient