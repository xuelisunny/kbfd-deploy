#!/bin/bash
for ((i=01;i<05;i++)); do
	ssh aws$i <<EOF
		cd kbfd-deploy
		git pull
		cp data-exp.sh /home/ubuntu/run/data-exp.sh
		nohup /home/ubuntu/run/data-exp.sh > ~/load-data.txt 2>&1 &
		exit
EOF
done