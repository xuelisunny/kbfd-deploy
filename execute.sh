#!/bin/bash
command1='nohup pkill -9 java && cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 3 1 1 >/dev/null 2>&1 &  exit' 
command2='pkill -9 java && cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./Mworker.jar aws01 config-sample.properties 3 1 1 >/dev/null 2>&1 &  exit' 
command3='cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./client.jar aws01 >/dev/null 2>&1 &  exit'  
ssh aws01 <<EOF
	pkill -9 java
	cd kbfd-deploy
	git pull
	cp coordinator.sh /home/ubuntu/run/coordinator.sh
	chmod +x /home/ubuntu/run/coordinator.sh
	nohup /home/ubuntu/run/coordinator.sh > /home/ubuntu/coordinator.txt 2>&1 &
	exit
EOF
for ((i=2;i<6;i++)); do
	 ssh aws0$i <<EOF
	 pkill -9 java
	 cd kbfd-deploy
	 git pull
	 cp worker.sh /home/ubuntu/run/worker.sh
	 chmod +x /home/ubuntu/run/worker.sh
	 nohup /home/ubuntu/run/worker.sh > /home/ubuntu/worker.txt 2>&1 & 
	 exit
EOF
done
ssh aws01 <<EOF
	cd kbfd-deploy
	git pull
	cp client.sh /home/ubuntu/run/client.sh 
	chmod +x /home/ubuntu/run/client.sh
	nohup /home/ubuntu/run/client.sh > /home/ubuntu/client.txt 2>&1 & 
	exit
EOF