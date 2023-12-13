#lang sicp
#|Understanding Serialization
@Author - Soumitra Pandit
@Date - 12th December 2023

What is exactly happening with this example?
|#

(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
                       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

(define (make-account-and-serializer balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            (else (error "Unknown request: MAKE-ACCOUNT" m))))
    dispatch))

(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer)))
    ((serializer1 (serializer2 exchange))
     account1
     account2)))


#|
So what are we doing here?
Lets break down the two most important functions
(serilizer2 exchange) is going to serialize exchange.
However, what will be the steps in the execution?
Here is what might be happening.
Serializer2 takes the exchange program and returns
serialized procedure that points to the env of acc 2
And then serializer1 takes this semi serialised procedure
and then serializes its remaining half? What?
What the fuck is going on?

Let me think in terms of procedures and states that they are changing.
Exchange is putting its greesy fingers into two environments.
That itself is very interesting.
So when it does ask for access, we want to be sure that the access is serialised.
That makes a lot more sense.
oh wow. Let creates a new environment
and the serializer procedures are "imported" from their home environments.
okay, I can move on

What GPT has to say:
What Exchange Does: The exchange function is designed to equalize the balances between two accounts.
It accesses and modifies the states (balances) of both account1 and account2.

The Role of Serializers: Each account has its own serializer.
The purpose of a serializer is to ensure that any procedure that accesses or modifies the state of the account does so exclusively,
preventing other procedures from interfering during its operation.

Nested Serialization:

First Layer (serializer2): When (serializer2 exchange) is executed, serializer2 (associated with account2) takes the exchange procedure and returns a new procedure.
This new procedure, when called, will first acquire exclusive access to account2, then execute exchange, and finally release the access to account2.
During this time, no other operation can modify account2.
Second Layer (serializer1): The result of (serializer2 exchange) is then passed to serializer1 (associated with account1).
serializer1 wraps this procedure further, so when this doubly-serialized procedure is executed,
it first acquires exclusive access to account1, then executes the previously serialized procedure (which handles account2), and finally releases account1.
Execution Steps:

The doubly-serialized procedure (created by nesting serializer1 around serializer2) first locks account1, ensuring no other operations can interfere with it.
It then locks account2 (as part of the serializer2 operation) and performs the exchange.
Once exchange is complete, account2 is unlocked, followed by the unlocking of account1.
Ensuring Atomicity Across Two Accounts: This nesting of serializers ensures that the exchange operation,
which affects two separate accounts, is treated as an atomic operation across both accounts.
It effectively prevents situations where one account is modified while another operation concurrently tries to modify the other account involved in the exchange.

About Environments and Serializers:

Each serializer is linked to the environment of its account.
This linkage is essential for the serializer to control access to the account's state (like balance).
The let construct in Lisp indeed creates a new environment each time it's called.
However, the serializers, when applied to a procedure,
don't create new environments but instead control access to the existing environments of their respective accounts.
|#

