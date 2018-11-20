#!/bin/bash
sh ./execute.sh dbpedia 8 2 15 1 400 4 
echo "begin to sleep to wait"
sleep 500s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 5
sleep 500s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 6
sleep 500s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 7
sleep 500s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 8
sleep 500s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 9
sleep 500s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 10
sleep 500s
sh ./test.sh
sleep 2s