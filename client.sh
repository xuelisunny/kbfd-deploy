#!/bin/bash
nohup java -Djava.security.policy=security.policy -jar ./client.jar localhost >> /home/ubuntu/client.txt &