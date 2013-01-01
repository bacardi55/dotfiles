#!/bin/bash

if [ "$#" -lt 1 ];
then
  echo "argument is needed (status, diff, update)"
  exit 0 
fi

# status :
if [ "$1" == "status" ];
then
  cvs status 2>&1 | egrep "(^\? |Status: )" | grep -v Up-to-date
fi;


# diff :
if [ "$1" == "diff" ];
then
  cvs diff -bup "$@" | colordiff | less -R
fi;

# update :
if [ "$1" == "update" ];
then
  cvs update -dP
fi;
