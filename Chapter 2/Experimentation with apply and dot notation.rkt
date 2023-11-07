#lang sicp
#|Experimentation with dot notation, map and apply
@Author - Soumitra Pandit
@Date - 28th September 2023
@Small kiss from the chef.

I don't know, I think I am exhausted and need to do
somthing fun but also take a mental break.

|#

(define (plus . args)
  (apply + args))

(define list1 (list 1 2 3 4 5))

(plus 1 2 3 4 5)

;(plus list1) <- This doesn't work
;I am guessing that my intuition is right here.
;And that args is just a place holder for a bunch of
;arguments that are going to be considered a list.


