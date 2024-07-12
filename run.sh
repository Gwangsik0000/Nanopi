#!/bin/bash
pid=`ps -ef | grep "python3 /home/pi/slcmain.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "run slcmain.py"
  nohup python3 /home/pi/slcmain.py&
fi

pid=`ps -ef | grep "python3 /home/pi/lcmain.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "run lcmain.py"
  nohup python3 /home/pi/lcmain.py&
fi

pid=`ps -ef | grep "python3 /home/pi/serial_ttyS2.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "run serial_ttyS2.py"
  nohup python3 /home/pi/serial_ttyS2.py&
fi

pid=`ps -ef | grep "python3 /home/pi/tcp_server.py" | grep -v 'grep' | awk '{print$2}'`
if [ -z "$pid" ]; then
	echo "run tcp_server.py"
  nohup python3 /home/pi/tcp_server.py&
fi
