#!/bin/bash

cd ~
echo "I hope you like the gift I've been working on for you. You can read about it at https://github.com/bluesnogbox/gift-for-jazmine" | mail -s "Hey You!" 8149773797@mms.att.net 
#2409797031@mms.att.net
crontab -l > mycron
echo "05 08 * * * /home/taylor/git/gift-for-jazmine/send-message.sh" >> ./mycron
crontab ./mycron
rm ./mycron
