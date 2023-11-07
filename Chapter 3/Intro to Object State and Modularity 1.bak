#lang sicp
#|Introduction to State and Modularity
@Author: Soumitra Pandit
@Date: 6th October 2023

We're using the concept of a global variable and a local variable to deal with the state of a system.
Now, I am trying to make sense of all the pieces of the puzzle.
Lets follow the book example and see where it takes us.
The first program uses the example of a withdrawal account.
And it returns a function that captures the state of the account.
Here's the interesting part though. It seems to be maintaining a ledger of transactions to give us the
accurate state of the system. And the way we do that is unclear to me.
|#

(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))

(withdraw 10)
(withdraw 11)
(withdraw 12)

#|Okay, so this program is very straightforward and I think we can indeed use the substitution model
(along with the concept of an environment perhaps) to explain this.|#


;moving on to the next program.