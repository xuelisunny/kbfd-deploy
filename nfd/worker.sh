nohup java -Djava.security.policy=security.policy -jar ./frag-worker.jar aws01 $1 $2 $3 $4 $5 $6 $7 > /home/ubuntu/worker.txt 2>&1 &