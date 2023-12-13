#lang sicp
#|Ex 3.42 Ben Bitdiddle's second suggestion
@Author - Soumitra Pandit
@Date - 6th December 2023

OKay so let me get this straight.
Ben wants us to have Global which will hold the make account def.
when make account is run, it creates E1 which in turn creates E2 and E3 due to the let statements
E3 holds the protected withdraw and deposit functions and the definition of Dispatch.
When dispatch is run, it returns an environment with a pointer to E3.
Okay, that's cool.
So where is the issue exactly?
Would there be a change in concurrency?
Absolutely not.
Is it a safe change to make? In my eyes - Yes!
|#

#|From the Wise Depths of the Internet:-
That is not the only difference. Every call to serializer returns a new function that accesses the same serializer.
With Ben Bitdiddle's version, only two serialized functions are created - one for withdraw and deposit. With the original solution,
a new serialized function is created on each call to withdraw or deposit.
As described by xdavidliu, the original is the safer solution,
since it's unclear whether a function would interleave with itself.
It's entirely possible, since each function call creates a new process which are treated differently.
|#

#| So, can a function interleave with itself if is run parrallely?
I think it can.
So the original is much safer and better.
Wow. What a trip.
|#