## MDC Benchmark LeoFS v1.0.2

### Master Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.0.2
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
             Current ring hash : f753d77e
                Prev ring hash : f753d77e
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | f753d77e       | f753d77e       | 2014-07-16 12:56:28 +0900
  S    | leofs15@192.168.100.15      | running      | f753d77e       | f753d77e       | 2014-07-16 12:56:28 +0900
  S    | leofs16@192.168.100.16      | running      | f753d77e       | f753d77e       | 2014-07-16 12:56:28 +0900
  S    | leofs17@192.168.100.17      | running      | f753d77e       | f753d77e       | 2014-07-16 12:56:28 +0900
  S    | leofs18@192.168.100.18      | running      | f753d77e       | f753d77e       | 2014-07-16 12:56:28 +0900
  G    | leofs13@192.168.100.13      | running      | f753d77e       | f753d77e       | 2014-07-16 12:56:35 +0900

```

* basho-bench Configuration:
    * Elapsed Time : 2027 seconds
    * # of concurrent processes: 64
    * # of keys
    * Value size groups(byte):
        * 16384:100%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [16k_load.conf](tests/16k_load/20140716_125642/16k_load.conf)

### OPS and Latency:

![ops-latency](tests/16k_load/20140716_125642/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](tests/16k_load/leofs13_20140716_125641/sar_1_20140716_125641_p1p1-if1.png)

* Storage-1
![Storage-1](tests/16k_load/leofs14_20140716_125641/sar_3_20140716_125641_p1p1-if1.png)

* Storage-2
![Storage-2](tests/16k_load/leofs15_20140716_125641/sar_3_20140716_125641_p1p1-if1.png)

* Storage-3
![Storage-3](tests/16k_load/leofs16_20140716_125641/sar_3_20140716_125641_p1p1-if1.png)

* Storage-4
![Storage-4](tests/16k_load/leofs17_20140716_125641/sar_3_20140716_125641_p1p1-if1.png)

* Storage-5
![Storage-5](tests/16k_load/leofs18_20140716_125641/sar_2_20140716_125641_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](tests/16k_load/leofs14_20140716_125641/sar_3_20140716_125641_dev8-16-t1.png)
![Storage-1](tests/16k_load/leofs14_20140716_125641/sar_3_20140716_125641_dev8-16-t2.png)

* Storage-2
![Storage-2](tests/16k_load/leofs15_20140716_125641/sar_3_20140716_125641_dev8-16-t1.png)
![Storage-2](tests/16k_load/leofs15_20140716_125641/sar_3_20140716_125641_dev8-16-t2.png)

* Storage-3
![Storage-3](tests/16k_load/leofs16_20140716_125641/sar_3_20140716_125641_dev8-16-t1.png)
![Storage-3](tests/16k_load/leofs16_20140716_125641/sar_3_20140716_125641_dev8-16-t2.png)

* Storage-4
![Storage-4](tests/16k_load/leofs17_20140716_125641/sar_3_20140716_125641_dev8-16-t1.png)
![Storage-4](tests/16k_load/leofs17_20140716_125641/sar_3_20140716_125641_dev8-16-t2.png)

* Storage-5
![Storage-5](tests/16k_load/leofs18_20140716_125641/sar_2_20140716_125641_dev8-16-t1.png)
![Storage-5](tests/16k_load/leofs18_20140716_125641/sar_2_20140716_125641_dev8-16-t2.png)


#### Summary

* Total of network traffic:  .  Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
          |          |           |
total     |          |           |

## Benchmark LeoFS v1.0.2

### Slave Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.0.2
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
             Current ring hash : b60f59da
                Prev ring hash : b60f59da
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+--------------------------------+--------------+----------------+----------------+----------------------------
 type  |              node              |    state     |  current ring  |   prev ring    |          updated at         
-------+--------------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs1303@192.168.101.133      | running      | b60f59da       | b60f59da       | 2014-07-16 12:56:30 +0900
  S    | leofs1304@192.168.101.134      | running      | b60f59da       | b60f59da       | 2014-07-16 12:56:30 +0900
  S    | leofs1305@192.168.101.135      | running      | b60f59da       | b60f59da       | 2014-07-16 12:56:30 +0900
  S    | leofs1306@192.168.101.136      | running      | b60f59da       | b60f59da       | 2014-07-16 12:56:30 +0900
  S    | leofs1307@192.168.101.137      | running      | b60f59da       | b60f59da       | 2014-07-16 12:56:30 +0900
  G    | leofs1302@192.168.101.132      | running      | b60f59da       | b60f59da       | 2014-07-16 12:56:37 +0900

```

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](tests/16k_load/leofs1302_20140716_125641/sar_1_20140716_125641_eth0-if1.png)

* Storage-1
![Storage-1](tests/16k_load/leofs1303_20140716_125641/sar_1_20140716_125641_eth0-if1.png)

* Storage-2
![Storage-2](tests/16k_load/leofs1304_20140716_125641/sar_1_20140716_125641_eth0-if1.png)

* Storage-3
![Storage-3](tests/16k_load/leofs1305_20140716_125641/sar_1_20140716_125641_eth0-if1.png)

* Storage-4
![Storage-4](tests/16k_load/leofs1306_20140716_125641/sar_1_20140716_125641_eth0-if1.png)

* Storage-5
![Storage-5](tests/16k_load/leofs1307_20140716_125641/sar_1_20140716_125641_eth0-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](tests/16k_load/leofs1303_20140716_125641/sar_1_20140716_125641_dev8-0-t1.png)
![Storage-1](tests/16k_load/leofs1303_20140716_125641/sar_1_20140716_125641_dev8-0-t2.png)

* Storage-2
![Storage-2](tests/16k_load/leofs1304_20140716_125641/sar_1_20140716_125641_dev8-0-t1.png)
![Storage-2](tests/16k_load/leofs1304_20140716_125641/sar_1_20140716_125641_dev8-0-t2.png)

* Storage-3
![Storage-3](tests/16k_load/leofs1305_20140716_125641/sar_1_20140716_125641_dev8-0-t1.png)
![Storage-3](tests/16k_load/leofs1305_20140716_125641/sar_1_20140716_125641_dev8-0-t2.png)

* Storage-4
![Storage-4](tests/16k_load/leofs1306_20140716_125641/sar_1_20140716_125641_dev8-0-t1.png)
![Storage-4](tests/16k_load/leofs1306_20140716_125641/sar_1_20140716_125641_dev8-0-t2.png)

* Storage-5
![Storage-5](tests/16k_load/leofs1307_20140716_125641/sar_1_20140716_125641_dev8-0-t1.png)
![Storage-5](tests/16k_load/leofs1307_20140716_125641/sar_1_20140716_125641_dev8-0-t2.png)


#### Summary

* Total of network traffic:  .  Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
          |          |           |
total     |          |           |
