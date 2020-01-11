# auto-tester
#### A bash script for automating testing to standard out
The first line of a test is the exectuable to be run, and all further lines are the desired output.
The script runs the exectuable and checks its output against the desired output.
The -c flag is used for testing C programs, and recompiles the code using 'make all' before proceeding. 
