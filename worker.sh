#!/bin/bash
nohup java -Djava.security.policy=security.policy -Xmx50G -jar ./Mworker.jar aws01 $1 $2 $3 > /home/ubuntu/worker.txt 2>&1  &