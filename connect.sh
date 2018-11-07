for ((i=1;i<=9;i++)); do
	 ssh aws0$i <<EOF
	 rm -rf ./data/dbpedia4
	 rm -rf ./data/yago8
	 pkill -9 java
	 cd kbfd-deploy
	 rm *.log
	 git pull
	 cp ./config /home/ubuntu/.ssh/config
	 exit
EOF
done
for ((i=10;i<=21;i++)); do
	 ssh aws$i <<EOF
	 rm -rf ./data/dbpedia4
	 rm -rf ./data/yago8
	 pkill -9 java
	 cd kbfd-deploy
	 rm *.log
	 git pull
	 cp ./config /home/ubuntu/.ssh/config
	 exit
EOF
done