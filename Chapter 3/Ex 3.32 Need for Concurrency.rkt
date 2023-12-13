#lang sicp
#|Ex 3.32
@Author - Soumitra Pandit
@Date - 27th November 2023
|#

#|
Okay so this is such a cool concept that I am giddy with delight.
WE have the agenda, which is a time headed table.
And at initiation, we will have no items and no time slots.
And I am calling them "slots" but every time segment will contain actions which should
all in theory atleast, be executed in a single beat.
That's the beauty of the simulator. It highlights the need for concurrency.

Okay, so, I realise that I have not answered the question so let me answer that.

Okay, so apparently the procedures that are supposed to happen at each time step
are executed in a queue. FIFO.
Why would that be the case?
I don't know. I mean, nothing comes to me immediately.
My intutition says that actions that are added later to the agenda, or the time slot
are counting on the fact that the previous actions have been executed.
Does that make sense?
Lets say that we have wires A and B and two Actions, let say Act 1 and Act 2.
Now, Act 1 has been added to the agenda before Act 2, but they are scheduled to be executed
at the same time.
What does that mean?

Lets think about changes.

The and-gate example in the problem.

Oh. The inputs are changing from (0,1) to (1,0)
SO if the transition state is (0,0), rather than (1,1), the and gate behaviour would change
and there would be a ripple effect.

Basically, if a wire is scheduled to go from 0 to 1 while the other wire is going from 1 to 0,
due to a lack of concurrency, the order of the changes become of paramount importance.
So executing in the order in which the signal reaches the components is a very neat trick to avoid
unforced errors.

(0,1) -> (0,0) -> (1,0)

(0,1) -> (1,1) -> (1,0)


with Concurreny

(0,1) -> (1,0) ; Two mutations in a single step.

This is amazing.


|#