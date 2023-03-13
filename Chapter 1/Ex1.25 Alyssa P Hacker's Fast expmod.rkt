#lang sicp
#|Ex 1.25|#
#| I am not sure about this one.
The implementation of expmod seems funny to me.
The idea that we are taking the modulo at each step and then squaring
just seems very counterintuitive.
My implementataion of expmod is analogous to what Alyssa is suggesting.
Functionally it is the same. But the people on the internet are
arguing that it would take longer as we are dealing with large numbers.
I would counter with - well, the remainder operation is being performed at each step.
So that would certainly make a n*root n procedure.|#