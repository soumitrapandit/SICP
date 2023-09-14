#lang sicp
(#%require sicp-pict)
#|Picture Language
@Author - Soumitra Pandit
@Date - 13th September 2023
Let's experiment with the elements of
this language. And see what emerges.
|#

(paint(beside einstein (flip-vert einstein)))

(paint(below einstein (flip-vert einstein)))

einstein; So the painter itself is a procedure?

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

;(paint (right-split einstein 8))


(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

;(paint (up-split einstein 8))


(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

;Now why should this work?
;Its not evolving like other procedures, is it?
;Or am I thinking about it incorrectly?
;The idea is that we're "growing" upwards. As far as
;Up Split is concerned, at least. The big Einstein on
;The bottom would be produced by (below painter
;And everything above that is produced by the recursive call
;That's kind of neat. Seeing recursioin visually.


;Okay, how can we extend that to corner split?
;We're essentially collating sub images. And I think that's
;The right way to think about it.
;Think about case where n = 1 and that should shed sufficient light.

(paint (corner-split einstein 0))
(paint (corner-split einstein 1))
(paint (corner-split einstein 2))

;This is amazing.

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(paint (square-limit einstein 0))
(paint (square-limit einstein 1))
(paint (square-limit einstein 2))

;Seriously cool.
;And why do I think so?
;Becuase it is True recursion (and not just a recursive procedure)
;But it feels like a recursive process. Where I am dictating the
;Final outcome directly.
;Or maybe its just the fact that I am using Higher order procedures
;with such ease that I can almost touch them.