#lang sicp
#|Representing Queues
@Author - Soumitra Pandit
@Date - 8th November 2023

The whole idea is creating a data structure using
mutation that would allow us to execute a First In First Out (FIFO)
policy.

And in that effect, we produce the queue.

So what do we need?

A constructor:

(make-queue) that would return an empty queue. Hmm, so basically returns a procedure.

Two Selectors:

(empty-queue? queue) tells us if the queue is empty

and

(front-queue queue) return the object at the front of the queue. Does not modify the queue.

Two Mutators:

(insert-queue queue item) adds item to the end of the queue

(delete-queue queue) removes the item at the front of the queue and returns the modified queue.

So how can we represent this as a list?

Well, make-queue could return '()

And we could insert using set-cdr on the last pair.

We could maintain the first element at the car end of the list using this strategy.

Also, to make insertion efficient, we'll add a meta pointer to the tail end.

So essentially, we'll have two pointers, one pointing to the front of the list, or the front pointer and the other
pointing to the back of the list.

Okay, lets write this down. |#


;So what does our system look like?

(define (front-ptr queue) (car queue))

(define (rear-ptr queue) (cdr queue))

(define (make-queue) (cons '() '()))

(define (set-front-ptr! queue item)
  (set-car! queue item))

;(define x (list 1 2 3 4 5))

;(set-car! x 4)

;Exactly, there is no tailoring happening. I am guessing that comes later.
;Sure.

(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

(define (empty-queue? queue)
  (null? (front-ptr queue)))

;I have not used the book implementation here. Should I?
;Lets see if its an issue downstream.




(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

#|
(define (insert-queue! queue item)
  (if (null? item)
      (error "Invalid Insertion of Null Item")
      (set-cdr! item (front-ptr queue))
      (set-front-ptr! queue item)))
|#

;Oh, apparently, I was adding from the wrong direction? What?

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

;Yeah, I was adding to the wrong end.

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called  with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))


(define q1 (make-queue))

(insert-queue! q1 'a)

(insert-queue! q1 'b)

(delete-queue! q1)

(delete-queue! q1)
