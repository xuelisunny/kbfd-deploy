#!/bin/bash
# Version: 1.0
# Last edited time: 19:15 July,4 2016 
# Author: Chen Yubiao
# Email: cyb3727@126.com,15B903040@hit.edu.cn

#scp now only support the transmission between the hosts of the same user names'
user=`whoami` #you can change the `whoami` to the user account you want
domain=`hostname`


scpFun(){
	user=$1
	password=$2
	ip=$3
	src=$4
	des=$5	
	printf "\e[32m%s\e[0m \n"  "scpFun is Running:"
	echo "scpFun Parameters:"
	printf "\e[31m%-10s %-10s\n" "user:" $user
	printf "%-10s %-10s\n" "ip:"	$ip
	printf "%-10s %-10s\n" "src path:"	$src
	printf "%-10s %-10s \e[0m \n" "des path:"	$des
	expect -c"
		set timeout 300
		spawn scp -r $src ${user}@${ip}:${des}
		expect {
			\"*(yes/no)?\" 	{ send \"yes\r\"; exp_continue }
			\"*assword:\" 	{ send \"${password}\r\"; exp_continue }
			\"*100%*\"		{  }
		} 
		send \"exit\r\"
		expect eof"
	printf "\e[32m%s\e[0m \n\n"  "scpFun End"
}

mvFun(){
	user=$1
	password=$2
	ip=$3
	path=$4
	printf "\e[32m%s\e[0m \n"  "mvFun is Running:"
	echo "mvFun Parameters:"
	printf "\e[31m%-10s %-10s\n" "user:" $user
	printf "%-10s %-10s\n" "ip:"	$ip
	printf "%-10s %-10s\n" "path:"	$path
	expect -c"
		set timeout 30
		spawn ssh ${user}@$ip
		expect {
		\"*(yes/no)?\"	{ send \"yes\r\";  exp_continue }
		\"*password:\"	{ send \"$password\r\"; exp_continue }
		\"Last login:*\" {  }
		}
		send \"sudo rm -rf ${path}\r\"
		send \"exit\r\"
		expect eof"
		printf "\e[32m%s\e[0m \n\n"  "mvFun End"
}

installFun(){
	user=$1
	password=$2
	ip=$3
	software=$4
	printf "\e[32m%s\e[0m \n"  "installFun is Running:"
	echo "mvFun Parameters:"
	printf "\e[31m%-10s %-10s\n" "user:" $user
	printf "%-10s %-10s\n" "ip:"	$ip
	printf "%-10s %-10s\n" "software:"	$path
	expect -c"
		set timeout 300
		spawn ssh ${user}@$ip
		expect {
		\"*(yes/no)?\"	{ send \"yes\r\";  exp_continue }
		\"*password:\"	{ send \"$password\r\"; exp_continue }
		\"Last login:*\" {  }
		}
		send \"sudo yum install ${software}\r\"
		expect {
			\"*N]:\" { send \"y\r\"; exp_continue }
			\"*已安装*\" | \"*already installed*\" | \"Complete\"  {  }
			
		}
		send \"exit\r\"
		expect eof"
	printf "\e[32m%s\e[0m \n\n"  "installFun End"
}

NpFun(){
	user=$1
	password=$2
	ip=$3
	printf "\e[32m%s\e[0m \n"  "NpFun is Running:"
	echo "NpFun Parameters:"
	printf "\e[31m%-10s %-10s\n" "user:" $user
	printf "%-10s %-10s\e[0m\n" "ip:"	$ip
	expect -c"
	set timeout 30
	spawn ssh ${user}@$ip
	expect {
		\"*(yes/no)?\"	{ send \"yes\r\";  exp_continue }
		\"*password:\"	{ send \"$password\r\"; exp_continue }
		\"Last login:*\" {  }
	}
	send \"cat /home/${user}/.ssh/id_rsa.pub_temp >> /home/${user}/.ssh/authorized_keys\r\" 
	send \"chmod 600 /home/${user}/.ssh/authorized_keys\r\"
	send \"exit\r\"
	expect eof"
	printf "\e[32m%s\e[0m \n\n"  "NpFun End"	
}

excuteFun(){
	user=$1
	password=$2
	ip=$3
	shfile=$4
	opera=$5
	printf "\e[32m%s\e[0m \n"  "excuteFun is Running:"
	echo "mvFun Parameters:"
	printf "\e[31m%-10s %-10s\n" "user:" $user
	printf "%-10s %-10s\n" "ip:"	$ip
	printf "%-10s %-10s\n" "sh file:"	$shfile
	printf "%-10s %-10s\e[0m\n" "operation:"	$opera
	expect -c"
		set timeout 3
		spawn ssh ${user}@$ip
		expect {
		\"*(yes/no)?\"	{ send \"yes\r\";  exp_continue }
		\"*password:\"	{ send \"$password\r\"; exp_continue }
		\"Last login:*\" {  }
		}
		send \"sh ${shfile} ${opera}\r\"
		expect \"\*$\*\"
		expect \"*slaves.sh finished!*\"
		send \"exit\r\"
		expect eof"
	printf "\e[32m%s\e[0m \n\n"  "excuteFun End"
}

