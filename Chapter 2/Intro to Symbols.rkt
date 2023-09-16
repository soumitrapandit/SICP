#lang sicp
#|Experimentation with Symbols
@Author - Soumitra Pandit
@Date - 16th September 2023
The idea is that a quote in front of a
compound procedure changes its arguments to
symbols rather than variables.
I need to experiment a lot to digest the forms that
this idea can take.
Then there is also this (quote a) business which is
apparently equivalent to 'a.
And then finally, you have the eq? which compares two
symbols to determine their equality. |#

'a
;a this will give an error

(quote a)

''a

(quote 'a)

(quote (quote a)) ;I'm trying to see how this works
;So we will evaluate the inner quote a which will give us the symbol a.
;Then how is the quote sign added? Along which step?

;Or is that how the interpreter prints it out?

(quote (quote (quote a)))

;That does seem to be the case.

;Okay, now lets experiment with quoted lists
(quote (list a b c))

(quote (list (list a b) c))

(list 'a 'b 'c)
'(list a b c)

(car (quote (list a b c))) ;-> list
;So (quote (list a b c)) indeed is treating 'list' as a symbol

(list (quote (a b c)))

(quote (a b c))

;(quote a b c) -> bad syntax

'(a b c)
;So this is what the book meant by "conventional printed rep of lists".


;Okay, now, nil

'()

(null? '()) ;-> returns true
;This is cool. I don't know why, as of yet, but definitely cool.