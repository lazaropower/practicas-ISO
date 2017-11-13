#! /bin/bash -u

cal -1 2 $1 | tail -2 | grep -q 29
