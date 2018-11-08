#!/bin/bash
java -Djava.security.policy=security.policy -Xmx100G -jar ./Mworker.jar aws01 config-sample.properties $1 $2