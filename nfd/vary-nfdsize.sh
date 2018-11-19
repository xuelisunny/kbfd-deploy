#config-sample.properties=$1
#$data=$1
#$run_mode = $2
#$c= $4
#ttl = $6
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_8 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 $3 $4 $5 505 
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_4 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 $3 $4 $5 605
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_4 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 $3 $4 $5 705
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_12 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 $3 $4 $5 805
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_16 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 $3 $4 $5 905
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_16 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 $3 $4 $5 1005


