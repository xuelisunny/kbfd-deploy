#!/bin/bash
echo $1
cat $1 | while read line
do
if [ "$line" != "******" ];then
	echo ">>> Now install " $line
	/usr/bin/expect <<-EOF  #expect的路径
	spawn sudo apt-get install $line
	expect "y/N" 
	send "y\n"
	  
	if [ $?  -eq 0 ];then
		continue
	else
		echo 'install is  ERR'
		break
	fi
	expect eof 	
	EOF
else
	echo ">>> Now Remove " $line
	/usr/bin/expect <<-EOF
	spawn apt-get remove $line
	expect "y/N" 
	send "y\n"
	if [ $?  -eq 0 ];then
		continue
	else
		echo 'Remove is ERR'
		break
    fi
	expect eof            
	EOF
fi   