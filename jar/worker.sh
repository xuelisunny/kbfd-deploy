#!/bin/bash
java -Djava.security.policy=security.policy -Xmx100G -jar ./Mworker.jar aws01 $1 $2 $3