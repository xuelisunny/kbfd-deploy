#!/bin/bash
sh ./execute.sh dbpedia 8 2 15 1 400 3 
echo "begin to sleep to wait"
sleep 50s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 4
sleep 50s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 5
sleep 50s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 6
sleep 50s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 7
sleep 50s
sh ./test.sh
sleep 2s
sh ./execute.sh dbpedia 8 2 15 1 400 8