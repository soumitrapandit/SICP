#lang sicp
(#%require sicp-pict)
#|Ex 2.47 Make Frame
@Author - Soumitra Pandit
@Date - 13th September 2023
|#
;It is at this point that I start questioning
;what the hell it is that we are doing.
;Why are we dealing with frames?
;Where is this going?
;Two more exercises like this and I am out


(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

(define frame1 (make-frame (list 1 2) (list 3 4) (list 5 6)))

(origin-frame frame1)

(edge1-frame frame1)

(edge2-frame frame1)

