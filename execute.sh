#!/bin/bash
command1='pkill -9 java && cd kbfd-deploy && git pull && nohup java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 3 1 1 > /home/ubuntu/coordinator.txt &  exit' 
command2='pkill -9 java && cd kbfd-deploy && git pull && nohup java -Djava.security.policy=security.policy -Xmx15G -jar ./Mworker.jar aws01 config-sample.properties 3 1 1 > /home/ubuntu/worker.txt 2>&1 &  exit' 
command3='cd kbfd-deploy && java -Djava.security.policy=security.policy -jar ./client.jar localhost > /home/ubuntu/client.txt 2>&1 &  exit'  
git add --all
git commit -m "a"
git push
ssh aws01 command1
for ((i=2;i<6;i++)); do
	ssh aws0$i command2
done
ssh aws01 command3