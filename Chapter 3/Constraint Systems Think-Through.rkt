#lang sicp
#|Constraint Systems Thinking
@Author - Soumitra Pandit
@Date - 29th November 2023

So I just want to think about constraint systems for a moment because this seems like a
very powerful idea.
The idea, at its core, is about relationships and the differnt perspectives from which we can
approach them.
It is also pieces of information and combination. The simplest observation is that every complex
idea can be broken down to its basic building block. At the lowest level, we have the primitives.
These would be variables or constants.
On a level above, we would have the primitive relationships. How can two basic elements relate in our
formulation of the problem?
And then, we can just use means of combination to build increasingly complex ideas.
Like I said, beautiful.

Okay, so now that I understand what we're doing, what am I thinking of?
Well, I am thinking how this fits into the larger scope of OOP and assignment.
I think the idea is that changing a node in a constraint network would cause a cascade of changes.
And I think that's the whole point.
If we had a functional system, this wouldn't really be possible.
The constraint network would have to be composed of different procedures with calls to other procedures.
And that is exactly what I was trying to do with my Screw Library as I had multiple ways of approach for the same quantity.

Okay, let me think about this some more because I think there might be some value here.

Procedures that return procedures, and create new frames in the process,
has to be the most powerful tool at our disposal.
And creating an object class seems like a step in the right direction for something like a Lie Group Library
|#

