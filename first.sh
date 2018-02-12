#!/usr/bin/expect -f
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



set prompt "#\>|\\\$"
spawn ssh USER@HOST

expect {
	"(yes/no)" {send "yes\r";exp_continue}
	"password"
}
send "su\r"
expect "password:"


set timeout 2
set USER "user"
set PASS "1"
set HOST "192.168.56.6"
set SUPASS "1"
spawn ssh $USER@$HOST;
 
expect {
 
"(yes/no)?*" {
send "yes\r"
 }
}
expect "word:"
send "$PASS\r"
expect "$*"
send "su $argv\r"
expect "$*"
send "$SUPASS\r"
send "df -h"
expect eof
