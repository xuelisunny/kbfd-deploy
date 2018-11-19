java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-IncSequentialDec.jar syn1 $2 $3 
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-IncSequentialDec.jar syn2 $2 $3
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-IncSequentialDec.jar syn3 $2 $3
slee 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-IncSequentialDec.jar syn4 $2 $3
sleep 5s
java -Djava.security.policy=security.policy -Xmx25G -jar /home/liuxueli/exp-nfd/target/seq-IncSequentialDec.jar syn5 $2 $3