#!/bin/bash
value2=$1
value1=yli34@staff.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/group/project/dgrape/KBsFD/
path=${value1}${value2}
echo $path
git add --all
git commit -m "a"
git push
for ((i=1;i<=5;i++)); do
	ssh aws0$i <<EOF
	    ps -ef |grep rsync | grep -v grep | awk  '{print $2}'|xargs kill -9 
	    rm -rf `ls  |egrep -v 'dbpedia4|yago4'`
	    chmod +x /home/ubuntu/kbfd-deploy/jar/data-expt.sh
		nohup /home/ubuntu/kbfd-deploy/jar/data-expt.sh $path > ~/load-data.txt 2>&1 &
		exit
EOF
done

