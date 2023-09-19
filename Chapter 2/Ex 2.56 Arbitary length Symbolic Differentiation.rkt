#lang sicp
#|Ex 2.57 Modified Deriv
@Author - Soumitra Pandit
@Date - 16th September 2023
The idea is to use a list like
notation for dealing with additions
and multiplicatioins of arbitary length.
I will have to think for a second on
this one.
|#

;Work Done so far.
;=========================================================

;(variable? e)
;Use of primitive predicate symbol?
(define (variable? e)
  (symbol? e))
;(same-variable? v1 v2)
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;----------------------------------------------------------

;(sum? e)
(define (sum? e)
  (and (pair? e) (eq? '+ (car e))))
;(addend e)
(define (addend e)
  (cadr e))
;(augend e)
(define (augend e)
  (if (null? (cdddr e))
      (caddr e)
      (list '+ (caddr e) (cadddr e))))
;-----------------------------------------------
;(make-sum a1 a2)
(define (make-sum a1 a2)
  (cond ((and (number? a1) (number? a2))
         (+ a1 a2))
        ((and (number? a1) (= 0 a1))
         a2)
        ((and (number? a2) (= 0 a2))
         a1)
        (else
         (list '+ a1 a2))))
;----------------------------------------------
;(product? e)
(define (product? e)
  (and (pair? e) (eq? '* (car e))))
;(multiplier e)
(define (multiplier e)
  (cadr e))
;(multiplicand e)
(define (multiplicand e)
  (if (null? (cdddr e))
      (caddr e)
      (list '* (caddr e) (cadddr e))))
;(make-product m1 m2)
(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0)
            (=number? m2 0))
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1)
              (number? m2))
         (* m1 m2))
        (else
         (list '* m1 m2))))
;we can create the entire differentiation algorithm.
;We are also going to use the primitive number? which
;is a part of the scheme interpreter

;===========================================================
;Exponentiation constructors and selectors

(define (exponentiation? e)
  (and (pair? e) (eq? '** (car e)) (number? (caddr e))))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))

(define (make-exponent base exponent)
  (cond
    ((not (number? exponent)) (error "exponent has to be a number" exponent))
    ((=number? exponent 0)
     1)
    ((=number? exponent 1)
     base)
    (else
     (list '** base exponent))))

;=============================================================
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var)
             1
             0))
        
        ;Sum
        ((sum? exp)
         (make-sum
          (deriv (addend exp) var)
          (deriv (augend exp) var)))
        
        ;Product
        ((product? exp)
         (make-sum
          (make-product
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product
           (multiplicand exp)
           (deriv (multiplier exp) var))))
        
        ;Exponentiation
        ((exponentiation? exp)
         (make-product
          (exponent exp)
          (make-product
           (make-exponent (base exp) (- (exponent exp) 1))
           (deriv (base exp) var))))
        ;else
        (else
         (error "unknown expression type -- DERIV" exp))))

;Okay, so this should work.

;(deriv '(+ x 3) 'x)
;(deriv '(* x y) 'x)
(define exp1 '(* x y (+ x 3)))
(null? (caddr exp1))
(cdddr exp1)

(deriv exp1 'x)