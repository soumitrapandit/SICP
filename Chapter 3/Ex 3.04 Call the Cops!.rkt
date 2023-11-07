#lang sicp
#|Ex 3.04 Call The Cops
@Author - Soumitra Pandit
@Date - 7th October 2023

This should be fun.
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
  (define call-the-cops "The Cops are coming")
  (define (password-match p m)
    (let ((incorrect-count 0))
      (if (>= incorrect-count 7)
          call-the-cops
          (if (eq? p password)
              (begin (set! incorrect-count 0)
                     (dispatch m))
              (begin (set! incorrect-count (+ 1 incorrect-count))
                     (error "Incorrect Password" p))))))
  password-match)

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw)40)

;I have not tested this, but this should work.
;I have mighty faith in my programming skils.
