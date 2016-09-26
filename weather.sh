#!/bin/sh

TIMEOUT=$(grep "TIMEOUT=" ./config.ini | grep -o "[0-9]*")

while [ true ]
do
    rm index.html
    wget -q	 pogoda.by
    echo `head -n 297 index.html | tail -n 1 | awk -F "<br>" {'print $2'}`
    sleep $TIMEOUT
done
