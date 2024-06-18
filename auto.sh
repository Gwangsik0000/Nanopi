#!/bin/bash
#!/usr/bin/python3

while [ 1 ]
do
        pid=`ps -ef | grep "python3 /home/myir/slcmain.py" | grep -v 'grep' | aww
k '{print$2}'`
        if [ -z "$pid" ]
        then
            python3 /home/myir/slcmain.py &
        fi
done
