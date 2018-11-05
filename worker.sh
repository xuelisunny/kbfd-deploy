#!/bin/bash
java -Djava.security.policy=security.policy -Xmx20G -jar -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=heapdump ./Mworker.jar aws01 config-sample.properties 4 1 1 