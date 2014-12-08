#!/bin/bash

workdir="/home/taylor/git/message-a-day"
today=`date +%m/%d`
limit=$(wc -l < ${workdir}/messages)
randomNum=$(($RANDOM % ${limit}))
# check if today is a special day (e.g. anniversary, birthday, etc.)
testCommand=`grep -c ${today} ${workdir}/special-dates`

# make sure the random number != 0
if [ $randomNum = 0 ] ; then
  while [ $randomNum = 0 ]; do
    randomNum=$(($RANDOM % ${limit}))
  done
fi

if ! [ $testCommand = 0 ] ; then
  message=`grep ${today} ${workdir}/special-dates`
else
  message=`awk "NR==$randomNum { print; exit }" ${workdir}/messages`
fi
echo $message
