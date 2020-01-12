#!/usr/bin/env bash

check_make () {
  if [ ! -e "Makefile" ]
    then
      echo Makefile missing
      exit 1
  fi
}

if [ "$#" -lt "1" ]
  then
    echo At least 1 arguments required
    exit 1
fi



while getopts ":ach" option;
do
  case $option in 
    a)
      check_make
      make all
      echo 
      ;;
    c)
      check_make
      make clean
      echo 
      ;;
    h)
      echo 'A bash script for automating testing to standard out'
      echo "  -a(ll) runs 'make all' before running tests"
      echo "  -c(lean) runs 'make clean' before running tests"
      echo "  -h(elp) displays all flags and their descriptions"
      echo 
      ;;
    *)
      echo "invalid option -$option"
      ;;
  esac
done

shift $(($OPTIND -1))

while (( $# ))
  do
    if [ -e $1 ]
      then
      exp=$(awk '{if(NR!=1) print $0}' $1)
      rec=$($(awk '{if(NR==1) print $0}' $1))
      if [ "$exp" = "$rec" ]
        then echo "Test '$1' passed"
        else echo "Test '$1' failed"
             echo "Expected; $exp"
             echo "Recieved; $rec"
      fi
      else echo Test \'$1\' does not exist
    fi
    shift
  done
