#!/bin/bash
ssh aws01 <<EOF
	while true 
	do 
		process=`ps aux | grep Djava | grep -v grep`; 
		if [ "$process" == "" ]; then 
			echo "process 不存在,开始执行next"; 
			break;
		else 
			echo "process exsits"; 
			sleep 30s
		fi 
	done
	exit
EOF