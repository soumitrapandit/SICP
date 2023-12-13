#lang sicp
#|Ex 3.48 Deadlock Avoidance I
@Author - A very exhausted Soumitra Pandit
@Date - 13th December 2023

Lets assume that accounts already have serial numbers

|#

(define (serialized-exchange account1 account2)
  (let ((serialized1 (account1 'serialized))
        (serialized2 (account2 'serialized)))
    (if (<(account1 'id) (account2 'id))
        ((serialized2 (serilized1 exchange))
         account1
         account2)
        ((serialized1 (serialized2 exchange))
         account1
         account2))))

;This should work. 