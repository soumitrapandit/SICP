#lang sicp
#|GCD|#
;This is quite cool
;we are using math for computational efficiency
;And in this case we're doing it for GCD

(define (GCD a b)
  (cond ((= a 0) b)
        ((=(remainder a b) a) (GCD (remainder b a) a))
        (else (GCD (remainder a b) b))))
;This should work, right?
;Let's check

(GCD 12 3)
(GCD 48 64)

;Oh, but the books algorithm is even smarter.
;let (remainder a b) = r
;then r<b, by definition of division
;So we'll just flip them
;Should have thought of that

(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (remainder a b)))))

;Tests
(gcd 13 14)
(gcd 3284 4238)
(gcd 288 28)