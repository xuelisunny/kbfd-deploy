 
执行流程：

open instance:

1. sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update &&  sudo apt-get install oracle-java8-installer && sudo apt-get install git && sudo apt-get install expect

2. nohup git clone https://github.com/xuelisunny/kbfd-deploy   > ~/gitclone.txt 2>&1 &

3. mkdir run && mkdir data && cd kbfd-deploy && cp config ~/.ssh/ && cp aws_bj.pem ~/.ssh && chmod 400 ~/.ssh/aws_bj.pem && sudo cp hosts /etc/hosts 


5. cd kbfd-deploy && cp *.jar *.sh security.policy *.properties ~/run/  && chmod 400 ~/run/*.sh


cd kbfd-deploy && git pull && cp *.jar *.properties ~/run/

mvn package && cp target/*.jar kbfd-deploy/ && cd kbfd-deploy && git add --all && git commit -m "a" && git push


sudo rm /var/lib/dpkg/info/oracle-java8-installer*  && sudo apt-get purge oracle-java8-installer* && sudo rm /etc/apt/sources.list.d/*java*


sudo rm /var/lib/dpkg/info/oracle-java8-installer*
sudo apt-get purge oracle-java8-installer*
sudo rm /etc/apt/sources.list.d/*java*
sudo apt-get update
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

/var/cache/apt/archives$

transfer data 

./load-data.sh dbpedia4

sudo rm /var/cache/debconf/*.dat 

cp *.jar ~/run/ && cp 




url_test(){
	URL=$1
	curl -s --head $URL|grep "200 OK"
	if [ $? -ne 0 ];then
		shell_unlock;
		writelog "test error" && exit;
	fi
}shell脚本while true
pre_test(){循环测试
	url_test "http://${PRE_LIST}/index.html"
	echo "add to cluster"
}


pre_test(){
	ssh aws01 <<EOF
	val=0
	while(( $val=0 ))  
    do  
     	ps -aux |awk '{print $11}' | grep "Djava" >/dev/null
		if [ $? -ne 0 ];then
			val=1;
		fi
		sleep 100s  
    done 
    exit
 EOF 
}
	


sudo rm /var/cache/apt/archives/lock && sudo rm /var/lib/dpkg/lock


chmod 400 aws_bj.pem aws_nx.pem

 ps -ef |grep yago4 | grep -v grep | awk  '{print $2}'|xargs kill -9 

  ps -ef |grep git | grep -v grep | awk  '{print $2}'|xargs kill -9 

find . -name ".DS_Store" -type f -print -exec rm -rf {} \;

pid=$(ssh root@$remote_host "ps -ef | grep data-expt | grep -v grep | awk  '{print $2}'"| awk '{print $2}')

ssh root@$remote_host "kill -9 ${pid}"

 rm -rf `ls  |egrep -v 'dbpedia4|yago4'`

 cp ./target/*.jar ./kbfd-deploy/ && cd kbfd-deploy && git add --all && git commit -m "a" && git push && ./execute.sh

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


sudo vim /etc/ssh/ssh_config

添加两行配置

ServerAliveInterval 30
ServerAliveCountMax 10

yli34@staff.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/user/y/yli34/exp-nfd/target/


scp -r yli34@staff.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/group/project/dgrape/KBsFD/dbpedia4 ~/data/ 


ssh yli34@staff.ssh.inf.ed.ac.uk
Lee692817  

Sequential： 

java -Djava.security.policy=security.policy -Xmx120G -jar ./sequential.jar config-sample.properties

java -Djava.security.policy=security.policy -Xmx120G -jar ./data-gfdTree.jar dbpedia1200-2000

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


load-data

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
		cd kbfd-deploy
		git pull
		cp data-expt.sh /home/ubuntu/run/data-expt.sh 
		chmod +x /home/ubuntu/run/data-expt.sh
		nohup /home/ubuntu/run/data-expt.sh $path > ~/load-data.txt 2>&1 &
		exit
EOF
done
for ((i=10;i<=21;i++)); do
	ssh aws$i <<EOF
		cd kbfd-deploy
		git pull
		cp data-expt.sh /home/ubuntu/run/data-expt.sh 
		chmod +x /home/ubuntu/run/data-expt.sh
		nohup /home/ubuntu/run/data-expt.sh $path > ~/load-data.txt 2>&1 &
		exit
EOF
done

#command='
#cd /etc/ld.so.conf.d;
#sudo touch hdfs.conf;
#sudo chmod 777 hdfs.conf;
#sudo echo '/usr/lib/jvm/java-8-oracle/jre/lib/amd64/server' >> hdfs.conf;
#sudo echo '/home/ubuntu/hadoop/c++/Linux-amd64-64/lib' >> hdfs.conf;
#sudo ldconfig -v'
command='mkdir /home/grape/graphlab_data'
echo $command
for i in {1..9};
do
	ssh aws0$i $command
done
for j in {10..20};
do
	ssh aws$j $command
done


#!/bin/bash
pid=$(ssh root@$remote_host "ps -ef | grep data-expt | grep -v grep | awk  '{print $2}'"| awk '{print $2}')
for ((i=1;i<6;i++)); do
	 ssh aws0$i <<EOF
	 kill -9 ${pid}
	 exit
EOF
done

parallel
java -Djava.security.policy=security.policy -Xmx20G -jar ./Mcoordinator.jar config-sample.properties 4 1 1
java -Djava.security.policy=security.policy -Xmx20G -jar ./Mworker.jar localhost config-sample.properties 4 1 1
java -Djava.security.policy=security.policy -Xmx2G -jar client.jar localhost 