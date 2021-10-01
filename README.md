Connect-Four

In this TOP project we are building a connect four game on the command line in a TDD(Test Driven Development) cycle. The goal of this project is to practice writing RSpec tests to ensure not only that the critical functions of the codebase executes as intended, but also to allow the code to be much more readable.

As of 9/30/2021, this project is completed. However there are some additional additions that may want to be considered:

UPDATING AI

Currently, the AI that the user plays against is very primitive. It does not take any strategy into account. It might be fruitful to look into the minimax algorithm and attempt to implement it so the AI will try and block the player from winning while also assuring that it will always choose it's own winning move if it exists.
