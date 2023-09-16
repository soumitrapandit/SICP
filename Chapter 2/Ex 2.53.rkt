#lang sicp
#|Ex 2.53
@Author - Soumitra Pandit
@Date - 16th September 2023
Just checking my answers to the exercise

Predicted answers
(a b c)
((george))
(y1 y2)
y1
#f
#f
(red shoes blue socks)

|#

(list 'a 'b 'c)

(list (list 'george))

(cdr '((x1 x2) (y1 y2))) ;-> ((y1 y2))

(cadr '((x1 x2) (y1 y2)));-> (y1 y2)

;So why did I go wrong here?

(cdr (list (list 1 2) (list 3 4)))
;Have I missed this point all along?
;How tf does this evaluate to ((3 4))?
;Where is the nesting, exactly?

(car (list (list 1 2) (list 3 4)))
;Now that I think of it, I might be missing null.
;Yeah, I think that's what's happening.
;Okay, makes sense. I am missing that there is silent null
;and cdr gives me the remailing *list*.
;So that's where the nesting is coming from.


(pair? (car '(a short little)))

(memq 'red '((red shoes) (blue socks)))

(memq 'red '(red shoes blue socks))
