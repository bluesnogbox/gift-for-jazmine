#!/bin/bash

workdir="/home/taylor/git/message-a-day"
today=`date +%m/%d/%Y`
message=`cat ${workdir}/messages |grep $today`


