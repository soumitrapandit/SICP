#lang sicp
#|Ex 3.22 Queue as a procedure with local state
@Author - Soumitra Pandit
@Date - 8th Novemeber 2023
|#

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (make-queue) (cons '() '()))
    (define (set-front-ptr! queue item)
      (set-car! queue item))
    (define (set-rear-ptr! queue item)
      (set-cdr! queue item))
    (define (empty-queue? queue)
      (null? (front-ptr queue)))
    (define (front-queue queue)
      (if (empty-queue? queue)
          (error "FRONT called with an empty queue" queue)
          (car (front-ptr queue))))
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
    (define (delete-queue! queue)
      (cond ((empty-queue? queue)
             (error "DELETE! called  with an empty queue" queue))
            (else
             (set-front-ptr! queue (cdr (front-ptr queue)))
             queue)))
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            ((eq? m 'empty-queue?) empty-queue?)))
    dispatch))

(define (insert-queue! queue item)
  ((queue 'insert-queue!) item))

(define (delete-queue! queue)
  (queue 'delete-queue!))

(define (empty-queue? queue)
  (queue 'empty-queue?))


(define q1 (make-queue))

(insert-queue! q1 'a)

(insert-queue! q1 'b)

(delete-queue! q1)

(delete-queue! q1)

;I will come back to this.
;This is theoretically easy. But unravelling the dependencies is a bit tricky.