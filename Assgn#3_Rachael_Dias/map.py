#!/usr/bin/python

import sys
infile = sys.stdin
next(infile) # skip first line of input file
for line in infile:

    line = line.strip()
    line = line.split(",")
    
    if len(line) >=2:
        sex = line[1]
        age = line[2]
        
        print '%s\t%s' % (sex, age)
