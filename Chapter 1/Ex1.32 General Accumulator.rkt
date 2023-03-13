#lang sicp
#|Ex1.32 Accumulate|#
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))
;How would I do this reiteratively though?

(define (accumulate combiner null-value term a next b)
  ;How am I going to define the reiterative case?
  ;Essentially, I want the function call to pass on all the
  ;State variables
  (define (accu-iter combiner term a next b result)
    (if (> a b)
        result
        (accu-iter combiner term (next a) next b (combiner (term a) result))))
  (accu-iter combiner term a next null-value))

;Wow, that is quite pretty indeed.