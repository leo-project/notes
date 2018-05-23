## Benchmark LeoFS v1.2.7 (Multi Data Center Replication Test)

### Purpose
We've checked Multi Data Center Replication of LeoFS v1.2.7.(feature/disable_connection_pool version)

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: 17.4
* LeoFS: v1.2.7
* LeoFS cluster settings:

```
 [System Confiuration]
-----------------------------------+----------
 Item                              | Value    
-----------------------------------+----------
 Basic/Consistency level
-----------------------------------+----------
                    system version | 1.2.7
                        cluster Id | leofs_1
                             DC Id | dc_1
                    Total replicas | 3
          number of successes of R | 1
          number of successes of W | 2
          number of successes of D | 2
 number of rack-awareness replicas | 0
                         ring size | 2^128
-----------------------------------+----------
 Multi DC replication settings
-----------------------------------+----------
        max number of joinable DCs | 2
           number of replicas a DC | 1
-----------------------------------+----------
 Manager RING hash
-----------------------------------+----------
                 current ring-hash | 2b468816
                previous ring-hash | 2b468816
-----------------------------------+----------

 [State of Node(s)]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 2b468816       | 2b468816       | 2015-04-02 14:01:32 +0900
  S    | leofs15@192.168.100.15      | running      | 2b468816       | 2b468816       | 2015-04-02 14:01:32 +0900
  S    | leofs16@192.168.100.16      | running      | 2b468816       | 2b468816       | 2015-04-02 14:01:32 +0900
  S    | leofs17@192.168.100.17      | running      | 2b468816       | 2b468816       | 2015-04-02 14:01:32 +0900
  S    | leofs18@192.168.100.18      | running      | 2b468816       | 2b468816       | 2015-04-02 14:01:32 +0900
  G    | leofs13@192.168.100.13      | running      | 2b468816       | 2b468816       | 2015-04-02 14:01:40 +0900
-------+-----------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 70 minutes
    * # of concurrent processes: 64
    * # of keys: 50000
    * Value size groups(byte):
        *   1024..  10240: 24%
        *  10241.. 102400: 30%
        * 102401.. 819200: 30%
        * 819201..1572864: 16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_load.conf](20150402_140904/1m_load.conf)

### OPS and Latency:

![ops-latency](20150402_140904/summary.png)

### Network Traffic
#### Chart of Every Nodes

* Gateway-1
![Gateway-1](leofs13_20150402_140849/sar_1_20150402_140849_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20150402_140849/sar_3_20150402_140849_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20150402_140849/sar_3_20150402_140849_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20150402_140849/sar_3_20150402_140849_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20150402_140849/sar_3_20150402_140849_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20150402_140849/sar_2_20150402_140849_p1p1-if1.png)


### Disk
#### Chart of Every Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20150402_140849/sar_3_20150402_140849_dev8-16-t1.png)
![Storage-1](leofs14_20150402_140849/sar_3_20150402_140849_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20150402_140849/sar_3_20150402_140849_dev8-16-t1.png)
![Storage-2](leofs15_20150402_140849/sar_3_20150402_140849_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20150402_140849/sar_3_20150402_140849_dev8-16-t1.png)
![Storage-3](leofs16_20150402_140849/sar_3_20150402_140849_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20150402_140849/sar_3_20150402_140849_dev8-16-t1.png)
![Storage-4](leofs17_20150402_140849/sar_3_20150402_140849_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20150402_140849/sar_2_20150402_140849_dev8-16-t1.png)
![Storage-5](leofs18_20150402_140849/sar_2_20150402_140849_dev8-16-t2.png)

### Slave Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: 17.4
* LeoFS: v1.2.7
* LeoFS cluster settings:

```
 [System Confiuration]
-----------------------------------+----------
 Item                              | Value    
-----------------------------------+----------
 Basic/Consistency level
-----------------------------------+----------
                    system version | 1.2.7
                        cluster Id | leofs_2
                             DC Id | dc_2
                    Total replicas | 3
          number of successes of R | 1
          number of successes of W | 2
          number of successes of D | 2
 number of rack-awareness replicas | 0
                         ring size | 2^128
-----------------------------------+----------
 Multi DC replication settings
-----------------------------------+----------
        max number of joinable DCs | 2
           number of replicas a DC | 1
-----------------------------------+----------
 Manager RING hash
-----------------------------------+----------
                 current ring-hash | 2f41986f
                previous ring-hash | 2f41986f
-----------------------------------+----------

 [State of Node(s)]
-------+--------------------------------+--------------+----------------+----------------+----------------------------
 type  |              node              |    state     |  current ring  |   prev ring    |          updated at         
-------+--------------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs1303@192.168.101.133      | running      | 2f41986f       | 2f41986f       | 2015-04-02 14:01:34 +0900
  S    | leofs1304@192.168.101.134      | running      | 2f41986f       | 2f41986f       | 2015-04-02 14:01:34 +0900
  S    | leofs1305@192.168.101.135      | running      | 2f41986f       | 2f41986f       | 2015-04-02 14:01:33 +0900
  S    | leofs1306@192.168.101.136      | running      | 2f41986f       | 2f41986f       | 2015-04-02 14:01:34 +0900
  S    | leofs1307@192.168.101.137      | running      | 2f41986f       | 2f41986f       | 2015-04-02 14:01:33 +0900
  G    | leofs1302@192.168.101.132      | running      | 2f41986f       | 2f41986f       | 2015-04-02 14:01:43 +0900
-------+--------------------------------+--------------+----------------+----------------+----------------------------

```

### Network Traffic
#### Chart of Every Nodes

* Gateway-1
![Gateway-1](leofs1302_20150402_140849/sar_1_20150402_140849_eth0-if1.png)

* Storage-1
![Storage-1](leofs1303_20150402_140849/sar_1_20150402_140849_eth0-if1.png)

* Storage-2
![Storage-2](leofs1304_20150402_140849/sar_1_20150402_140849_eth0-if1.png)

* Storage-3
![Storage-3](leofs1305_20150402_140849/sar_1_20150402_140849_eth0-if1.png)

* Storage-4
![Storage-4](leofs1306_20150402_140849/sar_1_20150402_140849_eth0-if1.png)

* Storage-5
![Storage-5](leofs1307_20150402_140849/sar_1_20150402_140849_eth0-if1.png)


### Disk
#### Chart of Every Nodes (Storage)

* Storage-1
![Storage-1](leofs1303_20150402_140849/sar_1_20150402_140849_dev8-0-t1.png)
![Storage-1](leofs1303_20150402_140849/sar_1_20150402_140849_dev8-0-t2.png)

* Storage-2
![Storage-2](leofs1304_20150402_140849/sar_1_20150402_140849_dev8-0-t1.png)
![Storage-2](leofs1304_20150402_140849/sar_1_20150402_140849_dev8-0-t2.png)

* Storage-3
![Storage-3](leofs1305_20150402_140849/sar_1_20150402_140849_dev8-0-t1.png)
![Storage-3](leofs1305_20150402_140849/sar_1_20150402_140849_dev8-0-t2.png)

* Storage-4
![Storage-4](leofs1306_20150402_140849/sar_1_20150402_140849_dev8-0-t1.png)
![Storage-4](leofs1306_20150402_140849/sar_1_20150402_140849_dev8-0-t2.png)

* Storage-5
![Storage-5](leofs1307_20150402_140849/sar_1_20150402_140849_dev8-0-t1.png)
![Storage-5](leofs1307_20150402_140849/sar_1_20150402_140849_dev8-0-t2.png)

