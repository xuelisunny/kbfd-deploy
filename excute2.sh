#!/bin/bash
command1='nohup pkill -9 java && cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 3 1 1 >/dev/null 2>&1 &  exit' 
command2='pkill -9 java && cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./Mworker.jar aws01 config-sample.properties 3 1 1 >/dev/null 2>&1 &  exit' 
command3='cd kbfd-deploy && java -Djava.security.policy=security.policy -Xmx20G -jar ./client.jar aws01 >/dev/null 2>&1 &  exit'  
git add --all
git commit -m "a"
git push
ssh aws10 <<EOF
	pkill -9 java
	cd kbfd-deploy
	git pull
	cp coordinator.sh /home/ubuntu/run/coordinator2.sh
	chmod +x /home/ubuntu/run/coordinator2.sh
	nohup /home/ubuntu/run/coordinator2.sh > /home/ubuntu/coordinator.txt 2>&1 &
	exit
EOF
for ((i=6;i<9;i++)); do
	 ssh aws0$i <<EOF
	 pkill -9 java
	 cd kbfd-deploy
	 git pull
	 cp worker.sh /home/ubuntu/run/worker2.sh
	 chmod +x /home/ubuntu/run/worker2.sh
	 nohup /home/ubuntu/run/worker2.sh > /home/ubuntu/worker.txt 2>&1 & 
	 exit
EOF
done
ssh aws10 <<EOF
	cd kbfd-deploy
	git pull
	cp client.sh /home/ubuntu/run/client.sh 
	chmod +x /home/ubuntu/run/client.sh
	nohup /home/ubuntu/run/client.sh > /home/ubuntu/client.txt 2>&1 & 
	exit
EOF