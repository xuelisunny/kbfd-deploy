#config-sample.properties=$1
#$data=$1
#$run_mode = $2
#$c= $4
#ttl = $5
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_8 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 5 $4 $5 $6
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_4 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 10 $4 $5 $6
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_4 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 15 $4 $5 $6
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_12 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 20 $4 $5 $6
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_16 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 25 $4 $5 $6
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_16 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 30 $4 $5 $6
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_16 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 35 $4 $5 $6


