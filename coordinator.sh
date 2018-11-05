#!/bin/bash
java -Djava.security.policy=security.policy -Xmx10G -jar -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/home/ubuntu/heapdump ./Mcoordinator.jar config-sample.properties 4 1 1