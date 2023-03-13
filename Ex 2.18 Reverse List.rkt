#lang sicp
#|Ex 2.18 Reverse
@Author - Soumitra Pandit
|#

;The power of a good definition
;What is a reversed list?
;If the list is empty, it is reversed
;Else it is
;(cons (last-element list) (reversed (but-last list)))
;That makes sense

(define (last-pair list-1)
  (if (null? (cdr list-1))
      (car list-1)
      (last-pair (cdr list-1))))

(define (append list-1 list-2)
  (if (null? list-1)
      list-2
      (cons (car list-1) (append (cdr list-1) list-2))))
#|(define (reverse list-1)
  (if (null? (cdr list-1))
      (car list-1)
      (cons (reverse (cdr list-1)) (car list-1))))
|#
(define (but-last list-2)
    (if (null? (cdr list-2))
        (cdr list-2)
        (cons (car list-2) (but-last (cdr list-2)))))

(define (reverse list-1)
  (if (null? list-1)
      list-1
      (cons (last-pair list-1) (reverse (but-last list-1)))))
;This is giving me an answer but not a real list
;So how can I get a list?


(define test-list (list 1 2 3 4 5 6))
(last-pair test-list)
(but-last test-list)
(reverse test-list)