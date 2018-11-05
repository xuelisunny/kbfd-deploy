#!/bin/bash
java -Djava.security.policy=security.policy -Xmx5G -jar -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/home/ubuntu/heapdump ./Mworker.jar aws01 config-sample.properties 4 1 1 