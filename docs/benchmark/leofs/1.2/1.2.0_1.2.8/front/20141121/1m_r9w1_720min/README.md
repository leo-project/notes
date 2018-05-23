## Benchmark LeoFS v1.2.1

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
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
             Current ring hash | 7fd26ff2
            Previous ring hash | 7fd26ff2
-------------------------------+----------

 [Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 7fd26ff2       | 7fd26ff2       | 2014-11-20 18:09:55 +0900
  S    | leofs15@192.168.100.15      | running      | 7fd26ff2       | 7fd26ff2       | 2014-11-20 18:09:55 +0900
  S    | leofs16@192.168.100.16      | running      | 7fd26ff2       | 7fd26ff2       | 2014-11-20 18:09:55 +0900
  S    | leofs17@192.168.100.17      | running      | 7fd26ff2       | 7fd26ff2       | 2014-11-20 18:09:55 +0900
  S    | leofs18@192.168.100.18      | running      | 7fd26ff2       | 7fd26ff2       | 2014-11-20 18:09:55 +0900
  G    | leofs13@192.168.100.13      | running      | 7fd26ff2       | 7fd26ff2       | 2014-11-20 18:09:59 +0900
-------+-----------------------------+--------------+----------------+----------------+----------------------------
```

* basho-bench Configuration:
    * Duration: 720 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r9w1_720min.conf](20141120_181212/1m_r9w1_720min.conf)

### OPS and Latency:

![ops-latency](20141120_181212/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20141120_181211/sar_1_20141120_181211_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20141120_181211/sar_3_20141120_181211_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20141120_181211/sar_3_20141120_181211_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20141120_181211/sar_3_20141120_181211_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20141120_181211/sar_3_20141120_181211_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20141120_181211/sar_2_20141120_181211_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20141120_181211/sar_3_20141120_181211_dev8-16-t1.png)
![Storage-1](leofs14_20141120_181211/sar_3_20141120_181211_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20141120_181211/sar_3_20141120_181211_dev8-16-t1.png)
![Storage-2](leofs15_20141120_181211/sar_3_20141120_181211_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20141120_181211/sar_3_20141120_181211_dev8-16-t1.png)
![Storage-3](leofs16_20141120_181211/sar_3_20141120_181211_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20141120_181211/sar_3_20141120_181211_dev8-16-t1.png)
![Storage-4](leofs17_20141120_181211/sar_3_20141120_181211_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20141120_181211/sar_2_20141120_181211_dev8-16-t1.png)
![Storage-5](leofs18_20141120_181211/sar_2_20141120_181211_dev8-16-t2.png)


#### Summary

* Total of network traffic: 6.44 Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |     35.2 |      20.5 |      55.7
storage_1 |     27.3 |      20.5 |      47.8
storage_2 |     28.3 |      21.0 |      49.3
storage_3 |     28.8 |      20.5 |      49.3
storage_4 |     29.8 |      22.0 |      51.8
gateway_0 |     58.6 |     512.7 |     571.3
total     |    208.0 |     617.2 |     825.2

