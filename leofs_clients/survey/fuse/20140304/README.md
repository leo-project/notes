Title
=====
Performance tests s3fs-fuse and s3fuse with basho_bench

Target
======
* [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse)
* [s3fuse](https://code.google.com/p/s3fuse/)

 
LeoFS
======

* Environment
   * OS: CentOS6.4
   * Erlang VM: R16B03-1
   * LeoFS's version: 1.0.0-pre3
* Cluster Settings
   
```
    [System config]
                    System version : 1.0.0-pre3
                        Cluster Id : 
                             DC Id : 
                    Total replicas : 3
               # of successes of R : 1
               # of successes of W : 2
               # of successes of D : 1
    # of DC-awareness replicas    : 0
    # of Rack-awareness replicas  : 0
                         ring size : 2^128
                 Current ring hash : 41e0c107
                    Prev ring hash : 41e0c107
    
    [Node(s) state]
    -------+-------------------------------+--------------+----------------+----------------+----------------------------
     type  |             node              |    state     |  current ring  |   prev ring    |          updated at         
    -------+-------------------------------+--------------+----------------+----------------+----------------------------
      S    | intel22@192.168.200.22        | running      | 41e0c107       | 41e0c107       | 2014-02-20 18:04:59 +0900
      S    | intel24@192.168.200.24        | running      | 41e0c107       | 41e0c107       | 2014-02-20 18:04:59 +0900
      S    | intel25@192.168.200.25        | running      | 41e0c107       | 41e0c107       | 2014-02-20 18:04:59 +0900
      S    | intel26@192.168.200.26        | running      | 41e0c107       | 41e0c107       | 2014-02-20 18:04:59 +0900
      G    | gateway_0@192.168.200.12      | running      | 41e0c107       | 41e0c107       | 2014-02-20 18:04:59 +0900
```

Result
======
* s3fs-fuse
    * basho_bench files 
        * [case1](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_load_64k)
            * concurrent: 32
            * # of objects: 10000
            * Value: fixed_bin, 65536
            * put: 100%
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_load_64k/summary.png)
        * [case2](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_load_64k_with_low_concurrency)
            * concurrent: 8
            * # of objects: 10000
            * Value: fixed_bin, 65536
            * put: 100%
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_load_64k_with_low_concurrency/summary.png)
        * [case3](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_r8w2_64k)
            * concurrent: 32
            * # of objects: 10000
            * Value: fixed_bin, 65536
            * put: 20%, get:80%
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_r8w2_64k/summary.png)
        * [case4](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_r8w2_64k_with_low_concurrency)
            * concurrent: 8
            * # of objects: 10000
            * Value: fixed_bin, 65536
            * put: 20%, get:80%
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_r8w2_64k_with_low_concurrency/summary.png)
    * Examinations
        * Loading data throughput into LeoFS via s3fs-fuse is considerably reduced as time goes on.

* s3fuse
    * basho_bench files 
        * [case1](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_load_64k)
            * concurrent: 32
            * # of objects: 10000
            * Value: fixed_bin, 65536
            * put: 100%
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_load_64k/summary.png)
        * [case2](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_load_64k_with_low_concurrency)
            * concurrent: 8
            * # of objects: 10000
            * Value: fixed_bin, 65536
            * put: 100%
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_load_64k_with_low_concurrency/summary.png)
        * [case3](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_r8w2_64k)
            * concurrent: 32
            * # of objects: 10000
            * Value: fixed_bin, 65536
            * put: 20%, get:80%
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_r8w2_64k/summary.png)
        * [case4](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_r8w2_64k_with_low_concurrency)
            * concurrent: 8
            * # of objects: 10000
            * Value: fixed_bin, 65536
            * put: 20%, get:80%
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_r8w2_64k_with_low_concurrency/summary.png)
    * Examinations
        * Setting concurrency in a basho_bench config file low improve load throughput  

