#!/usr/bin/expect -f
set timeout -1	
set userhost "192.168.1.1"
set username "root"
set password "password"
set src_file "socket-0.0.2-SNAPSHOT.jar"
set dest_file "/root/tyn/java_app"

spawn scp $src_file $username@$userhost:$dest_file
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
expect "100%"
expect eof
