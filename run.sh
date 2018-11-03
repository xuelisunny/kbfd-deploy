 
执行流程：

sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

git clone https://github.com/xuelisunny/kbfd-deploy

chmod 400 aws_bj.pem aws_nx.pem

 ps -ef |grep yago4 | grep -v grep | awk  '{print $2}'|xargs kill -9 



pid=$(ssh root@$remote_host "ps -ef | grep data-expt | grep -v grep | awk  '{print $2}'"| awk '{print $2}')

ssh root@$remote_host "kill -9 ${pid}"

 rm -rf `ls  |egrep -v 'dbpedia4|yago4'`

#config hostname
# step: edit hosts in repo
# update repo
cp hosts /etc/hosts
# change hostname
sudo hostname awsNN

sudo cp kbfd-deploy/hosts /etc/hosts && cp kbfd-deploy/hosts ~/.ssh/ && cp kbfd-deploy/config ~/.ssh/

#config ssh
# local
./local-upload.sh aws.pem "~/.ssh/aws.pem"
./local-upload.sh config "~/.ssh/config"
# cluster
chmod 400 ~/.ssh/aws.pem

cd kbfd-deploy && cp hosts /etc/hosts && cp config ~/.ssh/ && cp aws_bj.pem ~/.ssh/ && chmod 400 ~/.ssh/aws_bj.pem  


#!/bin/bash
command='sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update &&  sudo apt-get install oracle-java8-installer && sudo apt-get install git'
for ((i=1;i<5;i++)); do
	 ssh aws$i $command
done


scp -r yli34@staff.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/group/project/dgrape/KBsFD/dbpedia4 ~/data/ 


yli34@staff.ssh.inf.ed.ac.uk
Lee692817  

Sequential： 

java -Djava.security.policy=security.policy -Xmx120G -jar ./sequential.jar config-sample.properties



parallel
java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 4 1 1
java -Djava.security.policy=security.policy -Xmx20G -jar ./Mworker.jar localhost config-sample.properties 4 1 1
java -Djava.security.policy=security.policy -Xmx2G -jar client.jar localhost 

#!/bin/bash
command1='cd kbfd-deploy && git pull && java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 3 1 1' 
command2='cd kbfd-deploy && git pull && java -Djava.security.policy=security.policy -Xmx20G -jar ./Mworker.jar aws01 config-sample.properties 3 1 1' 
command3='cd kbfd-deploy && git pull && java -Djava.security.policy=security.policy -Xmx20G -jar ./client.jar aws01'  
ssh aws01 $command1
sleep 3s
for ((i=2;i<5;i++)); do
	 ssh aws0$i $command2
	 sleep 3s
done
ssh aws01 $command3






parallel
java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 4 1 1
java -Djava.security.policy=security.policy -Xmx20G -jar ./Mworker.jar localhost config-sample.properties 4 1 1
java -Djava.security.policy=security.policy -Xmx2G -jar client.jar localhost 