#lang sicp
#|Ex 2.42 n-Queens Problem
@Author - Soumitra Pandit
@Date - 12th September 2023

Lets try and not make a big deal out of this.
Who knows, it might turn out to be easy.
|#

;Forethought
#| for safe? procedure,
I can have sub procedures that can check if
1)there is a queen on the diagonal
2)there is a queen in the same row
3)there is a queen in the same column

So how are we thinking about this?
How do we do this?

Objective -
Find the number of ways you can place n Queens
on a  nxn chess board.

As the chess board is symmetric, can I assert that
finding one solution is equivalent to finding 4?
No, lets not get into positional transforms just yet.

Also I remember somthing about Back Tracking from the
CMU python course. But that's not the idea we're exploiting here, is it?

Okay so back to how we can think about this.
I really want to say something like-

The number of ways to place n queens is
The number of ways to place 1 queen +
The number of ways to place n-1 queens.

Holy fuck that might actually be it.
God, is it actually that easy? Can't be, right?
Am I missing something?

Now might be a good time to look at the program logic
already given to me and add the functions where needed.
|#

#|
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board size))

|#

;Okay, so we can break this down into several sub procedures.
;First, lets begin with the representation of the board

;So, we have to figure out the adjoin-positon function
;My first idea is having a boolean representation of the position
;Where having a queen would mean having a 1 and the space being empty
;would be a zero.
;Now, unfortunately, lisp does not keep track of row and column number
;I can't just "index into" an element. I'll have to be more creative
;Or just dumber.
;Or maybe I can be smart.
;All I need is a list
;And the positions that the queen occupies.
;I don't necessarily need to see the entire board.
;Having the column number helps as well.
;What I am eventually going to have is a list of lists of lists.
;The inner most list would be a row of the board and its elements
;Would be the positions where a queen can be
;The second level would be a single solution to the puzzle
;And the third level would be all the solutions to the puzzle.

;Why do we need k in adjoin-position?

;=======================================================
;Auxillary Functions
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ 1 low) high))))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


;=======================================================



(define (adjoin-position new-row k some-nested-list)
  (append some-nested-list (list new-row)))

(define set-of-positions (list (list 1 3 4) (list 2 6 9) (list 8 6 3)))
(adjoin-position (enumerate-interval 1 4) 3 set-of-positions)









