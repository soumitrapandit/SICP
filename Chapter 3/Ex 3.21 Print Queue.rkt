#lang sicp
#|Ex 3.21 Printing Queues
@Author - Soumitra Pandit
@Date - 8th Novemebr 2023
|#

(define (front-ptr queue) (car queue))

(define (print-queue queue)
  (front-ptr queue))

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
           (print-queue queue)))))

;Yeah, I was adding to the wrong end.

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called  with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         (print-queue queue))))


(define q1 (make-queue))

(insert-queue! q1 'a)

(insert-queue! q1 'b)

(delete-queue! q1)

(delete-queue! q1)
