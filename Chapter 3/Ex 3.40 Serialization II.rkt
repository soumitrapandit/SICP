#lang sicp
#|Ex 3.40 Serialization II
@Author - Soumitra Pandit
@Date - 6th December 2023

So now we have a slightly modified version of P1 and P2
P1 now has 3 accesses to the shared variable
P2 now has 4 accesses to the shared variable.

So now, if we permit interleaving, we will have 7 distinct possibilities.
P1 sets x then P2 sets x => 1000000
p2 sets x then P1 sets x => 1000000

Oh, now I see it. As we're performing the same calculations, we'll have the same result
no matter what path we take.
So just a single answer but seven possible paths to it.
Or that's what my gut is saying at the moment.
|#