nohup java -Djava.security.policy=security.policy -Xmx25G -jar frag-coordinator.jar $1 $2 $3 $4 $5 $6 >> /home/ubuntu/coordinator.txt 2>&1  &
2>&1  &