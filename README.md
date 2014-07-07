# README #

I am working on the problems at [EulerProblems.org](http://www.eulerproblems.org) in order to work on my Ruby programming skills. Starting this after having done some web work in RoR over the past year, but having never worked with vanilla Ruby.


## Current Goals ##

* Clean Code
  * Succinct
  * Legible
  * Documented
* Good Code
  * Avoid Hacks
  * Avoid Bad Practices
* Fast Code
  * Go Beyond Naive Methods


## Future Goals ##

As I continue working on these problems I hope to eventually work on supporting code to help other people with building/testing their own libraries.

* Timing/Benchmarking each function
* Testing each function


## Organization ##

Each problem is solved with a simple method. These methods can be found in a file named with the problem number, for instance "001.rb" for the first problem. Each of these methods are named with the number of the problem, for instance "one". So far each method takes a single optional parameter, if the parameter isn't provided, then the default paramater will match the wording of the original problem.

### Example Usage ###
    irb> load './001.rb'
    irb> one 1000
    => 233168
    irb> one
    => 233168
    irb> one 20
    => 78
