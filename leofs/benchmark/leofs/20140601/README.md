## Benchmark LeoFS v1.0.2 on June 1st

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
             Current ring hash : d02a43c0
                Prev ring hash : d02a43c0
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | d02a43c0       | d02a43c0       | 2014-05-27 14:54:44 +0900
  S    | leofs15@192.168.100.15      | running      | d02a43c0       | d02a43c0       | 2014-05-27 14:54:44 +0900
  S    | leofs16@192.168.100.16      | running      | d02a43c0       | d02a43c0       | 2014-05-27 14:54:44 +0900
  S    | leofs17@192.168.100.17      | running      | d02a43c0       | d02a43c0       | 2014-05-27 14:54:44 +0900
  S    | leofs18@192.168.100.18      | running      | d02a43c0       | d02a43c0       | 2014-05-27 14:54:44 +0900
  G    | leofs13@192.168.100.13      | running      | d02a43c0       | d02a43c0       | 2014-05-27 14:55:07 +0900
```

* basho-bench Configuration:
    * Duration: 4hours
    * # of concurrent processes: 64
    * # of keys
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r9w1_240min.conf](https://github.com/leo-project/notes/blob/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/20140601_162422/1m_r9w1_240min.conf)

### OPS and Latency:

![ops-latency](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/20140601_162422/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway
![Gateway](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs13_20140601_162355/ksar-output/gateway_0_p1p1-if1.png)

* Storage-1
![Storage-1](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs14_20140601_162334/ksar-output/storage_0_p1p1-if1.png)

* Storage-2
![Storage-2](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs15_20140601_162333/ksar-output/storage_1_p1p1-if1.png)

* Storage-3
![Storage-3](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs16_20140601_162330/ksar-output/storage_2_p1p1-if1.png)

* Storage-4
![Storage-4](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs17_20140601_162334/ksar-output/storage_3_p1p1-if1.png)

* Storage-5
![Storage-5](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs18_20140601_162330/ksar-output/storage_4_p1p1-if1.png)


#### Summary

* Total of network traffic: 5.6Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |18        |28         | 46
storage_1 |20        |25         | 45
storage_2 |20        |25         | 45
storage_3 |20        |25         | 45
storage_4 |20        |25         | 45
gateway_0 |450       |50         | 45
total     |548       |178        | 726


### CPU Usage

* Gateway
![Gateway](https://raw.githubusercontent.com/leo-project/notes/33a660ba55df1be343969ece855280b8a0e96733/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs13_20140601_162355/ksar-output/gateway_0_all-cpu.png)

* Storage-1
![Storage-1](https://raw.githubusercontent.com/leo-project/notes/33a660ba55df1be343969ece855280b8a0e96733/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs14_20140601_162334/ksar-output/storage_0_all-cpu.png)

* Storage-2
![Storage-2](https://raw.githubusercontent.com/leo-project/notes/33a660ba55df1be343969ece855280b8a0e96733/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs15_20140601_162333/ksar-output/storage_1_all-cpu.png)

* Storage-3
![Storage-3](https://raw.githubusercontent.com/leo-project/notes/33a660ba55df1be343969ece855280b8a0e96733/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs16_20140601_162330/ksar-output/storage_2_all-cpu.png)

* Storage-4
![Storage-4](https://raw.githubusercontent.com/leo-project/notes/33a660ba55df1be343969ece855280b8a0e96733/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs17_20140601_162334/ksar-output/storage_3_all-cpu.png)

* Storage-5
![Storage-5](https://raw.githubusercontent.com/leo-project/notes/33a660ba55df1be343969ece855280b8a0e96733/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs18_20140601_162330/ksar-output/storage_4_all-cpu.png)


### Memory Usage

* Gateway
![Gateway](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs13_20140601_162355/ksar-output/gateway_0_LinuxkbmemSar.png)

* Storage-1
![Storage-1](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs14_20140601_162334/ksar-output/storage_0_LinuxkbmemSar.png)

* Storage-2
![Storage-2](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs15_20140601_162333/ksar-output/storage_1_LinuxkbmemSar.png)

* Storage-3
![Storage-3](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs16_20140601_162330/ksar-output/storage_2_LinuxkbmemSar.png)

* Storage-4
![Storage-4](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs17_20140601_162334/ksar-output/storage_3_LinuxkbmemSar.png)

* Storage-5
![Storage-5](https://raw.githubusercontent.com/leo-project/notes/master/leofs/benchmark/leofs/20140601/tests/1m_r9w1_240min/leofs18_20140601_162330/ksar-output/storage_4_LinuxkbmemSar.png)
