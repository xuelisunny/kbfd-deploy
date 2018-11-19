$dir=/home/liuxueli/exp-nfd/data/datasets/
#size;count;data;
#$data=$1
#vary-count
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 5 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 10 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 15 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 20 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 25 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 30 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 35 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 40 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 45 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 50 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-GenerateDeltaG.jar 55 $1