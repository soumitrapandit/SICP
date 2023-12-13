#lang sicp
#|Ex 3.17 Count-Pairs Using Equality
@Author - Soumitra Pandit
@Date - 8th November 2023
This is what I had suggested doing last time.
So now that I think of it, every time, we encouter a
unique pair, we add it to our pair list.
Then for every list, we traverse our unique pair list and check
if there are any existing pointers to our pair already in our list
If not, we add the new pair and increment the couter.
Okay, lets do this.
|#


(define (unique? new-pair pair-list)
  (cond ((null? pair-list) true)
        ((eq? new-pair (car pair-list)) false)
        (else (unique? new-pair (cdr pair-list)))))

;lets test this quickly.
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (list 'e 'f))
(unique? x (list y z x))
#|(unique? (list 'a 'b) (list (list 'a 'b)))
(eq? (list 'a 'b) (list 'a 'b))
(define x (list 'a 'b))
(eq? (list 'a 'b) x)
(eq? x x)
|#

(define (count-pairs seq pair-list)
  (display "count pairs called")
  (newline)
  (cond ((not (pair? seq)) 0)
        ((memq seq pair-list) 0)
        
        (else
         ;If unique, add to list
         (set! pair-list
               (cons seq pair-list))
         
         (and (display "seq is ") (display seq))
         (newline)
         (and (display "pair list is ")
              (display pair-list))
         (newline)
         (+
            (count-pairs (car seq) pair-list)
            (count-pairs (cdr seq) pair-list)
            1
            ))))

;This gives rise to a very important and interesting question.
;How did append really work?

(define (append seq1 seq2)
  (if (null? seq1)
      seq2
      (cons (car seq1) (append (cdr seq1) seq2))))

(define seq1 (list 1 2 3))
(define seq2 (list 4 5 6))

(append seq1 seq2)

seq1
seq2
;So as I had thought, the original sequences remain unchanged.
;To actually change them, we will have to use the modified version of append.

(define z1 (cons x x))

(count-pairs z1 '())

;Okay, I have no idea why this is not working. Though I have a decent understanding why it might not be.
;I think I will come back to this shortly?

(define (count-pairs-new x)
  (let ((visited '()))
    (define (count x)
      (cond ((not (pair? x))
             0)
            ((memq x visited)
             0)
            (else
             (set! visited (cons x visited))
             (+ (count (car x))
                (count (cdr x))
                1))))
    (count x)))

(count-pairs-new z1)

;What the fuck. What the hell happened here?
;Oh wow, what an instructional mistake.
;The variable that I was modifying was in my local
;environment.
;And every subsequent call to count-pairs just forked it, I believe.
;Having the pair-list in the global environment makes a lot more sense.
