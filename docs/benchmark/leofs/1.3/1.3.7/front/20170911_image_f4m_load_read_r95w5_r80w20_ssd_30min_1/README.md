## Benchmark LeoFS v1.3.7

### Purpose
We check the performance of LeoFS 1.3.7

### Issue
* https://github.com/leo-project/notes/issues/18

### Environment

* OS: Ubuntu Server 14.04.3
* Erlang/OTP: 17.5
* LeoFS: 1.3.7-dev
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
                    system version | 1.3.7
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
 [mdcr] max number of joinable DCs | 2
 [mdcr] total replicas per a DC    | 1
 [mdcr] number of successes of R   | 1
 [mdcr] number of successes of W   | 1
 [mdcr] number of successes of D   | 1
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
  S    | S1@192.168.100.37      | running      | 4adb34e4       | 4adb34e4       | 2017-09-11 09:41:45 +0900
  S    | S2@192.168.100.38      | running      | 4adb34e4       | 4adb34e4       | 2017-09-11 09:41:45 +0900
  S    | S3@192.168.100.39      | running      | 4adb34e4       | 4adb34e4       | 2017-09-11 09:41:45 +0900
  S    | S4@192.168.100.40      | running      | 4adb34e4       | 4adb34e4       | 2017-09-11 09:41:45 +0900
  S    | S5@192.168.100.41      | running      | 4adb34e4       | 4adb34e4       | 2017-09-11 09:41:45 +0900
  G    | G0@192.168.100.35      | running      | 4adb34e4       | 4adb34e4       | 2017-09-11 09:41:46 +0900
-------+------------------------+--------------+----------------+----------------+----------------------------


```

* basho-bench Configuration:
    * Duration: 30 minutes
    * no. of concurrent processes: 64
    * no. of keys: 4000000
    * R/W: 95/5
    * Value size groups(byte):
        *    4096..   8192: 15%
        *    8192..  16384: 25%
        *   16384..  32768: 23%
        *   32768..  65536: 22%
        *   65536.. 131072: 15%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/basho_bench/blob/1.4/src/basho_bench_driver_leofs.erl)
    * Configuration file: 
        * [load/image_f4m_load.conf](load/image_f4m_load.conf)
        * [read/image_f4m_r100_30min.conf](read/image_f4m_r100_30min.conf)
        * [r95w5/image_f4m_r95w5_30min.conf](r95w5/image_f4m_r95w5_30min.conf)
        * [r80w20/image_f4m_r80w20_30min.conf](r80w20/image_f4m_r80w20_30min.conf)

* LeoFS Configuration:
    * Manager_0: [leo_manager_0.conf](conf/G0/leo_manager.conf)
    * Gateway  : [leo_gateway.conf](conf/G0/leo_gateway.conf)
        * Disk Cache: 0
        * Mem Cache:  0
    * Storage  : [leo_storage.conf](conf/S0/leo_storage.conf)
        * Container Path: /ssd/avs

### Loading
**OPS and Latency:**
![ops-latency](load/summary.png)
**Monitoring Results:**
![monitoring-results](load/grafana.png)

### Read
**OPS and Latency:**
![ops-latency](read/summary.png)
**Monitoring Results:**
![monitoring-results](read/grafana.png)

### Read 95%, Write 5%
**OPS and Latency:**
![ops-latency](r95w5/summary.png)
**Monitoring Results:**
![monitoring-results](r95w5/grafana.png)

### Read 80%, Write 20%
**OPS and Latency:**
![ops-latency](r80w20/summary.png)
**Monitoring Results:**
![monitoring-results](r80w20/grafana.png)
