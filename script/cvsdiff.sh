#!/bin/bash

cvs diff -bup "$@" | colordiff | less -R
