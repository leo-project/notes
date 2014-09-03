## Benchmark LeoFS v1.1.1

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.1.1
* LeoFS cluster settings:

```
[System config]
                System version : 1.1.1
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : 43c52ee4
                Prev ring hash : 43c52ee4
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | stop         |                |                | 2014-09-02 16:09:51 +0900
  S    | leofs15@192.168.100.15      | stop         |                |                | 2014-09-02 16:10:30 +0900
  S    | leofs16@192.168.100.16      | stop         |                |                | 2014-09-02 16:10:50 +0900
  S    | leofs17@192.168.100.17      | stop         |                |                | 2014-09-02 16:07:20 +0900
  S    | leofs18@192.168.100.18      | stop         |                |                | 2014-09-02 16:04:59 +0900
  G    | leofs13@192.168.100.13      | running      | 43c52ee4       | 43c52ee4       | 2014-09-02 14:39:01 +0900

```

* basho-bench Configuration:
    * Duration: 180 minutes
    * # of concurrent processes: 64
    * # of keys
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r8w2_180min.conf](20140902_144046/1m_r8w2_180min.conf)

### OPS and Latency:

![ops-latency](20140902_144046/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20140902_144028/sar_1_20140902_144028_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20140902_144028/sar_3_20140902_144028_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20140902_144028/sar_3_20140902_144028_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20140902_144028/sar_3_20140902_144028_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20140902_144028/sar_3_20140902_144028_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20140902_144028/sar_2_20140902_144028_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20140902_144028/sar_3_20140902_144028_dev8-16-t1.png)
![Storage-1](leofs14_20140902_144028/sar_3_20140902_144028_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20140902_144028/sar_3_20140902_144028_dev8-16-t1.png)
![Storage-2](leofs15_20140902_144028/sar_3_20140902_144028_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20140902_144028/sar_3_20140902_144028_dev8-16-t1.png)
![Storage-3](leofs16_20140902_144028/sar_3_20140902_144028_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20140902_144028/sar_3_20140902_144028_dev8-16-t1.png)
![Storage-4](leofs17_20140902_144028/sar_3_20140902_144028_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20140902_144028/sar_2_20140902_144028_dev8-16-t1.png)
![Storage-5](leofs18_20140902_144028/sar_2_20140902_144028_dev8-16-t2.png)


### Slave Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.1.1
* LeoFS cluster settings:

```
[System config]
                System version : 1.1.1
                    Cluster Id : leofs_2
                         DC Id : dc_2
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : f0b0b438
                Prev ring hash : f0b0b438
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+--------------------------------+--------------+----------------+----------------+----------------------------
 type  |              node              |    state     |  current ring  |   prev ring    |          updated at         
-------+--------------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs1303@192.168.101.133      | running      | f0b0b438       | f0b0b438       | 2014-09-02 14:38:55 +0900
  S    | leofs1304@192.168.101.134      | running      | f0b0b438       | f0b0b438       | 2014-09-02 14:38:55 +0900
  S    | leofs1305@192.168.101.135      | running      | f0b0b438       | f0b0b438       | 2014-09-02 14:38:55 +0900
  S    | leofs1306@192.168.101.136      | running      | f0b0b438       | f0b0b438       | 2014-09-02 14:38:55 +0900
  S    | leofs1307@192.168.101.137      | running      | f0b0b438       | f0b0b438       | 2014-09-02 14:38:55 +0900
  G    | leofs1302@192.168.101.132      | running      | f0b0b438       | f0b0b438       | 2014-09-02 14:39:03 +0900

```


### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs1302_20140902_144037/sar_1_20140902_144037_eth0-if1.png)

* Storage-1
![Storage-1](leofs1303_20140902_144041/sar_1_20140902_144041_eth0-if1.png)

* Storage-2
![Storage-2](leofs1304_20140902_144041/sar_1_20140902_144041_eth0-if1.png)

* Storage-3
![Storage-3](leofs1305_20140902_144031/sar_1_20140902_144031_eth0-if1.png)

* Storage-4
![Storage-4](leofs1306_20140902_144037/sar_1_20140902_144037_eth0-if1.png)

* Storage-5
![Storage-5](leofs1307_20140902_144045/sar_1_20140902_144045_eth0-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs1303_20140902_144041/sar_1_20140902_144041_dev8-0-t1.png)
![Storage-1](leofs1303_20140902_144041/sar_1_20140902_144041_dev8-0-t2.png)

* Storage-2
![Storage-2](leofs1304_20140902_144041/sar_1_20140902_144041_dev8-0-t1.png)
![Storage-2](leofs1304_20140902_144041/sar_1_20140902_144041_dev8-0-t2.png)

* Storage-3
![Storage-3](leofs1305_20140902_144031/sar_1_20140902_144031_dev8-0-t1.png)
![Storage-3](leofs1305_20140902_144031/sar_1_20140902_144031_dev8-0-t2.png)

* Storage-4
![Storage-4](leofs1306_20140902_144037/sar_1_20140902_144037_dev8-0-t1.png)
![Storage-4](leofs1306_20140902_144037/sar_1_20140902_144037_dev8-0-t2.png)

* Storage-5
![Storage-5](leofs1307_20140902_144045/sar_1_20140902_144045_dev8-0-t1.png)
![Storage-5](leofs1307_20140902_144045/sar_1_20140902_144045_dev8-0-t2.png)


#### Summary

* Total of network traffic:  .  Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
          |          |           |
total     |          |           |
