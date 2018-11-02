#!/bin/bash
command1='nohup pkill -9 java && cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 3 1 1 >/dev/null 2>&1 &  exit' 
command2='pkill -9 java && cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./Mworker.jar aws01 config-sample.properties 3 1 1 >/dev/null 2>&1 &  exit' 
command3='cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./client.jar aws01 >/dev/null 2>&1 &  exit'  
ssh aws01 <<EOF
	pkill -9 java
	cd kbfd-deploy
	git pull
	chmod +x coordinator.sh
	nohup coordinator.sh > /home/ubuntu/coordinator.txt 2>&1 &
	sleep 3s
	exit
EOF
for ((i=2;i<5;i++)); do
	 ssh aws0$i <<EOF
	 pkill -9 java
	 cd kbfd-deploy
	 git pull
	 chmod +x worker.sh
	 nohup worker.sh > /home/ubuntu/worker.txt 2>&1 & 
	 exit
EOF
done
ssh aws01 <<EOF
	cd kbfd-deploy
	git pull
	chmod +x client.sh
	nohup client.sh > /home/ubuntu/client.txt 2>&1 & 
	exit
EOF
exit 0