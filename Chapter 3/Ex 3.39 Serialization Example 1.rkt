#lang sicp
#|Ex 3.39
@Author - Soumitra Pandit
@Date - 5th December 2023
|#

#|Parallel Execution and the possibilities
Okay, so this is relatively straightforward.
We have two processes.
The first process, accesses the shared state variable thrice while the second accesses it twice.
We have serialised it in a way such that two of the accesses in the first code happen sequentially.
And the entire second process has been serialised.
This gives rise to three possibilities.
1.) P1 accesses x twice, then P2 happens and changes x to 11 and then P1 sets it to 100.
2.) P1 sets x to 100 then P2 sets it to 101
3.) p2 sets x to 11 and then P1 sets it to 121.

This is definitely cool, ngl.
|#
