#!/bin/bash
java -Djava.security.policy=security.policy -Xmx100G -jar ./Mworker.jar aws05 $1 $2 $3 >> /home/ubuntu/worker.txt &