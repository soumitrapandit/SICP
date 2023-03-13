#lang sicp
#|Ex 2.8 sub-interval
@Author - Soumitra Pandit
|#

(define (make-interval a b)
  (cons (a b)))

(define (lower-boubd x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (add-interval a b)
  (make-interval (+ (lower-bound a )
                    (lowe-bound b))
                 (+ (upper-bound a)
                    (upper-bound b))))

(define (sub-interval a b)
  (let ((p1 (- lower-bound(add-interval a b)))
        (p2 (- upper-bound(add-interval ab))))
    (make-interval (min p1 p2) (max p1 p2))))

(define (mul-interval a b)
  (let ((up-a (upper-bound a))
        (low-a (lower-bound a))
        (low-b (lower-bound b))
        (up-b (upper-bound b)))
    (let ((p1 (* (up-a up-b)))
          (p2 (* (up-a low-b)))
          (p3 (* (low-a low-b)))
          (p4 (* (low-a up-b))))
      (make-interval (min (p1 p2 p3 p4))
                     (max (p1 p2 p3 p4))))))

(define (div-interval a b)
  (mul-interval a
                (make-interval(/ 1.0 (upper-bound b))
                              (/ 1.0 (lower-bound b)))))