loginFun(){
	user=$1
	password=$2
	ip=$3
	printf "\e[32m%s\e[0m \n"  "loginFun is Running:"
	echo "loginFun Parameters:"
	printf "\e[31m%-10s %-10s\n" "user:" $user
	printf "%-10s %-10s\e[0m\n" "ip:"	$ip
	expect -c"
		set timeout 300
		spawn ssh ${user}@$ip
		expect {
		\"*(yes/no)?\"	{ send \"yes\r\";  exp_continue }
		\"*password:\"	{ send \"$password\r\"; exp_continue }
		\"Last login:*\" {  }
		}
		send \"exit\r\"
		expect eof"
	printf "\e[32m%s\e[0m \n\n"  "loginFun End"
}

#Give a help introduction of slaves
if [ $# == 0 ] || [[ $1 =~ "help" ]]
then	
	printf "Usage of slaves command:\n"
	printf "\e[31m%-4s %-4s %-4s %-4s\n" "slaves" "scp" "src" "des"
	printf "%-4s %-4s %-4s\n" "slaves" "mv" "\"file path\""
	printf "%-4s %-4s %-4s\n" "slaves" "install" "\"software\""
	printf "%-4s %-4s\e[0m %-4s\n" "slaves" "Np" "[SSH No Password from this Computer to All Hosts]"
	exit
fi

#Get the ip and domain name of all hosts
line_num=1
ip_array=()
domain_array=()
whole_domain_array=()
while read line
do
	if [[ $line =~ "master" ]]
	then	
		ip_array[0]=`echo $line | cut -d' ' -f1`
		domain_array[0]=`echo $line | cut -d' ' -f2`
		whole_domain_array[0]=`echo $line | cut -d' ' -f3`
	elif [[ $line =~ "slave" ]]
	then
		ip_array[$line_num]=`echo $line | cut -d' ' -f1`
		domain_array[$line_num]=`echo $line | cut -d' ' -f2`
		whole_domain_array[$line_num]=`echo $line | cut -d' ' -f3`
		line_num=`expr $line_num + 1`
	fi
done < "hosts"

#for ((i=0; i<${line_num};i++))
#do
#	echo ${ip_array[$i]}
#done
echo $line_num

echo "slaves' remote password is hitdblab528paper"
echo -n "please input the remote host ${user}'s password:"

password="hitdblab528paper"
if [[ domain=~"master" ]]
then
	password="hitdblab528paper"
	#read password #we should judge whether it is master node 
else
	password="hitdblab528paper"
fi

echo $password
para1=$1
echo $para1
#for ip in ${ip_array[@]}

#Generate the ssh-key
if [ ${para1} = "Np" ]
then
	rm -rf ~/.ssh/id_rsa*
	expect -c"
	spawn ssh-keygen -t rsa	
	expect \"/.ssh/id_rsa):\"
	send \"\r\"
	expect {
		\"*Overwrite (y/n)?\"	{ send \"y\r\"; exp_continue }
		\"*no passphrase):\"	{ send \"\r\" }
	}
	expect \"Enter same passphrase again:\"
	send \"\r\"
	expect eof"
	ssh-agent bash
	ssh-add -D #Delete all the private key of the ssh-agent
	ssh-add	#Add the private key into the ssh-agent
elif [ ${para1} = "install" ]
then
	echo -n "Please make sure you have setten up the repo resources on the master and send the CentOS7.repo to all slaves (yes\no)?"
	read judge
	if [[ ${judge} =~ "n" ]]
	then
		exit
	fi
fi

#Emurate all the slaves: 
for ((i=1;i<${line_num};i++))
do 	
	#Default:Do not deal with the localhost
	#if [ $domain = ${whole_domain_array[$i]} ]
	#then
	#	continue
	#fi

	ip=${ip_array[$i]}
	whole_domain=${whole_domain_array[$i]}
	if [ "${para1}" = "scp" ]
	then
		src=$2
		des=$3
		#expect scp.exp $user $password $ip $src $des
		scpFun $user $password $ip $src $des
	elif [ ${para1} = "mv" ]
	then
		path=$2
		echo "mv"
		mvFun $user $password $ip $path
	elif [ ${para1} = "install" ]
	then 	
		software=$2
		installFun $user $password $ip $software
	elif [ ${para1} = "excute" ]
	then
		sh_path=$2
		opera="$3"
		echo $opera
		excuteFun $user $password $ip $sh_path $opera
		#echo "excute not finished!"
	elif [ ${para1} = "Np" ] #no password
	then
		src="/home/${user}/.ssh/id_rsa.pub"
		des="/home/${user}/.ssh/id_rsa.pub_temp"
		scpFun $user $password $ip $src $des
		NpFun $user $password $ip
		#echo "NpFun is not finished!"
	elif [ ${para1} = "login" ]
	then
		loginFun ${user} ${password} ${whole_domain}
	#elif [ ${para1} = "" ]
	else
		echo "Wrong operation"
	fi
done
echo "slaves.sh finished!"
exit
