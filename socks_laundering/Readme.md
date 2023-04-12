# The challenge
A complete description of this kata can be found [here](https://app.codility.com/programmers/trainings/3/socks_laundering/).
For this implementation, my main areas of focus were the following:
- Triying a new approach for TDD, thinking about the logical steps to solve the problem at hand first and implementing a test for each step later (see the section "Problem approach" below for more details).
- Testing my newfound Ruby skills, as I'm just starting to learn this language.

# Problem approach
This kata was inspired by the feedback received in a technical interview, which encouraged me to think of TDD in terms of steps to solve the problem and try not to spend too much time "in the red".
I tried to think of a big-picture solution of the problem and came out with the following logical steps:
1. Find all matched pairs of clean socks, since we don't need to use the washing machine's capacity to clean them –they are just ready to go!
2. Find all possible pairs of one-clean and one-dirty sock, since we only need to use 1 unit of washing machine capacity to produce a clean pair.
3. Find all matched pairs of dirty socks, which would require 2 units of washing machine capacity to produce a clean pair.

When designing the test, I included the three main functionalities along the following requirements:
- The socks that are already paired and clean should be deleted from the original arrays, so they aren't counted twice.
- Washing machine capacity should be reduced with each sock it cleans.
- The program should stop matching socks when there is no washing machine capacity left.
In the end, I feel that the steps between passing a test and implementing the following one where still quite big, but I'm not sure if this is due to the test methodology or because I'm working with a new-to-me language such as Ruby.

# Next steps
- Try to find more edge cases to test and make sure the solution is correct.
- Refactor as I learn more Ruby! In particular, I'd like to find a solution that doesn't mutate the class properties.

