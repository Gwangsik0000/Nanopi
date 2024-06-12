#!/bin/bash
while [ 1 ]
do
	pid=`ps -ef | grep "python3 /home/myir/init.py" | grep -v 'grep' | awk '{print$2}'`
	if [ -z "$pid" ]
	then
	    python3 /home/myir/init.py &
	fi
done
