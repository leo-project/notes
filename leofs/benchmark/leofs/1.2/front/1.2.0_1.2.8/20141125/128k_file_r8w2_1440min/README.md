## Benchmark LeoFS v1.2.1 NFS

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: 17.3
* LeoFS: v1.2.1
* LeoFS cluster settings:

```
 [System Confiuration]
-------------------------------+----------
 Item                          | Value    
-------------------------------+----------
 Basic/Consistency level
-------------------------------+----------
                System version | 1.2.1
                    Cluster Id | leofs_1
                         DC Id | dc_1
                Total replicas | 3
           # of successes of R | 1
           # of successes of W | 2
           # of successes of D | 2
 # of DC-awareness replicas    | 0
                     ring size | 2^128
-------------------------------+----------
 Multi DC replication settings
-------------------------------+----------
         max # of joinable DCs | 2
            # of replicas a DC | 1
-------------------------------+----------
 Manager RING hash
-------------------------------+----------
             Current ring hash | 76acdda2
            Previous ring hash | 76acdda2
-------------------------------+----------

 [Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 76acdda2       | 76acdda2       | 2014-11-21 17:55:47 +0900
  S    | leofs15@192.168.100.15      | stop         |                |                | 2014-11-25 09:59:25 +0900
  S    | leofs16@192.168.100.16      | running      | 76acdda2       | 76acdda2       | 2014-11-21 17:55:47 +0900
  S    | leofs17@192.168.100.17      | running      | 76acdda2       | 76acdda2       | 2014-11-21 17:55:47 +0900
  S    | leofs18@192.168.100.18      | running      | 76acdda2       | 76acdda2       | 2014-11-21 17:55:47 +0900
  G    | leofs13@192.168.100.13      | running      | 76acdda2       | 76acdda2       | 2014-11-21 17:55:52 +0900
-------+-----------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 1440 minutes
    * # of concurrent processes: 64
    * # of keys: 10000
    * Value size groups(byte):
        * 131072: 100%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [128k_file_r8w2_1440min.conf](20141121_180333/128k_file_r8w2_1440min.conf)

### OPS and Latency:

![ops-latency](20141121_180333/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20141121_180332/sar_1_20141121_180332_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20141121_180332/sar_3_20141121_180332_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20141121_180332/sar_3_20141121_180332_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20141121_180332/sar_3_20141121_180332_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20141121_180332/sar_3_20141121_180332_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20141121_180332/sar_2_20141121_180332_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20141121_180332/sar_3_20141121_180332_dev8-16-t1.png)
![Storage-1](leofs14_20141121_180332/sar_3_20141121_180332_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20141121_180332/sar_3_20141121_180332_dev8-16-t1.png)
![Storage-2](leofs15_20141121_180332/sar_3_20141121_180332_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20141121_180332/sar_3_20141121_180332_dev8-16-t1.png)
![Storage-3](leofs16_20141121_180332/sar_3_20141121_180332_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20141121_180332/sar_3_20141121_180332_dev8-16-t1.png)
![Storage-4](leofs17_20141121_180332/sar_3_20141121_180332_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20141121_180332/sar_2_20141121_180332_dev8-16-t1.png)
![Storage-5](leofs18_20141121_180332/sar_2_20141121_180332_dev8-16-t2.png)


#### Summary

* Total of network traffic: 0.83 Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |      6.1 |       6.6 |       12.7
storage_1 |      5.4 |       6.7 |       12.1
storage_2 |      5.4 |       6.7 |       12.1
storage_3 |      5.4 |       6.7 |       12.1
storage_4 |      5.9 |       7.3 |       13.2
gateway_0 |     26.9 |      17.3 |       44.2
Total     |     55.1 |      51.3 |      106.4
