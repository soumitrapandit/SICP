#lang sicp
#|Continuous Fractions Reiterative
@Author = Soumitra Pandit|#

;Doing this reiteratively is going to take some creativity
;Well, what if I do it backwards? That might work

(define (cont-frac n d k)
  (define (cont-frac-iter n d k fraction)
    (if (= 0 k)
        fraction
        (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) fraction)))))
  (cont-frac-iter n d k 0))

;Lets See if this actually works


(define (golden-ratio k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(golden-ratio 12)
(golden-ratio 100)