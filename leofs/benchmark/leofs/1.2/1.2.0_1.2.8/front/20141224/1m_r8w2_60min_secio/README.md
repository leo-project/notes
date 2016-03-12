## Benchmark LeoFS v1.2.2 secio enabled

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
               current ring-hash | 9a3cfa2a
              previous ring-hash | 9a3cfa2a
---------------------------------+----------

 [State of Node(s)]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 9a3cfa2a       | 9a3cfa2a       | 2014-12-19 17:41:36 +0900
  S    | leofs15@192.168.100.15      | running      | 9a3cfa2a       | 9a3cfa2a       | 2014-12-19 17:41:36 +0900
  S    | leofs16@192.168.100.16      | running      | 9a3cfa2a       | 9a3cfa2a       | 2014-12-19 17:41:35 +0900
  S    | leofs17@192.168.100.17      | running      | 9a3cfa2a       | 9a3cfa2a       | 2014-12-19 17:41:36 +0900
  S    | leofs18@192.168.100.18      | running      | 9a3cfa2a       | 9a3cfa2a       | 2014-12-19 17:41:36 +0900
  G    | leofs13@192.168.100.13      | running      | 9a3cfa2a       | 9a3cfa2a       | 2014-12-19 17:41:40 +0900
-------+-----------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 60 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..  10240: 24%
        *  10240.. 102400: 30%
        * 102400.. 819200: 30%
        * 819200..1572864: 16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r8w2_60min.conf](20141219_174256/1m_r8w2_60min.conf)

### OPS and Latency:

![ops-latency](20141219_174256/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20141219_174255/sar_1_20141219_174255_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20141219_174255/sar_3_20141219_174255_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20141219_174255/sar_3_20141219_174255_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20141219_174255/sar_3_20141219_174255_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20141219_174255/sar_3_20141219_174255_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20141219_174255/sar_2_20141219_174255_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20141219_174255/sar_3_20141219_174255_dev8-16-t1.png)
![Storage-1](leofs14_20141219_174255/sar_3_20141219_174255_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20141219_174255/sar_3_20141219_174255_dev8-16-t1.png)
![Storage-2](leofs15_20141219_174255/sar_3_20141219_174255_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20141219_174255/sar_3_20141219_174255_dev8-16-t1.png)
![Storage-3](leofs16_20141219_174255/sar_3_20141219_174255_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20141219_174255/sar_3_20141219_174255_dev8-16-t1.png)
![Storage-4](leofs17_20141219_174255/sar_3_20141219_174255_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20141219_174255/sar_2_20141219_174255_dev8-16-t1.png)
![Storage-5](leofs18_20141219_174255/sar_2_20141219_174255_dev8-16-t2.png)


