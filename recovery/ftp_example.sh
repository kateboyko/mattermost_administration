spawn scp -r user@127.0.0.1:~/zip.zip ./
expect {
  -re ".*es.*o.*" {
    exp_send "yes\r"
    exp_continue
  }
  -re ".*sword.*" {
    exp_send "password\r"
  }
}
interact

