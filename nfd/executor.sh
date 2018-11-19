echo $0 $1 $2 $3 $4 $5
dir=exp-nfd/target/
echo $dir/coordinator.sh 
sh $dir/coordinator.sh $1 $2 $3 $4 $5
echo $dir/workers.sh
./slaves.sh excute $dir/worker.sh $1 $2 $3 $4 $5
echo $dir/client.sh
sh $dir/client.sh
