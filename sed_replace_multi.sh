#!/bin/bash

# parameter 1, the file to process
# parameter 2, the target file path
# this is to replace a series of specific text with the given ones

cw='1,0,0,0'
ce='0,1,0,0'
s='0,0,1,0'
b='0,0,0,1'

sed -e "s/PLACEHOLDER_CW/$cw/;s/PLACEHOLDER_CE/$ce/;s/PLACEHOLDER_S/$s/;s/PLACEHOLDER_B/$b/" $1 > $2
