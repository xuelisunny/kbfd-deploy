#vary gfdsize $3 = 15
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-detector.jar $1 $2 5 
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-detector.jar $1 $2 10
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-detector.jar $1 $2 15
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-detector.jar $1 $2 20
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-detector.jar $1 $2 25
