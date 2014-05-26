Title
=====

Benchmark result for leofs-1.0.2 on 10Gbps

Env
===

* bacho_bench (benchmarker)
    * Configuration:
        * key_generator:
            * type: pareto_int
            * max key: 100000
        * value_generator:
            * type: exponential_bin
            * min-size: 8192
            * mean-size: 10240 - 10485760
        * [see more](tests/)

* LeoFS
    * OS: CentOS release 6.5 (Final)
    * Kernel: Linux leofs12.rit.rakuten.com 2.6.32-431.el6.x86_64 #1 SMP Fri Nov 22 03:15:09 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
    * Erlang: R16B03-1
    * LeoFS:  1.0.2

* LeoFS cluster settings

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
             Current ring hash : 6bdc9c73
                Prev ring hash : 6bdc9c73
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 6bdc9c73       | 6bdc9c73       | 2014-05-26 10:14:50 +0900
  S    | leofs15@192.168.100.15      | running      | 6bdc9c73       | 6bdc9c73       | 2014-05-26 10:14:50 +0900
  S    | leofs16@192.168.100.16      | running      | 6bdc9c73       | 6bdc9c73       | 2014-05-26 10:14:50 +0900
  S    | leofs17@192.168.100.17      | running      | 6bdc9c73       | 6bdc9c73       | 2014-05-26 10:14:50 +0900
  S    | leofs18@192.168.100.18      | running      | 6bdc9c73       | 6bdc9c73       | 2014-05-26 10:14:50 +0900
  G    | leofs13@192.168.100.13      | running      | 6bdc9c73       | 6bdc9c73       | 2014-05-26 10:15:02 +0900
```

Result
======
* Bulk Load with 10K
![Bulk Load with 10K](tests/10k_load/summary.png)
* Read:Write = 8:2 with 10K
![Read:Write = 8:2 with 10K](tests/10k_r8w2/summary.png)
* Bulk Load with 1M
![Bulk Load with 1M](tests/1m_load/summary.png)
* Read:Write = 8:2 with 1M
![Read:Write = 8:2 with 1M](tests/1m_r8w2/summary.png)
* Bulk Load with 10M
![Bulk Load with 10M](tests/10m_load/summary.png)
* Read:Write = 8:2 with 10M
![Read:Write = 8:2 with 10M](tests/10m_r8w2/summary.png)

Conclusion
==========
We have been keeping the same performance with the new version LeoFS.
