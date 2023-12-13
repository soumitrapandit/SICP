#lang sicp
#|Ex 3.44 Transfer
@Author - Soumitra Pandit
@Date - 12th December 2023

I think Louis Reasoner might be onto something.
|#

(define (transfer from-account to-account amount)
  ((from-account 'withdraw) amount)
  ((to-account 'deposit) amount))

;There is obviously a problem.
;And that problem is multiple access.
;We need withdraw to happen in a single beat
;and deposit to happen in a single beat.

(define (transfer from-account to-account amount)
  (let ((serializer1 (from-account 'serializer))
        (serializer2 (to-account 'serializer)))
    ((serilizer1 (from-account 'withdraw)) amount)
    ((serializer2 (to-account 'deposit)) amount)))

;This is elementary when compared to exchange.
;Lets check and be sure none the less.
;I think I am going to stick with my vote.