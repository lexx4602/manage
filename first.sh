#!/usr/bin/sh
#
# 1. Logon as SU
# 2. Copy base config to server
# 3. Add users
# 4. Install Base pachages
# 5. Config base packages
#
#
#
#



�ки bash:
set -x

�ные:
USER="admin"
PASSWD="123456"

#Файл логов:
LOG="ssh_conn.log"

#Список хостов:
HOSTS="
192.168.10.10
192.168.10.11
192.168.10.12
"

for H in $HOSTS
do

�пта:
echo START SCRIPT: >> $LOG
date +%x-%R >> $LOG

COMM="

#log_file debug.log
#exp_internal 1

е expect
set timeout 1

#Соедиение ssh:
spawn ssh $USER@$H
expect \"*(yes/no)?*\" {send \"yes\r\"}
expect \"Password:\"
send \"$PASSWD\r\"

манды:
expect \"*>\"
send \"show ver | include IOS\r\"
expect \"*>\"
send \"exit\r\"

�ия expect:
expect eof
"

� команд:
expect -c "$COMM" >> $LOG

теля:
echo ========================================================================= >> $LOG

done
