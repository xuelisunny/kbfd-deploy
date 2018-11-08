#!/bin/bash
git add --all
git commit -m "a"
git push
ssh aws01 <<EOF
	pkill -9 java
	cd kbfd-deploy
	git pull
	chmod +x ./coordinator.sh
	sh ./coordinator.sh ${1}.properties $2 $3
	exit
EOF
for ((i=2;i<=5;i++)); do
	 ssh aws0$i <<EOF
	 pkill -9 java
	 cd kbfd-deploy
	 git pull
	 chmod +x ./worker.sh
	 sh ./worker.sh ${1}.properties $2 $3
	 exit
EOF
done
ssh aws01 <<EOF
	cd kbfd-deploy
	sh ./client.sh
	exit
EOF