# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "${PS1-}" ]; then
  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

#!/usr/bin/env python3
#while [ 1 ]
#do
#	pid=`ps -ef | grep "sudo python3 /home/pi/slcmain.py" | grep -v 'grep' | awk '{print$2}'`
#	if  [ -z "$pid" ]
#	then
#		sudo python3 /home/pi/slcmain.py
#		sudo python3 /home/pi/lcmain.py
#		sudo python3 /home/pi/tcp_server.py
#	fi
#done
#sudo hwclock -s
