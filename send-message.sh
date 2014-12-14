#!/bin/bash

workdir="/home/taylor/git/message-a-day"
today=`date +%m/%d`
limit=$(wc -l < ${workdir}/messages)
randomNum=$(($RANDOM % ${limit}))
randomNum=`expr $randomNum + 1`
pushbulletDir="/home/taylor/bin/pyPushBullet"
pushbulletAPI=P81dRv12Jp7cdza1zCbxyDidnyOl7YSV
pushbulletDevice=ufenwEfsjAiVsKnSTs
randomDays=(`cat ${workdir}/days-for-week`)

# check if today is a special day (e.g. anniversary, birthday, etc.)
testCommand=`grep -c ${today} ${workdir}/special-dates`

function send-message {
  ${pushbulletDir}/pushbullet_cmd.py $pushbulletAPI note $pushbulletDevice $message
}

if ! [ $testCommand = 0 ] ; then
  message=`grep ${today} ${workdir}/special-dates`
  send-message
else
  for x in ${!randomDays[@]}; do
    if [ $today -eq ${randomDays[x]}; then
      message=`awk "NR==$randomNum { print; exit }" ${workdir}/messages`
      send-message
    fi
  done
fi
