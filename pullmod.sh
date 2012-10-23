#!/bin/bash

exec 3<>/dev/ttyS5
echo 01 04 80 00 00 01 18 0a | xxd -r -p >&3
h=$(dd bs=1 count=7 <&3 2>/dev/null | dd bs=1 count=2 skip=3 2>/dev/null | xxd -p -u)
echo "ibase=16;$h" | bc -l
exec 3>&-
