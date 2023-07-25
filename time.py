import os
import time
from datetime import datetime

s = os.popen("hwclock -f /dev/rtc1").read().split(".")[0]

#print(s)

hwclock_timestamp = time.mktime(datetime.strptime(s, '%Y-%m-%d %H:%M:%S').timetuple())

set_time = "2023-07-18 18:00:00"
set_time_timestamp = time.mktime(datetime.strptime(set_time, '%Y-%m-%d %H:%M:%S').timetuple())

#print(hwclock_timestamp)
#print(set_time_timestamp)
if hwclock_timestamp < set_time_timestamp:
    #os.system("date -s '2023-07-18 18:00:00'")
    os.system("hwclock -f /dev/rtc1 --set --date='2023-07-18 18:00:00'")
#os.system("hwclock -f /dev/rtc1")
