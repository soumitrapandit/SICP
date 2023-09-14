#lang sicp
(#%require sicp-pict)
#|Ex 2.44 Up-Split
@Author - Soumitra Pandit
@Date - 13th September 2023
|#

(define (up-split art n)
  (if (= n 0)
      art
      (let ((smaller (up-split art (- n 1 ))))
        (below art (beside smaller smaller)))))

(paint (up-split einstein 0))
(paint (up-split einstein 1))
(paint (up-split einstein 2))

;Works :)