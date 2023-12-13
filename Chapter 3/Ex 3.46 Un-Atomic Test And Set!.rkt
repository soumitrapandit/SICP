#lang sicp
#|Ex 3.46 Un-Atomic Test-and-Set!
@Author - Soumitra Pandit
@Date - 13th December 2023

The whole "atomic" aspect of serializers comes from making sure that the acquisition or the release of
mutexes happens atomically. Removing that would basically null and void the entire exercise.

|#