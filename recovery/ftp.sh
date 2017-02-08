spawn scp -r ftpuser@163.172.129.204:~/backup.zip ./
expect {
  -re ".*es.*o.*" {
    exp_send "yes\r"
    exp_continue
  }
  -re ".*sword.*" {
    exp_send "ktdjghfdj\r"
  }
}
interact

