#lang sicp
#|Symbolic Differentiation
@Author - Soumitra Pandit
@Date - 16th September 2023
|#

;After a healthy dose of wishful thinking,
;Where we assume that the following have been given to us
;(variable? e)
;Use of primitive predicate symbol?
(define (variable? e)
  (symbol? e))
;(same-variable? v1 v2)
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;(sum? e)
(define (sum? e)
  (and (pair? e) (eq? '+ (car e))))
;(addend e)
(define (addend e)
  (cadr e))
;(augend e)
(define (augend e)
  (caddr e))
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
  (caddr e))
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

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var)
             1
             0))
        ((sum? exp)
         (make-sum
          (deriv (addend exp) var)
          (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product
           (multiplicand exp)
           (deriv (multiplier exp) var))))
        (else
         (error "unknown expression type -- DERIV" exp))))

;Okay, so this should work.

(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
