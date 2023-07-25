#!/bin/bash
while [ 1 ]
do
	pid=`ps -ef | grep "python3 /home/pi/lcmain.py" | grep -v 'grep' | awk '{print$2}'`
	if [ -z "$pid" ]
	then
	    #sleep 15
	    python3 /home/pi/lcmain.py
	fi
done
