#!/bin/bash
value2=$1
value1=/afs/inf.ed.ac.uk/group/project/dgrape/KBsFD/dbpedia4
path=${value1}${value2}
echo $path
git add --all
git commit -m "a"
git push
for ((i=1;i<6;i++)); do
	ssh aws0$i <<EOF
		cd kbfd-deploy
		git pull
		cp data-expt.sh /home/ubuntu/run/data-expt.sh
		nohup /home/ubuntu/run/data-expt.sh > ~/load-data.txt 2>&1 &
		exit
EOF
	done

