#lang sicp
#|Ex 2.20 Same Parity
@Author - Soumitra Pandit
|#
(define (even? x)
  (= 0 (remainder x 2)))

(define (odd? x)
  (even? (+ x 1)))

(define (same-parity x . y)
  (if (even? x)
      (cons x (even-list (car y)))
      (cons x (odd-list (car y)))))

(define (even-list y)
  (cond
    ((null? y) y)
    ((even? (car y))
     (cons (car y) (even-list (cdr y))))
    (else (even-list (cdr y)))))

(define (odd-list y)
  (cond
    ((null? y) y)
    ((odd? (car y))
     (cons (car y) (odd-list (cdr y))))
    (else (odd-list (cdr y)))))

(define list1 (list 1 2 3 4 5 6))

(same-parity 2 list1)
(same-parity 3 list1)