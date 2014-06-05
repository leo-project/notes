## Benchmark LeoFS v1.0.2 on June 5th

### Environment

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
             Current ring hash : faa4b283
                Prev ring hash : faa4b283
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | faa4b283       | faa4b283       | 2014-06-03 15:04:01 +0900
  S    | leofs15@192.168.100.15      | running      | faa4b283       | faa4b283       | 2014-06-03 15:04:01 +0900
  S    | leofs16@192.168.100.16      | running      | faa4b283       | faa4b283       | 2014-06-03 15:04:01 +0900
  S    | leofs17@192.168.100.17      | running      | faa4b283       | faa4b283       | 2014-06-03 15:04:01 +0900
  S    | leofs18@192.168.100.18      | running      | faa4b283       | faa4b283       | 2014-06-03 15:04:01 +0900
  G    | leofs13@192.168.100.13      | running      | faa4b283       | faa4b283       | 2014-06-03 15:04:18 +0900
```

* basho-bench Configuration:
    * Duration: 240 minutes (HDD version)
    * # of concurrent processes: 64
    * # of keys
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r9w1_240min.conf](tests/1m_r9w1_240min/20140605_093638/1m_r9w1_240min.conf)

### OPS and Latency:

![ops-latency](tests/1m_r9w1_240min/20140605_093638/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway
![Gateway](tests/1m_r9w1_240min/leofs13_20140605_093629/sar_1_20140605_093629.png_p1p1-if1.png)

* Storage-1
![Storage-1](tests/1m_r9w1_240min/leofs14_20140605_093552/sar_3_20140605_093552.png_p1p1-if1.png)

* Storage-2
![Storage-2](tests/1m_r9w1_240min/leofs15_20140605_093551/sar_3_20140605_093551.png_p1p1-if1.png)

* Storage-3
![Storage-3](tests/1m_r9w1_240min/leofs16_20140605_093545/sar_3_20140605_093545.png_p1p1-if1.png)

* Storage-4
![Storage-4](tests/1m_r9w1_240min/leofs17_20140605_093551/sar_3_20140605_093551.png_p1p1-if1.png)

* Storage-5
![Storage-5](tests/1m_r9w1_240min/leofs18_20140605_093544/sar_2_20140605_093544.png_p1p1-if1.png)

### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](tests/1m_r9w1_240min/leofs14_20140605_093552/sar_3_20140605_093552.png_dev8-16-t1.png)
![Storage-1](tests/1m_r9w1_240min/leofs14_20140605_093552/sar_3_20140605_093552.png_dev8-16-t2.png)

* Storage-2
![Storage-2](tests/1m_r9w1_240min/leofs15_20140605_093551/sar_3_20140605_093551.png_dev8-16-t1.png)
![Storage-2](tests/1m_r9w1_240min/leofs15_20140605_093551/sar_3_20140605_093551.png_dev8-16-t2.png)

* Storage-3
![Storage-3](tests/1m_r9w1_240min/leofs16_20140605_093545/sar_3_20140605_093545.png_dev8-16-t1.png)
![Storage-3](tests/1m_r9w1_240min/leofs16_20140605_093545/sar_3_20140605_093545.png_dev8-16-t2.png)

* Storage-4
![Storage-4](tests/1m_r9w1_240min/leofs17_20140605_093551/sar_3_20140605_093551.png_dev8-16-t1.png)
![Storage-4](tests/1m_r9w1_240min/leofs17_20140605_093551/sar_3_20140605_093551.png_dev8-16-t2.png)

* Storage-5
![Storage-5](tests/1m_r9w1_240min/leofs18_20140605_093544/sar_2_20140605_093544.png_dev8-16-t1.png)
![Storage-5](tests/1m_r9w1_240min/leofs18_20140605_093544/sar_2_20140605_093544.png_dev8-16-t2.png)

#### Symmary

* Total of network traffic: 6.52Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |       35 |        21 |        56
storage_1 |       30 |        21 |        51
storage_2 |       31 |        21 |        52
storage_3 |       31 |        22 |        53
storage_4 |       32 |        22 |        54
gateway_0 |       56 |       513 |       569
total     |      215 |       620 |       835

### Environment

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
             Current ring hash : 89e6c120
                Prev ring hash : 89e6c120
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 89e6c120       | 89e6c120       | 2014-06-05 13:57:17 +0900
  S    | leofs15@192.168.100.15      | running      | 89e6c120       | 89e6c120       | 2014-06-05 13:57:17 +0900
  S    | leofs16@192.168.100.16      | running      | 89e6c120       | 89e6c120       | 2014-06-05 13:57:17 +0900
  S    | leofs17@192.168.100.17      | running      | 89e6c120       | 89e6c120       | 2014-06-05 13:57:17 +0900
  S    | leofs18@192.168.100.18      | running      | 89e6c120       | 89e6c120       | 2014-06-05 13:57:17 +0900
  G    | leofs13@192.168.100.13      | running      | 89e6c120       | 89e6c120       | 2014-06-05 13:57:31 +0900
```

