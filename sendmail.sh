#! /usr/bin/expect

set timeout 10

spawn telnet smtp.exmail.qq.com 25
expect "220*"

send "HELO HP\r"
expect "250*"

send "AUTH LOGIN username_encoded\r"
expect "334*"

send "password_encoded\r"
expect "235*"

send "MAIL FROM:<someone@somedomain.com>\r"
expect "250*"

send "RCPT TO:<someone@somedomain.com>\r"
expect "250*"

send "DATA\r"
expect "354*"

send "FROM: someone@somedomain.com\r"
send "TO: someone@somedomain.com\r"
send "SUBJECT: Alert\r"
send "\r"
send [exec cat]
send "\r.\r"
expect "250*"

send "QUIT\r"
expect "221*"
