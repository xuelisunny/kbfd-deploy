#!/bin/bash
nohup java -Djava.security.policy=security.policy -jar ./client.jar localhost >> /home/unbuntu/client.txt &