#!/bin/bash

# this shell receives 3 parameters
# parameter 1, a csv with 3 columns, in which we only want the 2nd and the 3rd columns' data, to gather 2nd and 3rd up and remove the duplicate, to get a clean list with
# parameter 2, a list with full information, the 1st column will match that list from parameter 1
# we want to get full information from parameter2 according to the list from parameter 1.
# parameter 3, the absolute path to the file where the target will be placed

TS=`date +%s`
#echo $TS

awk -F, 'NR==FNR{if($2 ~ /[0-9]/){print $2}}{if($3 ~ /[0-9]/){print $3}}' $1 $1 | sed -e 's///' | awk '!a[$0]++' > ./sub_list_intermediate.$TS.tmp

echo -e "\nintermediate unique skus file[././sub_list_intermediate.$TS.tmp] generated\nthis will be removed 10 seconds after this execution"
echo 'now extracting the final sales forecast result for gift skus...'
echo '------------it takes time, be patient..............'

awk -F, 'NR==FNR{a[$1]=$0;next}{print a[$0]}' $2 ./sub_list_intermediate.$TS.tmp > $3
TSE=`date +%s`

echo [`expr $TSE - $TS`]s to finish extracting
echo '~~~extracting finished, remove intermediate tmp file in 10s...'
sleep 10

rm ./sub_list_intermediate.$TS.tmp
echo 'finished and removed'
