#lang sicp
#|Intro to Object and State 4
@Author - Soumitra Pandit
@Date - 6th October 2023

Now, we are ready to create processors, if we are use the book language.
|#

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient Funds")))

(define w1 (make-withdraw 100))

(define w2 (make-withdraw 130))

(w1 10)
(w2 10)
(w2 20)

;This is amazing. I can't articulate, at the moment, why I think this is so cool
;But when I have sufficiently gathered my thoughts at some point in the future, I will
;Definitely write about this.


(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insuffuicient Funds"))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request  --MAKE-ACCOUNT"
                       m))))
  dispatch)


;This is quite cool and completely different from the "kind" of programming we have been engaged in so far.
;How is it different? Well, we are using nested functions and using them quite well, almost like limbs of the program.
;I also understand that this has somehthing to do with shielding the program from itself.
;Inner Abstraction Layers.
;But here, its done in a very classy way. (pun not intended)
;Okay, so let me run through the program in my mind.
;We have make-account. And that is going to call dispath on the way out?
;Yeah, and dispatch would have to be called in a weird way?
;Like I would have to do something like
(define account1 (make-account 100))
((account1 'withdraw)10)
(define account2 (make-account 200))
((account2 'withdraw) 12)

;This is quite easy actually but would need getting used to
;Also I have syntax questions.
;What If I do this?

(define  withdraw-account1 (account1 'withdraw))

(withdraw-account1 10)

;Works.