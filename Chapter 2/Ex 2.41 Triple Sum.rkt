#lang sicp
#|Ex 2.41 Sum Pair
@Author - Soumitra Pandit
@Date - 12th September 2023

Given n, find all unique triplets
i, j, k
less than or equal to n that sum
to a given s

Shouldn't be too hard|#

;Scaffold functions:-

;Accumulate
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))

;Flat Map
(define (flat-map proc seq)
  (accumulate append nil (map proc seq)))

;Enumerate
(define (enumerate low high)
  (if (> low high)
      nil
      (cons low (enumerate (+ 1 low) high))))

;Filter
(define (filter predicate seq)
  (if (null? seq)
      nil
      (if (predicate (car seq))
          (cons (car seq) (filter predicate (cdr seq)))
          (filter predicate (cdr seq)))))

;Unique Pairs
(define (unique-triples n)
  (flat-map (lambda (i)
              (flat-map (lambda (j)
                (map (lambda (k)
                       (list i j k))
                     (enumerate 1 (- j 1))))
              (enumerate 1 (- i 1))))
            (enumerate 1 n)))

;Lets test unique pairs
(unique-triples 4)

;triplet Sum
(define (triplet-sum triple)
  (accumulate + 0 triple))

;Sum Filter
(define (sum-filter sum seq)
  (filter (lambda (x) (= sum x)) seq))

;Combining Everything
(define (triple-sum-pair n sum)
  (sum-filter sum
              (map triplet-sum
                   (unique-triples n))))

(sum-filter 7 (map triplet-sum (unique-triples 4)))


(triple-sum-pair 4 7)
;Yay! Now onto the N-Queens Problem. 