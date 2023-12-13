#lang sicp
#|Ex 3.38
@Author - Soumitra Pandit
@Date - 5th December 2023
I am trying to understand ways to approach concurrency and this exercise seems simple enough.
I do see an error though.
The withdrawal is dependent on balance directly. Which essentially makes the process dependent on the
balance.
To be fair, withdrawals are always going to be dependent on the current value in the account.
So I am not entirely sure how the book plans to deal with this.
I guess the idea is to highlight the "multiple correct solutions" issue that seems to arise with concurrency.
For now, lets design a bank system that can have joint accounts.
|#

;Make Account
;So how do I want to do this?
;Lets start with a basic implementation

(define (make-account balance)
    (define (withdraw amount)
      (if (> balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          (error "Insufficient Funds" balance)))
    (define (deposit amount)
      (if (> amount 0)
          (begin (set! balance (+ balance amount))
                 balance)
          (error "Deposit Positive Amount" balance)))
    (define (dispatch input)
      (cond ((eq? input 'withdraw)
             withdraw)
            ((eq? input 'deposit)
             deposit)
            (else (error "Incorrect Call" input))))
    dispatch)

(define (withdraw account amount)
  ((account 'withdraw) amount))

(define (deposit account amount)
  ((account 'deposit) amount))

;This is amazing.
;Okay so how is this working again?
;And have I fucked up the message passing at any point here?
;Essentially, I want to return an environment that takes in a request
;So make-account will return dispatch, which is itself a function that accepts an input
;I think this should work.
;Let's see.

(define account-1 (make-account 100))
(withdraw account-1 10)
(deposit account-1 100)

;I can definitely make arbitarily complex systems using these tenets of programming alone.
;Adding the ability to use lists and concurrency would be Godly power.

;Okay, now, moving to the actual exercise.
;What are we doing here exactly?
;We're dealing with concurrent transactions. And the issue is that the transactions are dealing with the
;same state. So they have to behave as if they happened serially.
;Given the order of execution, we can have a variety of results.
;IN the first part, we're not allowing interleaving of processes.
;Essentially, there are three processes happening in each transaction.
;The state is accessed. The state is altered. The state is returned.
;Or so I believe. If we allow interleaving, in between these accesses and changes, there will be a fuck tonne of problems.
;So I don't believe allowing processes to be interleaved is a fantastic idea.
;Line 69.