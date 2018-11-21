#!/bin/bash
nohup java -Djava.security.policy=security.policy -Xmx50G -jar  ./Mcoordinator.jar $1 $2 $3 > /home/ubuntu/coordinator.txt 2>&1 &