#!/bin/bash

workdir="/home/taylor/git/message-a-day"
echo "" > ${workdir}/days-for-week

days=()

days+=($(( ( RANDOM % 7 ) + 1 )))
days+=($(( ( RANDOM % 7 ) + 1 )))
while [[ ${days[0]} -eq ${days[1]} ]]; do
  unset days[1]
  days+=($(( ( RANDOM % 7 ) + 1 )))
done
days+=($(( ( RANDOM % 7 ) + 1 )))
while [[ ${days[2]} -eq ${days[1]} ]] || [[ ${days[2]} -eq ${days[0]} ]]; do
  unset days[2]
  days+=($(( ( RANDOM % 7 ) + 1 )))
done

echo ${days[@]} > ${workdir}/days-for-week
