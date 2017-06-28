# README #

I am working on the problems at [ProjectEuler.net](http://www.projecteuler.net). I've decided to build all of these in vanilla Ruby, and decided not to include any Gems or frameworks other than those needed for testing. In cases where a certain function in vanilla Ruby makes a question trivially simple (1-statement solutions), I will generally try to build my own equivalent of said function.


## Current Goals ##

* Clean Code
    * Succinct, Legible, Documented
* Fully Tested
    * Build out tests for each completed problem.
* Fast Code
    * Included benchmarking code can be run to determine slowest problems.


## Future Goals ##

As I continue working on these problems, I hope to build out a suite that allows other users to run their own solutions against mine.


## Organization ##

Each problem is solved with a simple method. These methods can be found in a file named with the problem number, for instance `solutions/001.rb` for the first problem. Each of these files contain a class named with the number of the problem, for instance `One`. Each initializer takes in any options, or can be initialized without options to solve the original question.


### Example Usage ###
```ruby
    irb> load 'euler.rb'
    irb> One.new(1000).solve
     => 233168
    irb> One.new.solve
     => 233168
    irb> One.new(20).solve
     => 78
    irb> TaylorTimer.time_all
    # Goes through the test suite and runs all, printing timing results.
```
