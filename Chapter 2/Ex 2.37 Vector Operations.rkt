#lang sicp
#|Ex 2.37 Linear Operations
@Author - Soumitra Pandit
@Date - 9th September 2023
So we are going to use lists to
implement the dot product, matrix
multiplication and the transpose
This feels like it is going to be
an application oriented exercise|#

;Good ol' accumulate
(define (accumulate procedure base-case seq)
  (if (null? seq)
      base-case
      (procedure (car seq) (accumulate procedure base-case (cdr seq)))))

(accumulate (lambda (x y) (cons (* x x)  y)) nil (list 1 2 3))

;Implementing accumulate-n
(define (accumulate-n procedure base-case seq)
  (if (null? (car seq))
      nil
      (cons (accumulate procedure base-case (map car seq))
            ;In the first pass of the function, it looks like
            ;I am never using the base case. But that's not true
            ;I am using the base case in the regular ol' accumulate
            ;That's nice to know.
            (accumulate-n procedure base-case (map cdr seq)))))

;Dot product
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;Matrix @ Vector
(define (matrix-*-vector m v)
  (accumulate + 0 (map (lambda (x) (dot-product x v)) m)))

(define (matrix-*-vector2 m v)
  ;this is the book suggestion which begins with a mapping
  (map (lambda (x) (dot-product x v)) m))

;This is definitely not working out.
;Maybe, just maybe, this is where accumulate-n can shine.
;But how exactly?

(define mat (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define vec (list 1 2 3 4))

(matrix-*-vector mat vec)
(matrix-*-vector2 mat vec)

;Transpose of a Matrix
;Okay, how do we do this?
(define (transpose m)
  (accumulate-n cons nil m))

mat
(transpose mat)

;Matrix @ Matrix
;Let's think in terms of higher order procedures
;that we have developed so far.
;I want to map the matrix vector product to every list
;however, doing that accumulate n might be better?
;Let me think about this.
;We have a matrix and the transpose of another matrix.
;How is accumulate-n going to work in this case?
;
(define (matrix-*-matrix m n)
  (accumulate + 0 (map (lambda (x) (matrix-*-vector m x)) n)))

(matrix-*-matrix mat mat)

;I think an important question is what happens if I map accumulate
;Or if I, very courageously, map accumulate-n
;When would that be useful? Or am I just going to get nonsense?
;Accumulate is a powerful tool because it allows me to go through
;a list and perform a procedure on it while also allowing me to
;combine results in a way that pleases me.
;I guess, from that perspective, mapping accumulate would be pointless
;Unless we're using nested lists. Then it would suddenly be very powerful.


;Okay, so that's what I was doing incorrectly. I was transposing when I didn't need to. 
;(map (lambda (x) (matrix-*-vector mat x)) (transpose mat))