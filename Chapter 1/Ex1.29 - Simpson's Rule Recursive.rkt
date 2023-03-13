#lang sicp
#|Ex 1.29 - Simpson's Rule|#
#|Approximation = h/3(y0+4y1+2y2+4y3+2y4+...+2y(n-2)+4y(n-1)
and n is some even integer.
Additionally, yk is given by f(a+kh) and h = (b-a)/n|#

;Okay, so let's define what we can atm
;Summation Procedure
(define (sum term a b next)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) b next))))

;Find if term is even
(define (even? n)
  (= (remainder n 2) 0))

#|
;yk = f(a+kh)
(define (simpson_term a h n f)
  (f (+ a (* h n))))

;Piecewise Next function
(define (simpson_next a h n f simpson_term)
  (if (even? n)
      (* 2 (simpson_term a h n f))
      (* 4 (simpson_term a h n f))))
|#

;Maybe there is  simpler approach
(define (simpson_term f a n)
  (cond ((= n 0) (f a))
        ((even? n) (* 2 (f a)))
        (else (* 4 (f a )))))

; And the next term will be give by the simple
(define (simpson_next a n k)
  (+ a (* n k)))

;Wrapper
(define (simpsons_approximation a b f n)
  (define (h)
    (/ (- b a) n))
  (define (simpson_sub_term t)
    (+ a (* t (h))))
  (define (simpson_term t)
    (cond ((= t 0) (f (simpson_sub_term t)))
        ((even? t) (* 2 (f (simpson_sub_term t))))
        (else (* 4 (f (simpson_sub_term t))))))
  (define (inc t)
    (+ 1 t))
  ;The question remains - how do we use n in the sum procedure
  ;Or should the b term in the procedure be something else
  ;Now that I think about it, a is constant, b is constant
  ;So the only thin that is changing is n
  ;So we can express this as a function of n and not a and b
  ;Cool
  (*(/ (h) 3)(sum simpson_term 0 n inc)))
;Wow, lexical scoping suddenly becomes very important.
;Okay then, let us nest these.
(define (cube a)
  (* a a a))

(simpsons_approximation 0 1.0 cube 100)
(simpsons_approximation 0 1.0 cube 1000)
; fin.