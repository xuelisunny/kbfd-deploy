#!/bin/bash
git add --all
git commit -m "a"
git push
ssh aws05 <<EOF
	pkill -9 java
	cd kbfd-deploy
	cp ./config/config /home/ubuntu/.ssh/
	git pull
	chmod +x ./jar/coordinator.sh 
	nohup ./jar/coordinator.sh $1.properties $2 $3 > /home/ubuntu/coordinator.txt 2>&1 &
	exits
EOF
for ((i=1;i<=4;i++)); do
	 ssh aws0$i <<EOF
	 pkill -9 java
	 cd kbfd-deploy
     cp ./config/config /home/ubuntu/.ssh/
	 git pull
	 chmod +x /jar/worker.sh
	 nohup ./jar/worker.sh $1.properties $2 $3 > /home/ubuntu/worker.txt 2>&1 & 
	 exit
EOF
done
ssh aws01 <<EOF
	cd kbfd-deploy/jar
	nohup ./jar/client.sh > /home/ubuntu/client.txt 2>&1 & 
	exit
EOF