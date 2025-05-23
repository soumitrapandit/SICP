#lang sicp
#|Ex 3.41 Ben Bitdiddle's Concern
@Author - Soumitra Pandit
@Date - 6th December 2023

Ben is back and he has another assignment for me.
lets see what he is saying.
Okay so Ben wants to make accessing balance a serilised activity.
TO be honest, I don't immediately see the basis of his concern.
The idea of serilization, only matters if there is access and reassignment.
But Balance just gives us a snapshot in time of the state at that time.
Okay the one scenario in which this might be a problem is if Peter and Paul
have a shared account and they both try to access the balance at the same time.
Now that shouldn't be a problem.
If Paul has deposited money in a protected manner, the balance that he ended up accessing is the same as the one he
changed.
However, in the meantime, Peter could have swooped in and changed the balance with his own deposit or withdrawal.
But serializing balance retrieval does not seem like a solution to the problem.
Because what even are you serializing?
Just to be careful, I am going to see if there are alternate arguments here.
Okay so I think the general consensus agrees with me on this point so I'm good!
|#s