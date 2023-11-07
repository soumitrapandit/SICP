#lang sicp
#|Intro to Object and State 2
@Author - Soumitra Pandit
@Date - 6th October 2023

We can now dig deeper into the concept of an internal or LOCAL varible.
And we will use Let for that, apparently.
|#

(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount)) balance)
          "Insufficient Funds"))))

(new-withdraw 10)
(new-withdraw 11)
(new-withdraw 12)

#|Okay, so what's happening here?
Like this point is where my understanding of the program begins to falter.
Nothing in our journey so far has allowed us to "Override" a let statement.
Which is what this feels like. Like we're doing something forbidden or prohibited.
I don't know. If I had to think of a way this could work, I would have to stretch
the let definition to accomodate for rewrties. Wait this is truly weird.
|#
