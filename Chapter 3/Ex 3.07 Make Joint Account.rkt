#lang sicp
#|Ex 3.07 Joint Account
@Author - Soumitra Pandit
@Date - 10th October 2023
|#

(define (make-account balance password)
  (set! password (list password))
  ;Withdraw
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient Funds"))

  ;Deposit
  (define (deposit amount)
    (begin (set! balance (+ balance amount))))
  
  ;New Password
  (define (add-password new-password)
    (begin (set! password (cons new-password password))))

  ;Dispatch
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "What are you smoking, bro?" m))))

  ;Password Match
  (define (password-match p m)
    (define (password-match-iter p m password)
      (cond ((null? password) (error "Incorrect Password"))
            ((eq? p (car password))(dispatch m))
            (else password-match-iter p m (cdr password))))
    (password-match-iter p m password))

  password-match)

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw)40)

;So how exactly am I supposed to add a gateway to this account?
;And How can I use assignment?

;Part of this is easy.
;This feels very weird because it feels like you're asking me
;to use a function to change the internal state of another function.
;Maybe, that's not too hard.
;Oh wow. This is possible because make-account returns a procedure.
;And we control that procedure.