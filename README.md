# auto-tester
#### A bash script for automating testing to standard out
The first line of a test is the exectuable to be run, and all further lines are the desired output. The script runs the exectuable and checks its output against the desired output. Make sure you have execute permissions on the executables, and that all files used are in the same folder.

The -h flag displays all flags and their descriptions. The -a and -c flags are for testing C code.

#### Examples

```terminal
$ ./auto.sh -h
A bash script for automating testing to standard out
  -a(ll) runs 'make all' before running tests
  -c(lean) runs 'make clean' before running tests
  -h(elp) displays all flags and their descriptions

$ ./auto.sh test1
Test 'test1' passed

$ ./auto.sh test2
Test 'test2' failed
Expected; This is the first line
and this is the second.
Recieved; Hello
World!

$ ./auto.sh -a test_c
gcc -Wall -g -std=gnu99 -o c_echo c_echo.c

Test 'test_c_echo' passed
```
