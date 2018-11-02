#!/usr/bin/expect
set dataset [lindex $argv 0]
set password Lee692817
spawn scp -r yli34@staff.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/group/project/dgrape/KBsFD/$dataset /home/ubuntu/data/
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

      