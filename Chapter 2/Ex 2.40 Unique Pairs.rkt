#lang sicp
#|Ex 2.40 Unique Pairs
@Author - Soumitra Pandit
@Date - 12th September 2023

I did a lot yesterday and hopefully, over this
session, most of it will come back to me.
Yesterday, we dabbled in nested maps and used them
like nested for - loops. Which I think is kinda of
neat. I mean, I think that's the same idea that I
will eventually exploit in Python using List Comprehensions
Also, I discovered that thinking about "map" not as a map
but as "for every" helps me a lot more. Or even, in a
more verbose fashion, thinking of it as "For every, do".

Now, onto today's sesssion.
A procedure to simplify (and modularize) prime sum pairs
could be created that returns a list of unique pairs
(1 <= j < i <= n)
Now, I am uncertain if I am supposed to improve upon the
current implementation or just abstract it but lets see|#

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))

(define (flat-map proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair)))) ;Here cadr is the car of cdr

;Fuck, am I going to have to rewrite is-prime?
(define (square a)
  (* a a))

(define (divides? a b)
  (= 0 (remainder a b)))

(define (find-divisor n divisor)
  (cond ((> (square divisor) n) n)
        ((divides? n divisor) divisor)
        (else (find-divisor n (+ divisor 1)))))

(define (find-lowest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (find-divisor n 2)))

;Nope, I just stole it from past Soumitra
;This implementation is exploiting some divisor rule that I don't remember currently
;The good thing is that I am certain that it works so I don't have to concern myself
;with the actual implementation and treat it as a black box.

(define (unique-pairs n)
  (flat-map (lambda (i)
         (map (lambda (j)
                (list i j))
              (enumerate 1 (- i 1))))
       (enumerate 1 n)))

(define (filter predicate seq)
  (if (predicate (car seq))
      (cons (car seq) (filter predicate (cdr seq)))
      (filter predicate (cdr seq))))

(define (make-pair-sum pair)
  (list (car pair) (cdr pair) (+ (car pair) (cadr pair))))

(define (enumerate low high)
  (if (> low high)
      nil
      (cons low (enumerate (+ 1 low) high))))

;And now the entire program
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))
;This is so beautiful. So pretty. And so readable. 

(enumerate 4 7)
(unique-pairs 3)