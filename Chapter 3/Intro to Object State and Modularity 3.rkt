#lang sicp
#|Intro to Object and State 3
@Author - Soumitra Pandit
@Date - 6th October 2023

In the previous iteration of withdraw, we were making only a
single withdrawal account and withdraw seemed to be able to access the previous
transactions through that account. But what if we want multiple accounts.
Can we do it with the previous withdraw? I don't know but I think it is worth checking out.
|#


(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient Funds"))))

(new-withdraw 10)

(define w1 new-withdraw)
(define w2 new-withdraw)

#|Even before I run this, I know its not going to work.
        And why is that? Probably because its just assigning
        two aliases to the same procedure.|#

(w1 20)
(w2 30)
(new-withdraw 11)

#|Yeah, that makes sense|#