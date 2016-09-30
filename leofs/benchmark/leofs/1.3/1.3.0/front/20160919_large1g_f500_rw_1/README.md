## Benchmark LeoFS v1.3.0

### Purpose
We check Read/Write Performance of Large File with LeoFS

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
                    Total replicas | 2
          number of successes of R | 1
          number of successes of W | 1
          number of successes of D | 1
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
                 current ring-hash | 59aa8ae7
                previous ring-hash | 59aa8ae7
-----------------------------------+----------

 [State of Node(s)]
-------+------------------------+--------------+----------------+----------------+----------------------------
 type  |          node          |    state     |  current ring  |   prev ring    |          updated at
-------+------------------------+--------------+----------------+----------------+----------------------------
  S    | S0@192.168.100.36      | running      | 59aa8ae7       | 59aa8ae7       | 2016-09-30 16:40:59 +0900
  S    | S1@192.168.100.37      | running      | 59aa8ae7       | 59aa8ae7       | 2016-09-30 16:40:59 +0900
  S    | S2@192.168.100.38      | running      | 59aa8ae7       | 59aa8ae7       | 2016-09-30 16:40:59 +0900
  S    | S3@192.168.100.39      | running      | 59aa8ae7       | 59aa8ae7       | 2016-09-30 16:40:59 +0900
  S    | S4@192.168.100.40      | running      | 59aa8ae7       | 59aa8ae7       | 2016-09-30 16:40:59 +0900
  G    | G0@192.168.100.35      | running      | 59aa8ae7       | 59aa8ae7       | 2016-09-30 16:41:01 +0900
  G    | G2@192.168.100.51      | running      | 59aa8ae7       | 59aa8ae7       | 2016-09-30 16:40:23 +0900
-------+------------------------+--------------+----------------+----------------+----------------------------

```

* Test Configuration:
    * Tool: s3cmd-1.6.1
    * Object Size: 1 GB
    * Number of Objects: 500
    * Number of Threads: 20
    * Multipart Upload Part Size: 5 MiB

* Test Procedures:
    * Loading (Batches of 20 instances)
        ```bash
        $ video1g_f500_load.sh
        ```
    * Reading (Batches of 20 instances)
        ```bash
        $ video1g_f500_read.sh
        ```

* LeoFS Configuration:
    * Manager_0: [leo_manager_0.conf](conf/G0/leo_manager.conf)
    * Gateway  : [leo_gateway.conf](conf/G0/leo_gateway.conf)
    * Storage  : [leo_storage.conf](conf/S0/leo_storage.conf)

### Monitoring Results:

* Loading
    ![monitoring-results](grafana_load.png)

* Reading
    ![monitoring-results](grafana_read.png)
