#!/bin/bash
pid=`ps -ef | grep "python3 /home/pi/lcmain.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "run lcmain.py"
  nohup python3 /home/pi/lcmain.py&
fi

pid=`ps -ef | grep "python3 /home/pi/slcmain.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "run slcmain.py"
  nohup python3 /home/pi/slcmain.py&
fi

pid=`ps -ef | grep "python3 /home/pi/tcp_server.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "run tcp_server.py"
  nohup python3 /home/pi/tcp_server.py&
fi

pid=`ps -ef | grep "python3 /home/pi/ttyS2_server.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "run ttyS2_server.py"
  nohup python3 /home/pi/ttyS2_server.py&
#  sleep 1
fi
