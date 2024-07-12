#!/bin/bash
sudo systemctl stop auto.service

pid=`ps -ef | grep "python3 /home/pi/slcmain.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "no pid"
else
	echo "kill slcmain.py"
	kill -9 "$pid"
fi

pid=`ps -ef | grep "python3 /home/pi/lcmain.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "no pid"
else
	echo "kill lcmain.py"
  kill -9 "$pid"
fi

pid=`ps -ef | grep "python3 /home/pi/serial_ttyS2.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "no pid"
else
	echo "kill serial_ttyS2.py"
	kill -9 "$pid"
fi

pid=`ps -ef | grep "python3 /home/pi/tcp_server.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "no pid"
else
	echo "kill tcp_server.py"
	kill -9 "$pid"
fi
