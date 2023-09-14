#lang sicp
#|Ex 2.36 Accumulate-n
@Author - Soumitra Pandit
@Date - 9th September 2023
Accumulate n
takes in a sequence of sequences
performs the procedure on the
nth element of each sequence
returns a sequence
Okay, should not be that difficult
lets see
|#

(define (accumulate procedure base-case seq)
  (if (null? seq)
      base-case
      (procedure (car seq) (accumulate procedure base-case (cdr seq)))))

(accumulate (lambda (x y) (cons (* x x)  y)) nil (list 1 2 3))

;Okay, so this works
;Now, how can we change accumulate?

(define (accumulate-n procedure base-case seq)
  (if (null? (car seq))
      nil
      (cons (accumulate procedure base-case (map car seq))
            (accumulate-n procedure base-case (map cdr seq)))))

(define test-seq (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(map car test-seq)
(accumulate-n + 0 test-seq)

;Works!