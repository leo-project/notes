## Benchmark LeoFS v1.1.2

### Master Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.1.2
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
             Current ring hash : dc9e0454
                Prev ring hash : dc9e0454
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | dc9e0454       | dc9e0454       | 2014-09-04 14:53:10 +0900
  S    | leofs15@192.168.100.15      | running      | dc9e0454       | dc9e0454       | 2014-09-04 14:53:10 +0900
  S    | leofs16@192.168.100.16      | running      | dc9e0454       | dc9e0454       | 2014-09-04 14:53:10 +0900
  S    | leofs17@192.168.100.17      | running      | dc9e0454       | dc9e0454       | 2014-09-04 14:53:10 +0900
  S    | leofs18@192.168.100.18      | running      | dc9e0454       | dc9e0454       | 2014-09-04 14:53:10 +0900
  G    | leofs13@192.168.100.13      | running      | dc9e0454       | dc9e0454       | 2014-09-04 14:53:17 +0900

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
    * Configuration file: [1m_r8w2_180min.conf](tests/1m_r8w2_180min_4mb/20140904_145436/1m_r8w2_180min.conf)

### OPS and Latency:

![ops-latency](20140904_145436/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20140904_145433/sar_1_20140904_145433_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20140904_145433/sar_3_20140904_145433_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20140904_145433/sar_3_20140904_145433_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20140904_145433/sar_3_20140904_145433_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20140904_145433/sar_3_20140904_145433_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20140904_145433/sar_2_20140904_145433_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20140904_145433/sar_3_20140904_145433_dev8-16-t1.png)
![Storage-1](leofs14_20140904_145433/sar_3_20140904_145433_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20140904_145433/sar_3_20140904_145433_dev8-16-t1.png)
![Storage-2](leofs15_20140904_145433/sar_3_20140904_145433_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20140904_145433/sar_3_20140904_145433_dev8-16-t1.png)
![Storage-3](leofs16_20140904_145433/sar_3_20140904_145433_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20140904_145433/sar_3_20140904_145433_dev8-16-t1.png)
![Storage-4](leofs17_20140904_145433/sar_3_20140904_145433_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20140904_145433/sar_2_20140904_145433_dev8-16-t1.png)
![Storage-5](leofs18_20140904_145433/sar_2_20140904_145433_dev8-16-t2.png)


### Slave Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.1.2
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
             Current ring hash : e6061ece
                Prev ring hash : e6061ece
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+--------------------------------+--------------+----------------+----------------+----------------------------
 type  |              node              |    state     |  current ring  |   prev ring    |          updated at         
-------+--------------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs1303@192.168.101.133      | running      | e6061ece       | e6061ece       | 2014-09-04 14:53:11 +0900
  S    | leofs1304@192.168.101.134      | running      | e6061ece       | e6061ece       | 2014-09-04 14:53:11 +0900
  S    | leofs1305@192.168.101.135      | running      | e6061ece       | e6061ece       | 2014-09-04 14:53:11 +0900
  S    | leofs1306@192.168.101.136      | running      | e6061ece       | e6061ece       | 2014-09-04 14:53:11 +0900
  S    | leofs1307@192.168.101.137      | running      | e6061ece       | e6061ece       | 2014-09-04 14:53:11 +0900
  G    | leofs1302@192.168.101.132      | running      | e6061ece       | e6061ece       | 2014-09-04 14:53:20 +0900

```

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs1302_20140904_145434/sar_1_20140904_145434_eth0-if1.png)

* Storage-1
![Storage-1](leofs1303_20140904_145434/sar_1_20140904_145434_eth0-if1.png)

* Storage-2
![Storage-2](leofs1304_20140904_145434/sar_1_20140904_145434_eth0-if1.png)

* Storage-3
![Storage-3](leofs1305_20140904_145434/sar_1_20140904_145434_eth0-if1.png)

* Storage-4
![Storage-4](leofs1306_20140904_145435/sar_1_20140904_145435_eth0-if1.png)

* Storage-5
![Storage-5](leofs1307_20140904_145434/sar_1_20140904_145434_eth0-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs1303_20140904_145434/sar_1_20140904_145434_dev8-0-t1.png)
![Storage-1](leofs1303_20140904_145434/sar_1_20140904_145434_dev8-0-t2.png)

* Storage-2
![Storage-2](leofs1304_20140904_145434/sar_1_20140904_145434_dev8-0-t1.png)
![Storage-2](leofs1304_20140904_145434/sar_1_20140904_145434_dev8-0-t2.png)

* Storage-3
![Storage-3](leofs1305_20140904_145434/sar_1_20140904_145434_dev8-0-t1.png)
![Storage-3](leofs1305_20140904_145434/sar_1_20140904_145434_dev8-0-t2.png)

* Storage-4
![Storage-4](leofs1306_20140904_145435/sar_1_20140904_145435_dev8-0-t1.png)
![Storage-4](leofs1306_20140904_145435/sar_1_20140904_145435_dev8-0-t2.png)

* Storage-5
![Storage-5](leofs1307_20140904_145434/sar_1_20140904_145434_dev8-0-t1.png)
![Storage-5](leofs1307_20140904_145434/sar_1_20140904_145434_dev8-0-t2.png)


#### Summary

* Total of network traffic:  .  Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
          |          |           |
total     |          |           |