* basho-bench Configuration:
    * Duration: 120 minutes (HDD version)
    * # of concurrent processes: 64
    * # of keys
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r9w1_120min.conf](tests/1m_r8w2_120min/20140605_140145/1m_r8w2_120min.conf)

### OPS and Latency:

![ops-latency](tests/1m_r8w2_120min/20140605_140145/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway
![Gateway](tests/1m_r8w2_120min/leofs13_20140605_140121/sar_1_20140605_140121.png_p1p1-if1.png)

* Storage-1
![Storage-1](tests/1m_r8w2_120min/leofs14_20140605_140044/sar_3_20140605_140044.png_p1p1-if1.png)

* Storage-2
![Storage-2](tests/1m_r8w2_120min/leofs15_20140605_140042/sar_3_20140605_140042.png_p1p1-if1.png)

* Storage-3
![Storage-3](tests/1m_r8w2_120min/leofs16_20140605_140037/sar_3_20140605_140037.png_p1p1-if1.png)

* Storage-4
![Storage-4](tests/1m_r8w2_120min/leofs17_20140605_140043/sar_3_20140605_140043.png_p1p1-if1.png)

* Storage-5
![Storage-5](tests/1m_r8w2_120min/leofs18_20140605_140036/sar_2_20140605_140036.png_p1p1-if1.png)

### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](tests/1m_r8w2_120min/leofs14_20140605_140044/sar_3_20140605_140044.png_dev8-16-t1.png)
![Storage-1](tests/1m_r8w2_120min/leofs14_20140605_140044/sar_3_20140605_140044.png_dev8-16-t2.png)

* Storage-2
![Storage-2](tests/1m_r8w2_120min/leofs15_20140605_140042/sar_3_20140605_140042.png_dev8-16-t1.png)
![Storage-2](tests/1m_r8w2_120min/leofs15_20140605_140042/sar_3_20140605_140042.png_dev8-16-t2.png)

* Storage-3
![Storage-3](tests/1m_r8w2_120min/leofs16_20140605_140037/sar_3_20140605_140037.png_dev8-16-t1.png)
![Storage-3](tests/1m_r8w2_120min/leofs16_20140605_140037/sar_3_20140605_140037.png_dev8-16-t2.png)

* Storage-4
![Storage-4](tests/1m_r8w2_120min/leofs17_20140605_140043/sar_3_20140605_140043.png_dev8-16-t1.png)
![Storage-4](tests/1m_r8w2_120min/leofs17_20140605_140043/sar_3_20140605_140043.png_dev8-16-t2.png)

* Storage-5
![Storage-5](tests/1m_r8w2_120min/leofs18_20140605_140036/sar_2_20140605_140036.png_dev8-16-t1.png)
![Storage-5](tests/1m_r8w2_120min/leofs18_20140605_140036/sar_2_20140605_140036.png_dev8-16-t2.png)

#### Symmary

* Total of network traffic: .Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |       42 |        27 |        69
storage_1 |       37 |        26 |        63
storage_2 |       38 |        27 |        65
storage_3 |       38 |        26 |        64
storage_4 |       38 |        27 |        65
gateway_0 |       68 |       317 |       385
total     |      261 |       450 |       711

