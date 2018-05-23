## Benchmark LeoFS v1.2.20-dev

### Purpose
We check the performance of LeoFS 1.2.20-dev (With Multiple Read Threads, No GW Cache) 

### Environment

* OS: Ubuntu Server 14.04.3
* Erlang/OTP: 17.5
* LeoFS: 1.2.20-dev
* CPU: Intel Xeon E5-2630 v3 @ 2.40GHz
* RAM: DDR4-1866MHz 8GB * 4
* HDD (node[36~40]) : 6x 15k rpm HDD RAID-0 are mounted at `/data/`, Ext4

```
 [System Confiuration]
-----------------------------------+----------
 Item                              | Value
-----------------------------------+----------
 Basic/Consistency level
-----------------------------------+----------
                    system version | 1.2.20
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
  S    | S0@192.168.100.36      | running      | 2c7f39ec       | 2c7f39ec       | 2016-03-22 14:27:44 +0900
  S    | S1@192.168.100.37      | running      | 2c7f39ec       | 2c7f39ec       | 2016-03-22 14:27:44 +0900
  S    | S2@192.168.100.38      | running      | 2c7f39ec       | 2c7f39ec       | 2016-03-22 14:27:44 +0900
  S    | S3@192.168.100.39      | running      | 2c7f39ec       | 2c7f39ec       | 2016-03-22 14:27:44 +0900
  S    | S4@192.168.100.40      | running      | 2c7f39ec       | 2c7f39ec       | 2016-03-22 14:27:44 +0900
  G    | G0@192.168.100.35      | running      | 2c7f39ec       | 2c7f39ec       | 2016-03-22 14:27:56 +0900
-------+------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 30 minutes
    * # of concurrent processes: 64
    * # of keys: 4000000
    * R/W: 95/5
    * Value size groups(byte):
        *    4096..   8192: 15%
        *    8192..  16384: 25%
        *   16384..  32768: 23%
        *   32768..  65536: 22%
        *   65536.. 131072: 15%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/basho_bench/blob/1.4/src/basho_bench_driver_leofs.erl)
    * Configuration file: [image_f4m_r95w5_30min.conf](image_f4m_r95w5_30min.conf)

* LeoFS Configuration:
    * Manager_0: [leo_manager_0.conf](conf/leo_manager_0.conf)
    * Manager_1: [leo_manager_1.conf](conf/leo_manager_1.conf)
    * Gateway  : [leo_gateway.conf](conf/leo_gateway_0.conf)
      * No Cache
    * Storage  : [leo_storage.conf](conf/leo_storage_0.conf)
      * AVS 64

### OPS and Latency:
**4 Storage Nodes**
![ops-latency-4node](4nodes/summary.png)

**5 Storage Nodes**
![ops-latency-5node](5nodes/summary.png)

### Monitoring Results:
**4 Storage Nodes**
![monitoring-results-4node](4nodes/grafana.png)

**5 Storage Nodes**
![monitoring-results-5node](5nodes/grafana.png)
