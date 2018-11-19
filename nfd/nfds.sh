$dir=/home/liuxueli/exp-nfd/data/datasets/
#size;count;data;
$data=$1
#vary-size
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 2 100 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 3 100 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 4 100 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 5 100 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 6 100 $1
#vary-count
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 5 50 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 5 60 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 5 70 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 5 80 $1
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/data-gfdTree.jar 5 90 $1

