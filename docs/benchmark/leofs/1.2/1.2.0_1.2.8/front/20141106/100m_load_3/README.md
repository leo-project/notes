## Benchmark LeoFS v1.2.0 with watchdog

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.2.0
* LeoFS cluster settings:

```
[System config]
                System version : 1.2.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : c34f307d
                Prev ring hash : c34f307d
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | c34f307d       | c34f307d       | 2014-11-06 17:15:48 +0900
  S    | leofs15@192.168.100.15      | running      | c34f307d       | c34f307d       | 2014-11-06 17:15:48 +0900
  S    | leofs16@192.168.100.16      | running      | c34f307d       | c34f307d       | 2014-11-06 17:15:48 +0900
  S    | leofs17@192.168.100.17      | running      | c34f307d       | c34f307d       | 2014-11-06 17:15:48 +0900
  S    | leofs18@192.168.100.18      | running      | c34f307d       | c34f307d       | 2014-11-06 17:15:48 +0900
  G    | leofs13@192.168.100.13      | running      | c34f307d       | c34f307d       | 2014-11-06 17:15:55 +0900

```

* basho-bench Configuration:
    * # of concurrent processes: 64
    * # of keys: 5000
    * Value size groups(byte):
        * 52428800..104857600: 100%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [100m_load.conf](20141106_171557/100m_load.conf)

### OPS and Latency:

![ops-latency](20141106_171557/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20141106_171556/sar_1_20141106_171556_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20141106_171556/sar_3_20141106_171556_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20141106_171556/sar_3_20141106_171556_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20141106_171556/sar_3_20141106_171556_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20141106_171556/sar_3_20141106_171556_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20141106_171556/sar_2_20141106_171556_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20141106_171556/sar_3_20141106_171556_dev8-16-t1.png)
![Storage-1](leofs14_20141106_171556/sar_3_20141106_171556_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20141106_171556/sar_3_20141106_171556_dev8-16-t1.png)
![Storage-2](leofs15_20141106_171556/sar_3_20141106_171556_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20141106_171556/sar_3_20141106_171556_dev8-16-t1.png)
![Storage-3](leofs16_20141106_171556/sar_3_20141106_171556_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20141106_171556/sar_3_20141106_171556_dev8-16-t1.png)
![Storage-4](leofs17_20141106_171556/sar_3_20141106_171556_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20141106_171556/sar_2_20141106_171556_dev8-16-t1.png)
![Storage-5](leofs18_20141106_171556/sar_2_20141106_171556_dev8-16-t2.png)
