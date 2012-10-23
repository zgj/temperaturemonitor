#!/bin/bash


stty -F /dev/ttyS5 9600 cs8

while : ; do
n=$(./pullmod.sh)
t=$(date '+%Y-%m-%d %H:%M:%S')
echo [log] $t $n
echo $t $n >> logfile
sleep 60
done
