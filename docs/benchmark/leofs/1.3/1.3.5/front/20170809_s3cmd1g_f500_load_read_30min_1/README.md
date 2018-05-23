## Benchmark LeoFS v1.3.5

### Purpose
We check the performance of LeoFS with large objects

### Environment

* OS: Ubuntu Server 14.04.3
* Erlang/OTP: 17.5
* LeoFS: 1.3.5-dev
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
                    system version | 1.3.5
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
  S    | S1@192.168.100.37      | running      | 4adb34e4       | 4adb34e4       | 2017-08-09 15:50:09 +0900
  S    | S2@192.168.100.38      | running      | 4adb34e4       | 4adb34e4       | 2017-08-09 15:50:26 +0900
  S    | S3@192.168.100.39      | running      | 4adb34e4       | 4adb34e4       | 2017-08-09 15:50:26 +0900
  S    | S4@192.168.100.40      | running      | 4adb34e4       | 4adb34e4       | 2017-08-09 15:50:26 +0900
  S    | S5@192.168.100.41      | running      | 4adb34e4       | 4adb34e4       | 2017-08-09 15:50:26 +0900
  G    | G0@192.168.100.35      | running      | 4adb34e4       | 4adb34e4       | 2017-08-09 15:50:28 +0900
-------+------------------------+--------------+----------------+----------------+----------------------------

```

* Test Configuration:
    * Tool: s3cmd-1.6.1
    * Object Size: 1 GB
    * Number of Objects: 500
    * Number of Threads: 20
    * Multipart Upload Part Size: 5 MiB

* basho-bench Configuration:
    * Duration: 30 minutes
    * no. of concurrent processes: 16
    * no. of keys: 500
    * basho_bench driver: [basho_bench_driver_s3cmd.erl](https://github.com/leo-project/basho_bench/blob/s3cmd/src/basho_bench_driver_s3cmd.erl)
    * Configuration file: 
        * [s3cmd_1g_500_load.conf](load/s3cmd_1g_500_load.conf)
        * [s3cmd_1g_500_read.conf](read/s3cmd_1g_500_read.conf)

* LeoFS Configuration:
    * Manager_0: [leo_manager_0.conf](conf/G0/leo_manager.conf)
    * Gateway  : [leo_gateway.conf](conf/G0/leo_gateway.conf)
        * Disk Cache: 0
        * Mem Cache:  0
    * Storage  : [leo_storage.conf](conf/S0/leo_storage.conf)
        * Container Path: /ssd/avs

### Results:
* Load
    ![ops-latency](load/summary.png)
    ![monitoring-results](load/grafana.png)

* Read
    ![ops-latency](read/summary.png)
    ![monitoring-results](read/grafana.png)
