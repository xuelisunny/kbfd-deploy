#!/bin/bash
value2=$1
value1=yli34@staff.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/group/project/dgrape/KBsFD/
path=${value1}${value2}
echo $path
git add --all
git commit -m "a"
git push
for ((i=6;i<=9;i++)); do
	ssh aws0$i <<EOF
	    mkdir data
	    mkdir run
		cd kbfd-deploy
		git pull
		cp data-expt.sh /home/ubuntu/run/data-expt.sh 
		chmod +x /home/ubuntu/run/data-expt.sh
		nohup /home/ubuntu/run/data-expt.sh $path > ~/load-data.txt 2>&1 &
		exit
EOF
done

