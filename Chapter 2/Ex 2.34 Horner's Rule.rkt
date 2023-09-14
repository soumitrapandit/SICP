#lang sicp
#|Ex 2.34 Horner's Rule
@Author - Soumitra Pandit
@Date - 9th September 2023
This has got something to do with evaluating
polynomials. And the way we do it is by an
inherently recursive procedure|#

(define (accumulate procedure base-case seq)
  (if (null? seq)
      base-case
      (procedure (car seq) (accumulate procedure base-case (cdr seq)))))


(define (horner-eval x coeff-seq)
  ;Here the coeff-seq is given in ascending powers order
  ;That should help
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coeff-seq))

(horner-eval 2 (list  1 3 0 5 0 1))
;Apparently, this is an optimal algorithm. That is pretty cool. 