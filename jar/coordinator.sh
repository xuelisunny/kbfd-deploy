#!/bin/bash
java -Djava.security.policy=security.policy -Xmx100G -jar  ./Mcoordinator.jar config-sample.properties $1 $2