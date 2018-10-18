 
执行流程： 


#config hostname
# step: edit hosts in repo
# update repo
cp hosts /etc/hosts
# change hostname
sudo hostname awsNN

#config ssh
# local
./local-upload.sh aws.pem "~/.ssh/aws.pem"
./local-upload.sh config "~/.ssh/config"
# cluster
chmod 400 ~/.ssh/aws.pem




#!/bin/bash
command='sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update &&  sudo apt-get install oracle-java8-installer && sudo apt-get install git'
for ((i=1;i<5;i++)); do
	 ssh aws$i $command
done



Sequential： 

java -Djava.security.policy=security.policy -Xmx12G -jar ./sequential.jar config-sample.properties



yli34
Lee692817   