#!/bin/bash
workdir="/home/taylor/git/message-a-day"
days=()
while [ ${#days[@]} -le 2 ]; do
  randomDay=$(($RANDOM % 7))
  randomDay=`expr $randomDay + 1`
  days+=($randomDay)
if ! [ -z "${days[1]}" ]; then
  while [ "${days[1]}" -eq "${days[0]}" ]; do
    unset 'days[1]'
  done
fi
if ! [ -z ${days[2]} ]; then
  while [ "${days[2]}" -eq "${days[1]}" ] || [ "${days[2]}" -eq "${days[0]}" ] ; do
    unset 'days[2]'
  done
fi
done
echo "${days[@]}" > ${workdir}/days
