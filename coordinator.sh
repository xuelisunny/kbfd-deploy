#!/bin/bash
java -Djava.security.policy=security.policy -Xmx15G -jar -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=heapdump ./Mcoordinator.jar config-sample.properties 4 1 1