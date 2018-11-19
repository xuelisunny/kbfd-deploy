#config-sample.properties=$1
#n=$2
#mode=$3
#ratio=$4
#skew=$5
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_8 hosts
sh scp.sh hosts hosts
sh executor.sh dbpedia.properties 8 2 15 50
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_4 hosts
sh scp.sh hosts hosts
sh executor.sh dbpedia.properties 4 2 15 50
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_12 hosts
sh scp.sh hosts hosts
sh executor.sh dbpedia.properties 12 2 15 50
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_16 hosts
sh scp.sh hosts hosts
sh executor.sh dbpedia.properties 16 2 15 50
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_20 hosts
sh scp.sh hosts hosts
sh executor.sh dbpedia.properties 20 2 15 50
sleep 15s
sleep 5s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_8 hosts
sh scp.sh hosts hosts
sh executor.sh yago.properties 8 2 15 50
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_4 hosts
sh scp.sh hosts hosts
sh executor.sh yago.properties 4 2 15 50
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_12 hosts
sh scp.sh hosts hosts
sh executor.sh yago.properties 12 2 15 50
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_16 hosts
sh scp.sh hosts hosts
sh executor.sh yago.properties 16 2 15 50
sleep 15s
ps -ef|grep Djava|grep -v grep|cut -c 9-15|xargs kill -9
cp hosts_20 hosts
sh scp.sh hosts hosts
sh executor.sh yago.properties 20 2 15 50

