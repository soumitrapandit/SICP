#lang sicp
#|Ex 1.16|#
#|Fast Iterative Exponentiation|#
(define(expo b n)
  (expo_iter b n 1))

(define(even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define(expo_iter b n a)
  (cond((= n 0)a)
       ((= n 1)b)
       ((even? n)(expo_iter (square b) (/ n 2) b))
       (else (* b (expo_iter b (- n 1) a)))))

(expo 2 0)
(expo 2 1)
(expo 2 2)
(expo 2 3)
(expo 2 4)
(expo 2 5)
(expo 3 1)
(expo 3 2)
(expo 3 3)