#!/bin/bash

cd ~
echo "The message should have been sent to Jazmine" | mail -s "project-init" 8149773797@mms.att.net
echo "I hope you like the gift I've been working on for you. You can read about it at https://github.com/bluesnogbox/gift-for-jazmine" | mail -s "Hey You!" jehackett0@gmail.com 
crontab -l > mycron
echo "05 08 * * * /home/taylor/git/gift-for-jazmine/send-message.sh" >> ./mycron
crontab ./mycron
rm ./mycron
