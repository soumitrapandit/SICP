#lang sicp
#|Ex 3.16 Count Pairs
@Author - Soumitra Pandit
@Date - 8th November 2023

"The number of pairs in any structure is the number in car,
plus the number in cdr plus one more to count the current pair"

I don't know how accurate this is.
Okay, logically, if there was no sharing, this would be accurate.
But, I am pretty sure that I can find out plenty of lists that
have shared elements which would give rise to the illusion that
there are more pairs than there actually are.
Further more, if we really wanted to know if there are n unique pairs,
we would have to maintain a ledger of "pairs found" and test equality|#


(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))


(define x (list 'a 'b))

(define y (list 'c 'd))

(define z (list 'e 'f))


;So these are the three unique lists.

(define s2 (cons x y))
s2

(define s3 (cons x (cons y z)))

(define s4 (cons x (cons x (cons y z))))

;and so on.
;Lets test this.
(count-pairs x)

(count-pairs s2)

(count-pairs s3)


(count-pairs s4)

(define s1 (cons 'a 'b))

(count-pairs s1)

;As soon as we have list structure, the number of pairs is increasing
;And I don't understand why.
;Okay, I do understand it now, and all I did was track the pointers as the
;book had suggested.
;Anyway, I get the point.
;Moving on.