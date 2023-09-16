#lang sicp
#|Ex 2.55 quote
@Author - Soumitra Pandit
@Date - 16th September 2023
|#

(car ''abracadabra)

;This prints out "quote"
;What is happening here?

(car (quote(quote abracadabra)))

;Do you see it now? This is what is happening.