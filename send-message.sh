#!/bin/bash

workdir="/home/taylor/git/message-a-day"

#if [[ `date +%u` -eq 7 ]]; then
#  echo "" > ${workdir}/randomdays

#  days=()

#  days+=($(( ( RANDOM % 7 ) + 1 )))
#  days+=($(( ( RANDOM % 7 ) + 1 )))
#  while [[ ${days[0]} -eq ${days[1]} ]]; do
#    unset days[1]
#    days+=($(( ( RANDOM % 7 ) + 1 )))
#  done
#  days+=($(( ( RANDOM % 7 ) + 1 )))
#  while [[ ${days[2]} -eq ${days[1]} ]] || [[ ${days[2]} -eq ${days[0]} ]]; do
#    unset days[2]
#    days+=($(( ( RANDOM % 7 ) + 1 )))
#  done
#  echo ${days[@]} > ${workdir}/randomdays
#fi

today=`date +%m/%d`
limit=$(wc -l < ${workdir}/messages)
randomNum=$(($RANDOM % ${limit}))
randomNum=`expr $randomNum + 1`
phoneNum="8149773797"
carrier="txt.mms.net"
randomDays=(`cat "${workdir}/randomdays"`)

# check if today is a special day (e.g. anniversary, birthday, etc.)
testCommand=`grep -c ${today} "${workdir}/special-dates"`

function send-message {
  echo "$message" | mail -s "Hey you!" ${phoneNum}@${carrier}
}

if ! [ $testCommand = 0 ] ; then
  message=`grep ${today} ${workdir}/special-dates`
  send-message
else
today=`date +%u`
if [[ $today -eq ${randomDays[0]} ]] || [[ $today -eq ${randomDays[1]} ]] || [[ $today -eq ${randomDays[2]} ]]; then
    message=`awk "NR==$randomNum { print; exit }" ${workdir}/messages`
    send-message
    echo "$message"
  fi
fi
