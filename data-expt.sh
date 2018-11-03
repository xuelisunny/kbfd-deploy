#!/usr/bin/expect
set timeout -1
set dataset [lindex $argv 0]
set password Lee692817
spawn rsync -r yli34@staff.ssh.inf.ed.ac.uk:$dataset /home/ubuntu/data/
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

      