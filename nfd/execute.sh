#!/bin/bash
git add --all
git commit -m "a"
git push
ssh aws01 <<EOF
	pkill -9 java
	cd kbfd-deploy
	git pull
	sudo cp *.sh *.properties *.jar ~/run/
	cd ~/run/
	sudo chmod +x *.sh
	sh ./coordinator.sh ${1}.properties $2 $3
	exit
EOF
for i in {2,3,4,5}; do
	 ssh aws0$i <<EOF
	 pkill -9 java
	 cd kbfd-deploy
	 git pull
	 sudo cp *.sh *.properties *.jar ~/run/
	 sudo chmod +x *.sh
	 cd ~/run/
	 sh ./worker.sh ${1}.properties $2 $3
	 exit
EOF
done
ssh aws01 <<EOF
	cd run
	sh ./client.sh
	exit
EOF