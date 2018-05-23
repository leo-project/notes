## Benchmark LeoFS v1.3.1-dev

### Purpose
We check the R/W performance of NFS with LeoFS

### Summary
Write to NFS Mount on Ubuntu are done with 256KB, in LeoFS it would perform
read-modify-write in 1MB Units, causing many traffic in between
Data set is small enough to reside in page cache on `leo_storage` and on client,
data is loaded from LeoFS at the beginning only


### Environment

* OS: Ubuntu Server 14.04.3
* Erlang/OTP: 17.5
* LeoFS: 1.3.1-dev
* CPU: Intel Xeon E5-2630 v3 @ 2.40GHz
* HDD (node[36~50]) : 4x ST2000LM003 (2TB 5400rpm 32MB) RAID-0 are mounted at `/data/`, Ext4
* SSD (node[36~50]) : 1x Crucial CT500BX100SSD1 mounted at `/ssd/`, Ext4

```
 [System Confiuration]
-----------------------------------+----------
 Item                              | Value
-----------------------------------+----------
 Basic/Consistency level
-----------------------------------+----------
                    system version | 1.3.0
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
                 current ring-hash | 4adb34e4
                previous ring-hash | 4adb34e4
-----------------------------------+----------

 [State of Node(s)]
-------+------------------------+--------------+----------------+----------------+----------------------------
 type  |          node          |    state     |  current ring  |   prev ring    |          updated at
-------+------------------------+--------------+----------------+----------------+----------------------------
  S    | S1@192.168.100.37      | running      | 4adb34e4       | 4adb34e4       | 2016-11-21 14:56:29 +0900
  S    | S2@192.168.100.38      | running      | 4adb34e4       | 4adb34e4       | 2016-11-21 14:56:29 +0900
  S    | S3@192.168.100.39      | running      | 4adb34e4       | 4adb34e4       | 2016-11-21 14:56:29 +0900
  S    | S4@192.168.100.40      | running      | 4adb34e4       | 4adb34e4       | 2016-11-21 14:56:29 +0900
  S    | S5@192.168.100.41      | running      | 4adb34e4       | 4adb34e4       | 2016-11-21 14:56:28 +0900
  G    | G0@192.168.100.35      | running      | 4adb34e4       | 4adb34e4       | 2016-11-21 14:56:30 +0900
-------+------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 30 minutes
    * Total number of concurrent processes: 64
    * Total number of keys: 10000
    * Value size groups (bytes):
        * 1048576..1048576:100%
    * basho_bench driver: [basho_bench_driver_file.erl](https://github.com/leo-project/basho_bench/blob/master/src/basho_bench_driver_file.erl)
    * Configuration file: 
        * [fix1m_f10k_load.conf](load/fix1m_f10k_load.conf)
        * [fix1m_f10k_read.conf](read/fix1m_f10k_read.conf)

* LeoFS Configuration:
    * Manager_0: [leo_manager_0.conf](conf/G0/leo_manager.conf)
    * Gateway  : [leo_gateway.conf](conf/G0/leo_gateway.conf)
        * Disk Cache: 0
        * Mem Cache:  0
        * Chunked Object Lenfth: 1048576
    * Storage  : [leo_storage.conf](conf/S0/leo_storage.conf)
        * Container Path: /ssd/avs

### Results:
#### Load
![ops-latency](load/summary.png)
![monitoring-results](grafana_load.png)

#### Read
![ops-latency](read/summary.png)
![monitoring-results](grafana_read.png)
