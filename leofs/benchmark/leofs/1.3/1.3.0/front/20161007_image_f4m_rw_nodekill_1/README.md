## Benchmark LeoFS v1.3.0

### Purpose
We check the impact on performance when a node is killed (failed)

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
                 current ring-hash | 4adb34e4
                previous ring-hash | 4adb34e4
-----------------------------------+----------

 [State of Node(s)]
-------+------------------------+--------------+----------------+----------------+----------------------------
 type  |          node          |    state     |  current ring  |   prev ring    |          updated at
-------+------------------------+--------------+----------------+----------------+----------------------------
  S    | S1@192.168.100.37      | stop         |                |                | 2016-10-07 10:38:06 +0900
  S    | S2@192.168.100.38      | stop         |                |                | 2016-10-07 10:43:18 +0900
  S    | S3@192.168.100.39      | running      | 4adb34e4       | 4adb34e4       | 2016-10-07 09:52:34 +0900
  S    | S4@192.168.100.40      | running      | 4adb34e4       | 4adb34e4       | 2016-10-07 09:52:34 +0900
  S    | S5@192.168.100.41      | running      | 4adb34e4       | 4adb34e4       | 2016-10-07 09:52:34 +0900
  G    | G0@192.168.100.35      | running      | 4adb34e4       | 4adb34e4       | 2016-10-07 09:52:37 +0900
-------+------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 30 minutes
    * # of concurrent processes: 64
    * # of keys: 4000000
    * Value size groups(byte):
        *    4096..   8192: 15%
        *    8192..  16384: 25%
        *   16384..  32768: 23%
        *   32768..  65536: 22%
        *   65536.. 131072: 15%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/basho_bench/blob/master/src/basho_bench_driver_leofs.erl)
    * Configuration file: 
        * [image_f4m_load.conf](load/image_f4m_load.conf)
        * [image_f4m_r100_300min.conf](read_kill/image_f4m_r100_300min.conf)

* LeoFS Configuration:
    * Manager_0: [leo_manager_0.conf](conf/G0/leo_manager.conf)
    * Gateway  : [leo_gateway.conf](conf/G0/leo_gateway.conf)
        * Disk Cache: 0
        * Mem Cache:  0
    * Storage  : [leo_storage.conf](conf/S0/leo_storage.conf)
        * Container Path: /ssd/avs

### Results:
* Loading (Kill node07 after 1 minute)
    ![ops-latency](load_kill/summary.png)
    ![monitoring-results](grafana_load_kill.png)

* Loading
    ![ops-latency](load/summary.png)
    ![monitoring-results](grafana_load.png)

* Reading (Kill node07 after 5 miuntes, node08 after 10 minutes)
    ![ops-latency](read_kill/summary.png)
    ![monitoring-results](grafana_read_kill.png)
