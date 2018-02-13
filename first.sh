#!/bin/sh
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



set -x

USER="user"
PASSWD="1"

#LOG="ssh_conn_$H.log"

HOSTS="
192.168.56.4
192.168.56.5
192.168.56.6
"

for H in $HOSTS
do
LOG="ssh_conn_$H.log"

echo START SCRIPT: >> $LOG
date +%x-%R >> $LOG

COMM="

#log_file debug.log
#exp_internal 1

set timeout 1

#Соедиение ssh:
spawn ssh $USER@$H
expect \"*(yes/no)?*\" {send \"yes\r\"}
expect \"Password:\"
send \"$PASSWD\r\"

expect \"*>\"
send \"uname -a & df -h\r\"
expect \"*>\"
send \"exit\r\"

expect eof
"

� команд:
expect -c "$COMM" >> $LOG

echo ========================================================================= >> $LOG

done
