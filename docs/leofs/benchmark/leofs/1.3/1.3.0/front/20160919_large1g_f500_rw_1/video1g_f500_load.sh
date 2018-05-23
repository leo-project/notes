#!/bin/bash

#truncate --size 1g video1g 
#dd if=/dev/urandom of=video1g bs=4M count=256

total=500
parallel=20
file=/dev/shm/video1g
pass=$(( $total/$parallel - 1))

for i in $(seq 0 $pass)
do
    for j in $(seq 1 $parallel)
    do
        fileno=$(( $i*$parallel+$j ))
        echo $fileno
        ./s3cmd put $file "s3://test/$fileno" &
    done
    wait
done
