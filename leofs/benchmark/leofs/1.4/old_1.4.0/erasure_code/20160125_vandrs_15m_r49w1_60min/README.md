## Benchmark LeoFS v1.4.0-pre.3

### Purpose
We'va checked LeoFS 1.4.0-pre3 with erasure coding (JErasure, Vand-RS {K=10, M=4}).

### Environment

* OS: Ubuntu Server 14.04.3
* Erlang/OTP: 17.5
* LeoFS: v1.4.0-pre.3
* LeoFS cluster settings:
* CPU: Intel Xeon E5-2630 v3 @ 2.40GHz

```
 [System Confiuration]
-----------------------------------+----------
 Item                              | Value    
-----------------------------------+----------
 Basic/Consistency level
-----------------------------------+----------
                    system version | 1.4.0-pre.3
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
                 current ring-hash | 2c7f39ec
                previous ring-hash | 2c7f39ec
-----------------------------------+----------

 [State of Node(s)]
-------+------------------------+--------------+----------------+----------------+----------------------------
 type  |          node          |    state     |  current ring  |   prev ring    |          updated at         
-------+------------------------+--------------+----------------+----------------+----------------------------
  S    | S0@leofs-ubuntu1404-node06      | running      | 2c7f39ec       | 2c7f39ec       | 2016-01-25 17:47:20 +0900
  S    | S1@leofs-ubuntu1404-node07      | running      | 2c7f39ec       | 2c7f39ec       | 2016-01-25 17:47:20 +0900
  S    | S2@leofs-ubuntu1404-node08      | running      | 2c7f39ec       | 2c7f39ec       | 2016-01-25 17:47:20 +0900
  S    | S3@leofs-ubuntu1404-node09      | running      | 2c7f39ec       | 2c7f39ec       | 2016-01-25 17:47:20 +0900
  S    | S4@leofs-ubuntu1404-node10      | running      | 2c7f39ec       | 2c7f39ec       | 2016-01-25 17:47:20 +0900
  G    | G0@leofs-ubuntu1404-node05      | running      | 2c7f39ec       | 2c7f39ec       | 2016-01-25 17:47:31 +0900
-------+------------------------+--------------+----------------+----------------+----------------------------


```

* basho-bench Configuration:
    * Duration: 60 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *    16384..   65536: 50%
        * 10485760..15728640: 50%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/basho_bench/blob/master/src/basho_bench_driver_leofs.erl)
    * Configuration file: [15m_r49w1_60min.conf](20160125_181501/15m_r49w1_60min.conf)

* LeoFS Configuration:
    * Manager_0: [leo_manager_0.conf](conf/leo_manager_0.conf)
    * Manager_1: [leo_manager_1.conf](conf/leo_manager_1.conf)
    * Gateway  : [leo_gateway.conf](conf/leo_gateway.conf)
    * Storage  : [leo_storage.conf](conf/leo_storage.conf)

### OPS and Latency:

![ops-latency](20160125_181501/summary.png)

### Network Traffic
#### Chart of Every Nodes

* Gateway-1
![Gateway-1](leofs-ubuntu1404-node05_20160125_181502/sar_3_20160125_181502_p1p1-if1.png)

* Storage-1
![Storage-1](leofs-ubuntu1404-node06_20160125_181455/sar_3_20160125_181455_p1p1-if1.png)

* Storage-2
![Storage-2](leofs-ubuntu1404-node07_20160125_181455/sar_3_20160125_181455_p1p1-if1.png)

* Storage-3
![Storage-3](leofs-ubuntu1404-node08_20160125_181457/sar_3_20160125_181457_p1p1-if1.png)

* Storage-4
![Storage-4](leofs-ubuntu1404-node09_20160125_181458/sar_3_20160125_181458_p1p1-if1.png)

* Storage-5
![Storage-5](leofs-ubuntu1404-node10_20160125_181459/sar_3_20160125_181459_p1p1-if1.png)



### Disk
#### Chart of Every Nodes (Storage)

* Storage-1
![Storage-1](leofs-ubuntu1404-node06_20160125_181455/sar_3_20160125_181455_dev8-16-t1.png)
![Storage-1](leofs-ubuntu1404-node06_20160125_181455/sar_3_20160125_181455_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs-ubuntu1404-node07_20160125_181455/sar_3_20160125_181455_dev8-16-t1.png)
![Storage-2](leofs-ubuntu1404-node07_20160125_181455/sar_3_20160125_181455_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs-ubuntu1404-node08_20160125_181457/sar_3_20160125_181457_dev8-16-t1.png)
![Storage-3](leofs-ubuntu1404-node08_20160125_181457/sar_3_20160125_181457_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs-ubuntu1404-node09_20160125_181458/sar_3_20160125_181458_dev8-16-t1.png)
![Storage-4](leofs-ubuntu1404-node09_20160125_181458/sar_3_20160125_181458_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs-ubuntu1404-node10_20160125_181459/sar_3_20160125_181459_dev8-16-t1.png)
![Storage-5](leofs-ubuntu1404-node10_20160125_181459/sar_3_20160125_181459_dev8-16-t2.png)



### CPU
#### Chart of Every Nodes

* Storage-1
![Storage-1](leofs-ubuntu1404-node06_20160125_181455/sar_3_20160125_181455_all-cpu.png)

* Storage-2
![Storage-2](leofs-ubuntu1404-node07_20160125_181455/sar_3_20160125_181455_all-cpu.png)

* Storage-3
![Storage-3](leofs-ubuntu1404-node08_20160125_181457/sar_3_20160125_181457_all-cpu.png)

* Storage-4
![Storage-4](leofs-ubuntu1404-node09_20160125_181458/sar_3_20160125_181458_all-cpu.png)

* Storage-5
![Storage-5](leofs-ubuntu1404-node10_20160125_181459/sar_3_20160125_181459_all-cpu.png)

* Gateway-1
![Gateway-1](leofs-ubuntu1404-node05_20160125_181502/sar_3_20160125_181502_all-cpu.png)



### Load
#### Chart of Every Nodes

* Storage-1
![Storage-1](leofs-ubuntu1404-node06_20160125_181455/sar_3_20160125_181455_LinuxloadSar.png)

* Storage-2
![Storage-2](leofs-ubuntu1404-node07_20160125_181455/sar_3_20160125_181455_LinuxloadSar.png)

* Storage-3
![Storage-3](leofs-ubuntu1404-node08_20160125_181457/sar_3_20160125_181457_LinuxloadSar.png)

* Storage-4
![Storage-4](leofs-ubuntu1404-node09_20160125_181458/sar_3_20160125_181458_LinuxloadSar.png)

* Storage-5
![Storage-5](leofs-ubuntu1404-node10_20160125_181459/sar_3_20160125_181459_LinuxloadSar.png)

* Gateway-1
![Gateway-1](leofs-ubuntu1404-node05_20160125_181502/sar_3_20160125_181502_LinuxloadSar.png)


