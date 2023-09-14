#lang sicp
#|Ex 2.38 Fold Left
@Author - Soumitra Pandit
@Date - 10th September 2023
So I am really curious about whatever this is.
I don't really see the point of a fold left.
But now that I think of it, its application might
be in things that need to be reversed and fed into
a loop.
That's a very weak maybe at best.
Let's find out.|#

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))

;I am really trying very hard to see the point of this
;Its doing the literal same thing but in a different way
;WHAT IS THE POINT?????

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq) (fold-right op init (cdr seq)))))

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))

;Okay, so the results are slightly interesting.
;A property that op should satisfy to gurantee same results
;Hmm. Interesting. Linearity? Does that make sense?
;Linear transforms should be fine, right?
;No, I don't think so. Division is a linear transform.

(fold-right * 1 (list 1 2 3))
(fold-left * 1 (list 1 2 3))

(/ 1 2 3)
(/ 3 2 1)

;Okay so the word I am looking for is "Associative".
;Op must be Associative for it to work with either fold left or fold right.
;This is so cool actually. Good to know. 