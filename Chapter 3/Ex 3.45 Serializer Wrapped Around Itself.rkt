#lang sicp
#|Ex 3.45 Louis Reasoner makes an Account
@Author - Soumitra Pandit
@Date - 12th December 2023

Well, the first thing that I see is that there is going to be a lot of
redundancy
Well, what happens when you serialize an already serialized procedure?
Does the serialization itself change?
I am not sure.
Anyway, I cannot think of major issues right away.
What will happen when serialised exchange is called?
Oh wow, this will never be able to get the key.
That's pretty bad.

Explanation -
We're using mutexes to implement serialization.
If we have a serializer wrapped around itself, you can see where things might start to break.
The first point is, that each call to serialized itself will require a mutex to be acquired. Once the first serializer does this,
the second call to serializer can no longer acquire the mutex and will go into an indefinite wait.

This can be disastrous.|#

