#!/bin/bash
#[root account]
sudo cp /home/pi/Nanopi/sudoers /etc/sudoers
sudo cp /home/pi/Nanopi/passwd /etc/passwd
sudo cp /home/pi/Nanopi/group /etc/group
sudo cp /home/pi/Nanopi/sshd_config /etc/ssh/sshd_config
sudo service ssh restart

#[static ip]
sudo cp /home/pi/Nanopi/interfaces /etc/network/interfaces
sudo cp /home/pi/Nanopi/resolved.conf /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved.service
sudo systemctl enable systemd-resolved.service

#[package]
sudo apt-get update
#sudo apt-get install python-dev
sudo apt-get install python3
sudo apt-get install python3-pip
pip install pyserial
pip install sysv-ipc
git clone https://github.com/friendlyarm/RPi.GPIO_NP
cd RPi.GPIO_NP
python3 setup.py install
sudo python3 setup.py install

#[samba]
sudo apt-get install samba
sudo cp /home/pi/Nanopi/smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo smbpasswd -a pi 
#echo pi
#echo pi

#[hwclock]
sudo cp /home/pi/Nanopi/timezone /etc/timezone
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

#[start program]
#sudo cp /home/pi/Nanopi/profile /etc/profile

#[SD card mount]
sudo mkdir /mnt/SD

#[auto start]
cp /home/pi/Nanopi/auto.sh /home/pi/
cp /home/pi/Nanopi/auto.service /etc/systemd/system/
cp /home/pi/Nanopi/auto1.sh /home/pi/
cp /home/pi/Nanopi/auto1.service /etc/systemd/system/
cp /home/pi/Nanopi/.profile /home/pi/.profile
#systemctl start auto.service
#systemctl enable auto.service

#[rc.local]
cp /home/pi/Nanopi/rc.local /etc/rc.local
chmod +x /etc/rc.local
systemctl start rc-local.service
cp /home/pi/Nanopi/rc-local.service /usr/lib/systemd/system/rc-local.service
systemctl enable rc-local.service

echo Complete
