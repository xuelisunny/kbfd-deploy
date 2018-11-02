#!/usr/bin/expect
set timeout 200000
set password Lee692817
spawn scp -r yli34@staff.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/group/project/dgrape/KBsFD/yago4 /home/ubuntu/data/
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

      