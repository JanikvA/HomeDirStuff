#!/bin/sh
# $1: The name of the program. $2: The class name for i3
# i3-msg "exec --no-startup-id $1"
count=`ps aux | grep -c $1`
if [ $count -le 4 ]; then
    i3-msg "exec --no-startup-id $1"
else
    i3-msg "[class=$2] focus"
fi
