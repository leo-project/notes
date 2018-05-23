## Benchmark LeoFS v1.2.2 secio disabled

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: 17.4
* LeoFS: v1.2.2
* LeoFS cluster settings:

```
 [System Confiuration]
---------------------------------+----------
 Item                            | Value    
---------------------------------+----------
 Basic/Consistency level
---------------------------------+----------
                  system version | 1.2.2
                      cluster Id | leofs_1
                           DC Id | dc_1
                  Total replicas | 3
        number of successes of R | 1
        number of successes of W | 2
        number of successes of D | 2
 number of DC-awareness replicas | 0
                       ring size | 2^128
---------------------------------+----------
 Multi DC replication settings
---------------------------------+----------
      max number of joinable DCs | 2
         number of replicas a DC | 1
---------------------------------+----------
 Manager RING hash
---------------------------------+----------
               current ring-hash | 23100270
              previous ring-hash | 23100270
---------------------------------+----------

 [State of Node(s)]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 23100270       | 23100270       | 2014-12-25 12:32:56 +0900
  S    | leofs15@192.168.100.15      | running      | 23100270       | 23100270       | 2014-12-25 12:32:56 +0900
  S    | leofs16@192.168.100.16      | running      | 23100270       | 23100270       | 2014-12-25 12:32:56 +0900
  S    | leofs17@192.168.100.17      | running      | 23100270       | 23100270       | 2014-12-25 12:32:56 +0900
  S    | leofs18@192.168.100.18      | running      | 23100270       | 23100270       | 2014-12-25 12:32:56 +0900
  G    | leofs13@192.168.100.13      | running      | 23100270       | 23100270       | 2014-12-25 12:33:00 +0900
-------+-----------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 180 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..  10240: 24%
        *  10240.. 102400: 30%
        * 102400.. 819200: 30%
        * 819200..1572864: 16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r9w1_180min.conf](20141225_123416/1m_r9w1_180min.conf)

### OPS and Latency:

![ops-latency](20141225_123416/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20141225_123415/sar_1_20141225_123415_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20141225_123415/sar_3_20141225_123415_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20141225_123415/sar_3_20141225_123415_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20141225_123415/sar_3_20141225_123415_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20141225_123415/sar_3_20141225_123415_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20141225_123415/sar_2_20141225_123415_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20141225_123415/sar_3_20141225_123415_dev8-16-t1.png)
![Storage-1](leofs14_20141225_123415/sar_3_20141225_123415_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20141225_123415/sar_3_20141225_123415_dev8-16-t1.png)
![Storage-2](leofs15_20141225_123415/sar_3_20141225_123415_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20141225_123415/sar_3_20141225_123415_dev8-16-t1.png)
![Storage-3](leofs16_20141225_123415/sar_3_20141225_123415_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20141225_123415/sar_3_20141225_123415_dev8-16-t1.png)
![Storage-4](leofs17_20141225_123415/sar_3_20141225_123415_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20141225_123415/sar_2_20141225_123415_dev8-16-t1.png)
![Storage-5](leofs18_20141225_123415/sar_2_20141225_123415_dev8-16-t2.png)


#### Summary

* Total of network traffic: 5.98 Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |     30.3 |      19.5 |      49.8
storage_1 |     27.3 |      19.5 |      46.8
storage_2 |     28.3 |      19.5 |      47.8
storage_3 |     27.8 |      19.5 |      47.3
storage_4 |     27.8 |      19.5 |      47.3
gateway_0 |     52.2 |     473.6 |     525.8
total     |    193.7 |     571.1 |     764.8

