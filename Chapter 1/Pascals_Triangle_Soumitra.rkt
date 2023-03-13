#lang sicp
#| Pascal's Triangle|#
;a bit more involved perhaps
;How can I compute a pascal's traingle?
;Well everything on the edge is a 1

(define (pascal R C)
  (cond ((or ( = R 1)(= R 2)(= R C)(= C 1)) 1)
        (else(+ (pascal (- R 1)(- C 1))(pascal (- R 1)C)))))
;R = Row number
;C = Column number

;Now I need to create a function, that given the index, returns the Row number

(define (row_number x_tofind n )
  (cond ((<= x_tofind (/(* n (+ n 1))2)) n)
        (else (row_number x_tofind (+ n 1)))))

(define (find_row x_tofind)
  (row_number x_tofind 1))

;Now I need a function to find the column number

(define (column_number x_tofind given_row_number)
  (- given_row_number (- (/(* given_row_number (+ given_row_number 1)) 2) x_tofind)))

;Combine them
(define (find_col x_tofind)
  (column_number x_tofind (find_row x_tofind)))

;Let's test these first
(define (find_nth_pascal n)
  (pascal(find_row n)(find_col n)))

;Final Checks
(find_nth_pascal 6)
(find_nth_pascal 4)
(find_nth_pascal 12)
(find_nth_pascal 2)