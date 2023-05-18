#lang sicp
;So apparently this is a comment
#|And
This
Is
A
Block
Comment|#
#|Its quite funny that I am solving a very cool probelem while
I am stillg getting my toes wet in Racket. Sounds weird but I did say it|#

#|Tree Recursion
The Spare Change Problem|#

(define (spare_change k n)
  (cond ((=(- n k)0) 1)
        ((<(- n k)0) 0)
        ((>(- n k)0)(+ (spare_change (fun 5) (- n k))
                       (spare_change (fun 4) (- n k))
                       (spare_change (fun 3) (- n k))
                       (spare_change (fun 2) (- n k))
                       (spare_change (fun 1) (- n k))))))

;Now I have a unique problem. I want to create a function
;A function that will replace k in our spare change function
;And do what? It will substitute k with our given quantities
;Wait a minute, that won't be wise, would it? K itslf is recursive
;How can I make k act as a list?
;Wait, I might not have lists but I do know that k can be a function
;A function that returns all values systematically
;What is the input though?

(define (fun k)
  (cond ((= k 5) 50)
        ((= k 4) 25)
        ((= k 3) 10)
        ((= k 2) 5)
        ((= k 1) 1)))
;Okay, what does this function do?
;Evalutes a function m-n number of times for
;Wait a minute. That's not what I want though.
;I want a function that will evaluae spare_change with different ks
;What happens if I let spare change run? Not much.
; I am approaching it from the wrong side. I need to define the node first
;Okay, so what's happening at the node?
;Multiple Checks
;Multiple Decisions
;Multiple function calls
;I know what to do but how should I write it?
;What am I struggling with? Multiple function calls
;Okay, I have gone back and altered the spare_change function
;But it just looks wrong
;So lets define another function
;lets add main
(spare_change (fun 5) 1)

#|Program Analysis
Okay, my program is incorrect. But why is it incorrect?
What am I doing incorrectly?
What am I doing in the program?
Oh, that's a grave error. Infact, why did the program even
Stop running?
Every recursive call is hardcoded. And that's exactly the issue
Why? Because that means that I am going to evaluate
(spare_change (fun 5) (50))+(spare_change (fun 4) (100))
Essentially at every node, I am calling a lot of unnecessry functions
Wait, slow down, what did you exactly do wrong? In the broadest terms?
I tried to solve five problems simultaneously
And that's not what the algorithm I design demands
Its a cascade and not a split. And why is it not a split?
Any time I fulfill the condition, there has to be a|#
