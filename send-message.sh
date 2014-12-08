#!/bin/bash

workdir="/home/taylor/git/message-a-day"
today=`date +%m/%d`
limit=$(wc -l < ${workdir}/messages)
randomNum=$(($RANDOM % ${limit}))
randomNum=`expr $randomNum + 1`
pushbulletDir=
pushbulletAPI=
pushbulletDevice=

# check if today is a special day (e.g. anniversary, birthday, etc.)
testCommand=`grep -c ${today} ${workdir}/special-dates`

function send-message {
  ${pushbulletDir}/pushbullet_cmd.py $pushbulletAPI note $pushbulletDevice $message
}

if ! [ $testCommand = 0 ] ; then
  message=`grep ${today} ${workdir}/special-dates`
  send-message
else
  if [ `date +%u` -eq 1 ] || [ `date +%u` -eq 3 ] || [ `date +%u` -eq 6 ]; then
    message=`awk "NR==$randomNum { print; exit }" ${workdir}/messages`
    send-message
  fi
fi
