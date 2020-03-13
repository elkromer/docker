#!/usr/bin/expect
set masterpass "nadmin"
set pass "nbanana"
set princ "reese@ATHENA.MIT.EDU"

spawn /krb5-1.16.3/src/kadmin/dbutil/kdb5_util create -r ATHENA.MIT.EDU -s

expect "Enter KDC database master key:"
send "$masterpass\n"

expect "Re-enter KDC database master key to verify:"
send "$masterpass\n"

expect "#"

spawn /usr/local/sbin/kadmin.local

expect "kadmin.local:"
send "addprinc $princ\n"

expect "Enter password for principal \"reese@ATHENA.MIT.EDU\":"
send "$pass\n"

expect "Re-enter password for principal \"reese@ATHENA.MIT.EDU\":"
send "$pass\n"

expect "kadmin.local:"
send "exit\n"

expect "#"
