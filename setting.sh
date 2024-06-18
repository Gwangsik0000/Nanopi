#!/bin/bash
#[root account]
sudo cp /home/myir/Nanopi/sudoers /etc/sudoers
sudo cp /home/myir/Nanopi/passwd /etc/passwd
sudo cp /home/myir/Nanopi/group /etc/group
#sudo cp /home/myir/Nanopi/sshd_config /etc/ssh/sshd_config
sudo service ssh restart

#[static ip]
sudo cp /home/myir/Nanopi/interfaces /etc/network/interfaces
sudo cp /home/myir/Nanopi/resolved.conf /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved.service
sudo systemctl enable systemd-resolved.service

#[package]
sudo apt-get update
sudo apt-get install -y python3.8 python3.8-dev python3-pip pkg-config
sudo apt-get install -y gpiod libgpiod-dev
python3 -m pip install -U --user pip gpiod
#pip3 install gpiod
pip3 install pyserial
pip3 install sysv-ipc

#[samba]
sudo apt-get install samba
sudo cp /home/myir/Nanopi/smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo smbpasswd -a myir 
#echo myir
#echo myir

#[hwclock]
sudo cp /home/myir/Nanopi/timezone /etc/timezone
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

#[start program]
sudo cp /home/myir/Nanopi/profile /etc/profile

#[SD card mount]
#sudo mkdir /mnt/SD

#[auto start]
sudo cp /home/myir/Nanopi/auto.sh /home/myir/
sudo cp /home/myir/Nanopi/auto.service /etc/systemd/system/
#sudo cp /home/myir/Nanopi/auto1.sh /home/myir/
#sudo cp /home/myir/Nanopi/auto1.service /etc/systemd/system/
#sudo cp /home/myir/Nanopi/.profile /home/myir/.profile
systemctl start auto.service
systemctl enable auto.service

#[rc.local]
sudo cp /home/myir/Nanopi/rc.local /etc/rc.local
sudo chmod 777 /etc/rc.local
sudo systemctl start rc-local.service
sudo cp /home/myir/Nanopi/rc-local.service /lib/systemd/system/rc-local.service
sudo systemctl enable rc-local.service

echo Complete
