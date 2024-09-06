#!/bin/bash
while [ 1 ]
do
  # sleep 1
	pid=`ps -ef | grep "python3 /home/pi/lcmain.py" | grep -v 'grep' | awk '{print$2}'`
	if [ -z "$pid" ]; then
		nohup python3 /home/pi/lcmain.py 1>/home/pi/lc_log.out 2>/home/pi/lc_err.out &
		# nohup python3 /home/pi/lcmain.py&
	fi

	pid=`ps -ef | grep "python3 /home/pi/slcmain.py" | grep -v 'grep' | awk '{print$2}'`
	if [ -z "$pid" ]; then
		nohup python3 /home/pi/slcmain.py&
	fi

	pid=`ps -ef | grep "python3 /home/pi/tcp_server.py" | grep -v 'grep' | awk '{print$2}'`
	if [ -z "$pid" ]; then
	 	nohup python3 /home/pi/tcp_server.py&
	fi

	pid=`ps -ef | grep "python3 /home/pi/ttyS2_server.py" | grep -v 'grep' | awk '{print$2}'`
	if [ -z "$pid" ]; then
		nohup python3 /home/pi/ttyS2_server.py &
	fi

	sleep 5

done
