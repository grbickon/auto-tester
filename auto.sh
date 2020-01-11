#!/usr/bin/env bash

if [ "$#" -lt "1" ]
  then
    echo At least 1 arguments required
    exit 1
fi

while getopts ":c" option;
do
  case $option in 
    c)
      if [  -e "Makefile" ]
        then
          echo Makefile missing
          exit 1
      fi
      make clean
      make all
      shift
      ;;
    *)
      echo "invalid option -$OPTARG"
      ;;
  esac
done

while (( $# ))
  do
    echo You gave me $1
    if [ -e $1 ]
      then
      exp=`awk '{if(NR==2) print $0}' $1`
      rec=$($(awk '{if(NR==1) print $0}' $1))
      echo $exp
      echo $rec
      if [ $exp = $rec ]
        then echo Test $1 passed
        else echo Expected hello, Recieved ./$1
      fi
      else echo $1 does not exist
    fi
    shift
  done
