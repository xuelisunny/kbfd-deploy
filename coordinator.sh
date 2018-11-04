#!/bin/bash
java -Djava.security.policy=security.policy -Xms5G -Xmx20G  -Xmx10G -Xss10G -XX:PermSize=10G -XX:MaxPermSize=10G -jar ./Mcoordinator.jar config-sample.properties 4 1 1