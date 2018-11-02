#!/bin/bash
pid=$(ssh root@$remote_host "ps -ef | grep data-expt | grep -v grep | awk  '{print $2}'"| awk '{print $2}')
for ((i=1;i<6;i++)); do
	 ssh aws0$i <<EOF
	 kill -9 ${pid}
	 exit
EOF
done