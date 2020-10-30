#!/usr/bin/expect -f
#传输不完整解决办法：https://blog.csdn.net/ashic/article/details/46914589
set timeout -1
set userhost "<your domain name or IP>"
set username "<your remote host username>"
set password "<your remote host password>"
set src_file "<local file>"
set dest_file "<remote path>"
set port  "<remote port>"

spawn scp -P $port $src_file $username@$userhost:$dest_file
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
