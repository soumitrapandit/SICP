#lang sicp
(#%require sicp-pict)
#|Ex 2.45 Split
@Author - Soumitra Pandit
@Date - 13th September 2023
The idea is to split the image.
And this procedure will tell us how
|#

(define (split plane-1 plane-2)
  (lambda (art n)
    (if (= n 0)
        art
        (let ((sub-image ((split plane-1 plane-2) art (- n 1))))
          (plane-1 art (plane-2 sub-image sub-image))))))

(define up-split (split below beside))
(define right-split (split beside below))

(paint (up-split einstein 1))

(paint (right-split einstein 2))

;And it works :)