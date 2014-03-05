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
   * Storage: 5
   * Gateway: 1
   * N:3, R:1, W:2, D:1

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

