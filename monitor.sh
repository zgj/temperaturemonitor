#!/bin/bash

tlimit=$1
if [ x$tlimit = x ] ; then
tlimit=2500
fi

echo Limit $tlimit.

while : ; do
t=$(tail -1 logfile  | awk '{print $3}')
echo -n [monitor] $(date '+%Y-%m-%d %H:%M:%S') $t \($tlimit\)
if [ $t -ge $tlimit ] ; then
echo ALERT
tail ./logfile | ./sendmail.sh
else
echo
fi

sleep 300
done
