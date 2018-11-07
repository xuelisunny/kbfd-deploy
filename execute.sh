#!/bin/bash
command1='pkill -9 java && cd kbfd-deploy && git pull && nohup java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 3 1 1 > /home/ubuntu/coordinator.txt &  exit' 
command2='pkill -9 java && cd kbfd-deploy && git pull && nohup java -Djava.security.policy=security.policy -Xmx15G -jar ./Mworker.jar aws01 config-sample.properties 3 1 1 > /home/ubuntu/worker.txt 2>&1 &  exit' 
command3='cd kbfd-deploy && java -Djava.security.policy=security.policy -jar ./client.jar localhost > /home/ubuntu/client.txt 2>&1 &  exit'  
git add --all
git commit -m "a"
git push
ssh aws21 <<EOF
	pkill -9 java
	cd kbfd-deploy
	git pull
	cp coordinator.sh /home/ubuntu/run/coordinator.sh
	chmod +x /home/ubuntu/run/coordinator.sh
	nohup /home/ubuntu/run/coordinator.sh > /home/ubuntu/coordinator.txt 2>&1 &
	exits
EOF
for ((i=1;i<6;i++)); do
	 ssh aws0$i <<EOF
	 sudo cp kbfd-deploy/hosts /etc/hosts 
	 cp kbfd-deploy/config ~/.ssh/
EOF
done
for ((i=1;i<=9;i++)); do
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
for ((i=10;i<20;i++)); do
	 ssh aws$i <<EOF
	 pkill -9 java
	 cd kbfd-deploy
	 git pull
	 cp worker.sh /home/ubuntu/run/worker.sh
	 chmod +x /home/ubuntu/run/worker.sh
	 nohup /home/ubuntu/run/worker.sh > /home/ubuntu/worker.txt 2>&1 & 
	 exit
EOF
done
ssh aws21 <<EOF
	cd kbfd-deploy
	git pull
	cp client.sh /home/ubuntu/run/client.sh 
	chmod +x /home/ubuntu/run/client.sh
	nohup /home/ubuntu/run/client.sh > /home/ubuntu/client.txt 2>&1 & 
	exit
EOF