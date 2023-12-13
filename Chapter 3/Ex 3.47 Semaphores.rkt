#lang sicp
#|Ex 3.47 Semaphores
@Author - Soumitra Pandit
@Date - 13th December 2023

This is the last significant thing I am going to solve from this book.
I am not really interested in streams that much so I will solve them if the need ever arises.
Till then, I think this is going to be it.

Now, let me think about generalising aquisitions and releases.

Now, quite simply, instead of using a single cell, we can use a list of length n.
And Think about acquisitions and releases from that point of view.

So is it going to be like a queue for the new processes that want to acquire it?
Also when is a semaphore acquired?

and how can I make this fast?

So I am imagining the semaphore like a bus.
The thing that does need to happen concurrently is the individual mutex assignments.
Okay so lets try that implementation first.
|#

;Main Logic
#|
Okay, so let me think about this.
(make-mutex) returns a mutex.
A seriaizer uses a mutex. But how, exactly?
Oh, once the mutex is acquired by the process, all other processes have to wait.
Lets just make more mutexes and call it a day?
A semaphore just seems like a serializer with more mutexes or a mutex with more than a single cell.
This should be easy, theoretically.
|#

