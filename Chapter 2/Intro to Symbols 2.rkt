#lang sicp
#|Intro to Symbols 2 - memq
@Author - Soumitra Pandit
@Date - 16th September 2023
Lets deal with equlity of symbols
Whatever that means.
|#

(eq? 'b 'a)

(eq? 'b 'b)

;Now I would like to define memq
(define (memq item seq)
  (cond ((null? seq) false)
        ;I already don't like this. What if item is '()?
        ((eq? item (car seq)) seq)
        (else (memq item (cdr seq)))))

;This program, which is identical to the book implementation,
;is making me cringe. We can probaly use map tree for this.
;And it is also missing the edge case.
;Maybe it is the primary building block in somthing more complicated.

(memq 'a '(c d g b a f))




