## Benchmark LeoFS v1.2.4

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.2.4
* LeoFS cluster settings:

```
 [System Confiuration]
---------------------------------+----------
 Item                            | Value    
---------------------------------+----------
 Basic/Consistency level
---------------------------------+----------
                  system version | 1.2.4
                      cluster Id | leofs_1
                           DC Id | dc_1
                  Total replicas | 3
        number of successes of R | 1
        number of successes of W | 2
        number of successes of D | 2
 number of DC-awareness replicas | 0
                       ring size | 2^128
---------------------------------+----------
 Multi DC replication settings
---------------------------------+----------
      max number of joinable DCs | 2
         number of replicas a DC | 1
---------------------------------+----------
 Manager RING hash
---------------------------------+----------
               current ring-hash | 2b468816
              previous ring-hash | 2b468816
---------------------------------+----------

 [State of Node(s)]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 2b468816       | 2b468816       | 2015-01-29 14:07:33 +0900
  S    | leofs15@192.168.100.15      | running      | 2b468816       | 2b468816       | 2015-01-29 14:07:33 +0900
  S    | leofs16@192.168.100.16      | running      | 2b468816       | 2b468816       | 2015-01-29 14:07:33 +0900
  S    | leofs17@192.168.100.17      | running      | 2b468816       | 2b468816       | 2015-01-29 14:07:33 +0900
  S    | leofs18@192.168.100.18      | running      | 2b468816       | 2b468816       | 2015-01-29 14:07:33 +0900
  G    | leofs13@192.168.100.13      | running      | 2b468816       | 2b468816       | 2015-01-29 14:07:39 +0900
-------+-----------------------------+--------------+----------------+----------------+----------------------------

```

* basho-bench Configuration:
    * Duration: 120 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..  10240: 24%
        *  10241.. 102400: 30%
        * 102401.. 819200: 30%
        * 819201..1572864: 16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r8w2_120min.conf](20150129_140855/1m_r8w2_120min.conf)

### OPS and Latency:

![ops-latency](20150129_140855/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20150129_140854/sar_1_20150129_140854_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20150129_140854/sar_3_20150129_140854_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20150129_140854/sar_3_20150129_140854_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20150129_140854/sar_3_20150129_140854_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20150129_140854/sar_3_20150129_140854_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20150129_140854/sar_2_20150129_140854_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20150129_140854/sar_3_20150129_140854_dev8-16-t1.png)
![Storage-1](leofs14_20150129_140854/sar_3_20150129_140854_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20150129_140854/sar_3_20150129_140854_dev8-16-t1.png)
![Storage-2](leofs15_20150129_140854/sar_3_20150129_140854_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20150129_140854/sar_3_20150129_140854_dev8-16-t1.png)
![Storage-3](leofs16_20150129_140854/sar_3_20150129_140854_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20150129_140854/sar_3_20150129_140854_dev8-16-t1.png)
![Storage-4](leofs17_20150129_140854/sar_3_20150129_140854_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20150129_140854/sar_2_20150129_140854_dev8-16-t1.png)
![Storage-5](leofs18_20150129_140854/sar_2_20150129_140854_dev8-16-t2.png)


#### Summary

* Total of network traffic:  .  Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |    44.0  |     26.3  |      70.3
storage_1 |    38.1  |     26.3  |      64.4
storage_2 |    38.6  |     26.4  |      65.0
storage_3 |    38.6  |     26.9  |      65.5
storage_4 |    40.0  |     27.3  |      67.3
gateway_0 |    68.8  |    341.8  |     410.6
total     |   268.1  |    475.0  |     743.1
