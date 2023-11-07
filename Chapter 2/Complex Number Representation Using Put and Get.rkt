#lang sicp
#|Complex Numbers, Complex Representation
@Author - Soumitra Pandit
@Date - 27th September 2023

Complex numbers have two representations and they are ideal to build
or at least practice building additive systems with.
So, let's try that.
|#

;I am trying to really only understand get and put with this
;Exercise. I need to understand how they work.
;But, lets build towards it.

;========================================================================
;I guess the most important part of get and put is the following
;We have
;(put <operation> <type> <item>)
;and
;(get <operation> <type>) -> <item>

(define (square x) (* x x))

;========================================================================
(define global-array '())

(define (make-entry k v) (list k v))
(define (key entry) (car entry))
(define (value entry) (cadr entry))

(define (put op type item)
  (define (put-helper k array)
    (cond ((null? array) (list(make-entry k item)))
          ((equal? (key (car array)) k) array)
          (else (cons (car array) (put-helper k (cdr array))))))
  (set! global-array (put-helper (list op type) global-array)))

(define (get op type)
  (define (get-helper k array)
    (cond ((null? array) #f)
          ((equal? (key (car array)) k) (value (car array)))
          (else (get-helper k (cdr array)))))
  (get-helper (list op type) global-array))

;==========================================================================================
(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- CONTENTS" datum)))

(define (install-rectangular-package)
  ;;internal procedures
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y) (cons x y))
  (define (magnitude z)
    (sqrt (+ (square (real-part z))
             (square (imag-part z)))))
  (define (angle z)
    (atan (imag-part z) (real-part z)))
  (define (make-from-mag-ang r a)
    (cons (* r (cos a))(* r (sin a))))

  ;;interface to the rest of the system
  
  (define (tag x) (attach-tag 'rectangular x))
  
  (put 'real-part '(rectangular) real-part)
  (put 'imag-part '(rectangular) imag-part)
  (put 'magnitude '(rectangular) magnitude)
  (put 'angle '(rectangular) angle)
  (put 'make-from-real-imag 'rectangular
       (lambda (x y) (tag (make-from-real-imag x y))))
  ;Why are we attaching a tag here but not elsewhere?
  (put 'make-from-mag-ang 'rectangular
       (lambda (r a) (tag (make-from-mag-ang r a))))
  ;I guess its because now is the only time that data
  ;representation plays a role. If we are given a pair,
  ;We need to know if we're suppsosed to interpret it
  ;as real-imaginary or magnitude-angle. So this makes
  ;sense.

  'done)

;There are so many interesting things happening in this program that I need to take a minute
;and digest the nuances. The first thing that comes to mind is '(rectangular).
;What really is the difference between '(rectangular) and 'rectangular?
;And why am I not comfortable with it?

'(rectangular)
'rectanglular
(car '(rectangular))
(cdr '(rectangular))


(install-rectangular-package)

;What are we doing here exactly? I just ran a function that did nothing?
;And this thing does not take any arguments.
;So what am I supposed to do, exactly?

;Oh wait, we did do a bunch of put and get actions.
;So now there is a ledger *somewhere* that holds all the functions that matter to us.
;This is pretty cool actually.



(define (install-polar-package)
  ;;internal procedures
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (make-from-mag-ang r a) (cons r a))
  (define (real-part z)
    (* (magnitude z) (cos (angle z))))
  (define (imag-part z)
    (* (magnitude z) (sin (angle z))))
  (define (make-from-real-imag x y)
    (cons (sqrt (+ (square x) (square y)))
          (atan y x)))

  ;;interface to the rest of the system
  (define (tag x) (attach-tag 'polar x))
  (put 'real-part '(polar) real-part)
  (put 'imag-part '(polar) imag-part)
  (put 'magnitude '(polar) magnitude)
  (put 'angle '(polar) angle)
  (put 'make-from-real-imag 'polar
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'polar
       (lambda (x y) (tag (make-from-mag-ang x y))))
  'done)

(install-polar-package)
  
global-array

;So this is pretty cool. Its like were hitting two birds
;with one stone.

;We are also going to use Dotted Tail Notation.
;And while that is all well and good, I need to understand what it is
;It means that the last argument is a list.


(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
    ;So get can take in lists as arguments?
    ;I am not sure, but apparently?
      (if proc
          (apply proc (map contents args))
          (error
           "No method for these types -- APPLY-GENERIC"
           (list op type-tags))))))

;Okay this is kind of complicated so I will have to pay attention.


(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))


(define (make-from-real-imag x y)
  ((get 'make-from-real-imag 'rectangular) x y))

(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))


(define C1 (make-from-mag-ang 10 10))
(define C2 (make-from-mag-ang 10 10))


(define C3 (make-from-real-imag 20 20))

;There is something really unlikeable about this and I want to put my finger on it.
;Well, first off, I don't understand the usage of '(rectangular) vs 'rectangular
;I don't see how it makes a difference



  
  

