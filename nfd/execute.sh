#!/bin/bash
git add --all
git commit -m "a"
git push
ssh aws01 <<EOF
	pkill -9 java
	rm ~/run/*
	cd kbfd-deploy
	cp security.policy ~/run/
	git pull
	cd nfd
	cp *.jar *.sh *.properties ~/run/
	cd ~/run/
	sudo chmod +x *.sh
	sh ./coordinator.sh ${1}.properties $2 $3 $4 $5 $6 $7
	exit
EOF
for i in {2,3,4,5,6,7,8,9}; do
	 ssh aws0$i <<EOF
		 pkill -9 java
		 rm ~/run/*
		 cd kbfd-deploy
		 cp security.policy ~/run/
		 git pull
		 cd nfd
	     cp *.jar *.sh *.properties ~/run/
		 cd ~/run/
		 sudo chmod +x *.sh
		 sh ./worker.sh ${1}.properties $2 $3 $4 $5 $6 $7
		 exit
EOF
done
ssh aws01 <<EOF
	cd run
	sh ./client.sh
	exit
EOF