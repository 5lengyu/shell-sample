#!/bin/bash

# parameter 1 is a csv file with 7 columns
# parameter 2 is the target file path
# what we want is to extract the 1st 2nd 7th columns and append a date '2088-01-01 00:00:00' in the end of every line
# use NR!=1 to skip the column header

awk -F, '{if(NR!=1) print $1, $2, $7}' OFS=',' $1 | sed -e 's///;s/,/\",\"/g;s/^/\"/;s/$/\",\"2088-01-01 00:00:00\"/' > $2
