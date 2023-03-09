#lang sicp
#| Ex 1.26
@Author - Soumitra Pandit
The first thing that strikes me as odd is that expmod is being
called twice now and that is going to result in a lot of redundant calculation
Can I see how that would transform an Olog(n) to O(n) procedure?
Not immediately. the original expmod was using the fact that x^n = x^n/2 * x^2
to give us logarithmic efficiency. But this algorithm is effectively undoing that process
bringing us back to O(n).
I do see it.|#