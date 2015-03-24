## Benchmark LeoFS v1.2.7

### Purpose
We've checked LeoFS v1.2.7 w/watchdog + auto-compaction mechanism during 'recover-node command' to find issues.

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: 17.4
* LeoFS: v1.2.7
* LeoFS cluster settings:

```
 [System Confiuration]
---------------------------------+----------
 Item                            | Value    
---------------------------------+----------
 Basic/Consistency level
---------------------------------+----------
                  system version | 1.2.7
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
               current ring-hash | 2b468816
              previous ring-hash | 2b468816
---------------------------------+----------

 [State of Node(s)]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 2b468816       | 2b468816       | 2015-03-17 11:20:24 +0900
  S    | leofs15@192.168.100.15      | running      | 2b468816       | 2b468816       | 2015-03-17 11:20:24 +0900
  S    | leofs16@192.168.100.16      | running      | 2b468816       | 2b468816       | 2015-03-17 11:20:24 +0900
  S    | leofs17@192.168.100.17      | running      | 2b468816       | 2b468816       | 2015-03-17 11:20:24 +0900
  S    | leofs18@192.168.100.18      | running      | 2b468816       | 2b468816       | 2015-03-17 11:28:14 +0900
  G    | leofs13@192.168.100.13      | running      | 2b468816       | 2b468816       | 2015-03-17 11:20:30 +0900
-------+-----------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 720 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..  10240: 24%
        *  10240.. 102400: 30%
        * 102400.. 819200: 30%
        * 819200..1572864: 16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r999w1_720min.conf](20150317_112949/1m_r999w1_720min.conf)

### OPS and Latency:

![ops-latency](20150317_112949/summary.png)

### Network Traffic
#### Chart of Every Node

* Gateway-1
![Gateway-1](leofs13_20150317_112930/sar_1_20150317_112930_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20150317_112930/sar_3_20150317_112930_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20150317_112930/sar_3_20150317_112930_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20150317_112930/sar_3_20150317_112930_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20150317_112930/sar_3_20150317_112930_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20150317_112930/sar_2_20150317_112930_p1p1-if1.png)


### Disk
#### Chart of Every Node (Storage)

* Storage-1
![Storage-1](leofs14_20150317_112930/sar_3_20150317_112930_dev8-16-t1.png)
![Storage-1](leofs14_20150317_112930/sar_3_20150317_112930_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20150317_112930/sar_3_20150317_112930_dev8-16-t1.png)
![Storage-2](leofs15_20150317_112930/sar_3_20150317_112930_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20150317_112930/sar_3_20150317_112930_dev8-16-t1.png)
![Storage-3](leofs16_20150317_112930/sar_3_20150317_112930_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20150317_112930/sar_3_20150317_112930_dev8-16-t1.png)
![Storage-4](leofs17_20150317_112930/sar_3_20150317_112930_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20150317_112930/sar_2_20150317_112930_dev8-16-t1.png)
![Storage-5](leofs18_20150317_112930/sar_2_20150317_112930_dev8-16-t2.png)

