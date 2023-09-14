#lang sicp
#|Nested Mappings
@Author - Soumitra Pandit
@Date - 11th September 2023
|#

;Enumerate Interval
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
;Essentially making a list of numbers in an interval

(enumerate-interval 1 4)

;And how would I implement a filter?
(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq))
         (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))


(accumulate append
            nil
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 4)))

(map (lambda (i)
       (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 4))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;The above procedure can be read as
;Accumulate using append and nil the elements of the list
;obtained by applying the procedure proc to every element of the sequence.
;This is quite cool honestly.
