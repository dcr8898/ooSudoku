# Sudoku Inside Out

When first learning Ruby, I was asked to write a Sudoku solver in conjunction with other programmers.  We got it working (with full tests, by the way), but the code was clunky and bloated.  It relied on iterative scans through the game board to look for reductions, then resorted to recursive blunt force when no further logical deductions were found.

While riding the train one night I realized that all those scans were unnecessary if, when "priming" the game board with the start values provided, you "push" the "consquences" of each start value out to its surrounding cells.  If the implications of those consequences results in the solution for an affected cell, then the implications of that fact are also propegated to surrounding cells in a ripple effect.  The result is that no "deductions" are required, because the implications of every cell's solution are immediately pursued.  Of course, brute force is still required when a solution is not found based only on the start values provided.

What was the result?  This approach solved the [most difficult sudoku in the world](http://www.telegraph.co.uk/news/science/science-news/9359579/Worlds-hardest-sudoku-can-you-crack-it.html) in 40% of the time of our prior approach.

TO DO:

* Clean up all of this procedural cruft into proper objects. :)
* Full test coverage.
