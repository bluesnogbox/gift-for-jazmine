#!/bin/bash

workdir="/home/taylor/git/message-a-day"
today=`date +%m/%d`
# sets $limit to the number of times the specificied string appears in the file
limit=`grep -c "Today, I want to remind you" ${workdir}/messages`
randomNum=$(($RANDOM % ${limit}))
# check if today is a special day (e.g. anniversary, birthday, etc.)
testCommand=`grep -c ${today} ${workdir}/messages`

if [ $testCommand = 0 ] ; then
  message=`grep ${today} ${workdir}/messages`
else
  message=`awk '/Today,\ I\ want\ to\ remind\ you/{i++}i==$(echo $limit)' ${workdir}/messages`
fi
echo $message
