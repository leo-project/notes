## MDC Benchmark LeoFS v1.0.2

### Master Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.0.2
* Size of stacked objects (bytes): 2097152
* LeoFS cluster settings:

```
[System config]
                System version : 1.0.2
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : 94878493
                Prev ring hash : 94878493
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 94878493       | 94878493       | 2014-07-22 13:47:56 +0900
  S    | leofs15@192.168.100.15      | running      | 94878493       | 94878493       | 2014-07-22 13:47:57 +0900
  S    | leofs16@192.168.100.16      | running      | 94878493       | 94878493       | 2014-07-22 13:47:57 +0900
  S    | leofs17@192.168.100.17      | running      | 94878493       | 94878493       | 2014-07-22 13:47:57 +0900
  S    | leofs18@192.168.100.18      | running      | 94878493       | 94878493       | 2014-07-22 13:47:57 +0900
  G    | leofs13@192.168.100.13      | running      | 94878493       | 94878493       | 2014-07-22 13:48:03 +0900

```

* basho-bench Configuration:
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        * 16384:100%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [16k_load.conf](20140722_134811/16k_load.conf)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20140722_134810/sar_1_20140722_134810_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20140722_134810/sar_3_20140722_134810_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20140722_134810/sar_3_20140722_134810_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20140722_134810/sar_3_20140722_134810_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20140722_134810/sar_3_20140722_134810_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20140722_134810/sar_2_20140722_134810_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20140722_134810/sar_3_20140722_134810_dev8-16-t1.png)
![Storage-1](leofs14_20140722_134810/sar_3_20140722_134810_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20140722_134810/sar_3_20140722_134810_dev8-16-t1.png)
![Storage-2](leofs15_20140722_134810/sar_3_20140722_134810_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20140722_134810/sar_3_20140722_134810_dev8-16-t1.png)
![Storage-3](leofs16_20140722_134810/sar_3_20140722_134810_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20140722_134810/sar_3_20140722_134810_dev8-16-t1.png)
![Storage-4](leofs17_20140722_134810/sar_3_20140722_134810_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20140722_134810/sar_2_20140722_134810_dev8-16-t1.png)
![Storage-5](leofs18_20140722_134810/sar_2_20140722_134810_dev8-16-t2.png)


### Slave Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.0.2
* Size of stacked objects (bytes): 2097152
* LeoFS cluster settings:

```
[System config]
                System version : 1.0.2
                    Cluster Id : leofs_2
                         DC Id : dc_2
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : 3f893fa1
                Prev ring hash : 3f893fa1
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+--------------------------------+--------------+----------------+----------------+----------------------------
 type  |              node              |    state     |  current ring  |   prev ring    |          updated at         
-------+--------------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs1303@192.168.101.133      | running      | 3f893fa1       | 3f893fa1       | 2014-07-22 13:47:58 +0900
  S    | leofs1304@192.168.101.134      | running      | 3f893fa1       | 3f893fa1       | 2014-07-22 13:47:58 +0900
  S    | leofs1305@192.168.101.135      | running      | 3f893fa1       | 3f893fa1       | 2014-07-22 13:47:58 +0900
  S    | leofs1306@192.168.101.136      | running      | 3f893fa1       | 3f893fa1       | 2014-07-22 13:47:58 +0900
  S    | leofs1307@192.168.101.137      | running      | 3f893fa1       | 3f893fa1       | 2014-07-22 13:47:58 +0900
  G    | leofs1302@192.168.101.132      | running      | 3f893fa1       | 3f893fa1       | 2014-07-22 13:48:06 +0900

```

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs1302_20140722_134810/sar_1_20140722_134810_eth0-if1.png)

* Storage-1
![Storage-1](leofs1303_20140722_134810/sar_1_20140722_134810_eth0-if1.png)

* Storage-2
![Storage-2](leofs1304_20140722_134810/sar_1_20140722_134810_eth0-if1.png)

* Storage-3
![Storage-3](leofs1305_20140722_134810/sar_1_20140722_134810_eth0-if1.png)

* Storage-4
![Storage-4](leofs1306_20140722_134810/sar_1_20140722_134810_eth0-if1.png)

* Storage-5
![Storage-5](leofs1307_20140722_134810/sar_1_20140722_134810_eth0-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs1303_20140722_134810/sar_1_20140722_134810_dev8-0-t1.png)
![Storage-1](leofs1303_20140722_134810/sar_1_20140722_134810_dev8-0-t2.png)

* Storage-2
![Storage-2](leofs1304_20140722_134810/sar_1_20140722_134810_dev8-0-t1.png)
![Storage-2](leofs1304_20140722_134810/sar_1_20140722_134810_dev8-0-t2.png)

* Storage-3
![Storage-3](leofs1305_20140722_134810/sar_1_20140722_134810_dev8-0-t1.png)
![Storage-3](leofs1305_20140722_134810/sar_1_20140722_134810_dev8-0-t2.png)

* Storage-4
![Storage-4](leofs1306_20140722_134810/sar_1_20140722_134810_dev8-0-t1.png)
![Storage-4](leofs1306_20140722_134810/sar_1_20140722_134810_dev8-0-t2.png)

* Storage-5
![Storage-5](leofs1307_20140722_134810/sar_1_20140722_134810_dev8-0-t1.png)
![Storage-5](leofs1307_20140722_134810/sar_1_20140722_134810_dev8-0-t2.png)


#### Summary

* Elapsed Time : 2689 seconds
* Throughput: 600 KBytes (File Total: 1652988890 Bytes)
