#!/bin/bash
git add --all
git commit -m "a"
git push
ssh aws01 <<EOF
	pkill -9 java
	mkdir run
	cp kbfd-deploy/coordinator.sh run/
	cp kbfd-deploy/Mcoordinator.jar run/
	cd run
	chmod +x coordinator.sh
	sh ./coordinator.sh ${1}.properties $2 $3
	exit
EOF
for ((i=2;i<=5;i++)); do
	 ssh aws0$i <<EOF
	 pkill -9 java
	 cp kbfd-deploy/worker.sh run/
	 cp kbfd-deploy/Mworker.jar run/
	 cd run
	 chmod +x worker.sh
	 sh ./worker.sh ${1}.properties $2 $3
	 exit
EOF
done
ssh aws01 <<EOF
    cp kbfd-deploy/client.* run/
	cd run
	chmod +x client.sh
	sh ./client.sh
	exit
EOF