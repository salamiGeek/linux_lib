#!/usr/bin/expect -f
set timeout -1	
set userhost "192.168.1.1"
set username "root"
set password "password"
set port 22

spawn ssh $username@$userhost -p $port
 expect {
 "(yes/no)?"
  {
    send "yes\n"
    expect "*assword:" { send "$password\n"}
  }
 "*assword:"
  {
    send "$password\n"
  }
}
# 控制权移交
interact
