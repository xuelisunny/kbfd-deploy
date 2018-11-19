#config-sample.properties=$1
#$data=$1
#$run_mode = $2
#$dektag = $3
#$c= $4
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_8 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 8 $2 $3 $4 $5 $6
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_4 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 4 $2 $3 $4 $5 $6
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_12 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 12 $2 $3 $4 $5 $6
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_16 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 16 $2 $3 $4 $5 $6
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_20 hosts
sh scp.sh hosts hosts
sh executor.sh $1.properties 20 $2 $3 $4 $5 $6

