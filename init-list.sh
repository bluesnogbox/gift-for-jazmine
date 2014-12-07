#!/bin/bash


function make_message {
    number=18
  count=1
  while [ $count -le 365 ]; do
    day=`date +%m/%d/%Y --date=${number}' days'`
    echo "${day}:  " >> ./messages
    echo "" >> ./messages
    count=$(($count + 1))
    number=$(($number + 1))
  done
}


if [ -f ./messages ]; then
  echo "File already exists!"
 # while true; do
    read -p "Do you want to overwrite the file? " yn
    case $yn in
      [Yy]* ) rm ./messages; touch ./messages; make_message;;
      [Nn]* ) exit;;
      * ) echo "Not a valid input.";;
    esac
#  done
else
  touch ./messages
  make_message
fi
