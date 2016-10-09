## Benchmark LeoFS v1.3.0

### Purpose
We check Performance with LeoFS

### Issues
* https://github.com/leo-project/notes/issues/18

### Environment

* OS: Ubuntu Server 14.04.3
* Erlang/OTP: 17.5
* LeoFS: 1.3.0
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
                 current ring-hash | 2c7f39ec
                previous ring-hash | 2c7f39ec
-----------------------------------+----------

 [State of Node(s)]
-------+------------------------+--------------+----------------+----------------+----------------------------
 type  |          node          |    state     |  current ring  |   prev ring    |          updated at
-------+------------------------+--------------+----------------+----------------+----------------------------
  S    | S0@192.168.100.36      | running      | 2c7f39ec       | 2c7f39ec       | 2016-10-06 10:02:52 +0900
  S    | S1@192.168.100.37      | running      | 2c7f39ec       | 2c7f39ec       | 2016-10-06 10:02:52 +0900
  S    | S2@192.168.100.38      | running      | 2c7f39ec       | 2c7f39ec       | 2016-10-06 10:02:52 +0900
  S    | S3@192.168.100.39      | running      | 2c7f39ec       | 2c7f39ec       | 2016-10-06 10:02:52 +0900
  S    | S4@192.168.100.40      | running      | 2c7f39ec       | 2c7f39ec       | 2016-10-06 10:02:52 +0900
  G    | G0@192.168.100.35      | running      | 2c7f39ec       | 2c7f39ec       | 2016-10-06 10:02:52 +0900
  G    | G2@192.168.100.51      | running      | 2c7f39ec       | 2c7f39ec       | 2016-10-06 10:02:19 +0900
-------+------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 30 minutes
    * # of concurrent processes: 64
    * # of keys: 20000000
    * Value size groups(byte):
        *    4096..   8192: 15%
        *    8192..  16384: 25%
        *   16384..  32768: 23%
        *   32768..  65536: 22%
        *   65536.. 131072: 15%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/basho_bench/blob/master/src/basho_bench_driver_leofs.erl)
    * Configuration file: 
        * [image_f20m_load.conf](load/image_f20m_load.conf)
        * [image_f20m_r100_300min.conf](read/image_f20m_r100_300min.conf)

* LeoFS Configuration:
    * Manager_0: [leo_manager_0.conf](conf/G0/leo_manager.conf)
    * Gateway  : [leo_gateway.conf](conf/G0/leo_gateway.conf)
        * Disk Cache: 0
        * Mem Cache: 256 MB
    * Storage  : [leo_storage.conf](conf/S0/leo_storage.conf)
        * Container Path: /ssd/avs

### Results:
* Loading
    ![ops-latency](load/summary.png)
    ![monitoring-results](grafana_load.png)

* Reading
    ![ops-latency](read/summary.png)
    ![monitoring-results](grafana_read.png)
