#lang sicp
#|Ex 3.03 Secret Password
@Author - Soumitra Pandit
@Date - 7th October 2023
|#


(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient Funds"))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))))
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "What are you smoking, bro?" m))))
  (define (password-match p m)
    (if (eq? p password)
        (dispatch m)
        (error "Incorrect Password" p)))
  password-match)

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw)40)

;Seems to be working bois.
;Moving On.