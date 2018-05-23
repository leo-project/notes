#!/bin/bash

total=500
parallel=1
pass=$(( $total/$parallel - 1))

for i in $(seq 0 $pass)
do
    for j in $(seq 1 $parallel)
    do
        fileno=$(( $i*$parallel+$j ))
        echo $fileno
        ./s3cmd get "s3://test/$fileno" /dev/null --continue &
    done
    wait
done
