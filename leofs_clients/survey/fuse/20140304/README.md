Title
=====
Performance tests s3fs-fuse and s3fuse with basho_bench

Target
======
* [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse)
* [s3fuse](https://code.google.com/p/s3fuse/)

Result
======
* s3fs-fuse
    * basho_bench files 
        * [case1](https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_load_64k)
![summary.png](https://raw.github.com/leo-project/notes/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_load_64k/summary.png)
        
        * https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_load_64k_with_low_concurrency
        * https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_r8w2_64k
        * https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fs-fuse_r8w2_64k_with_low_concurrency
    *  examinations
        * Loading data throughput into LeoFS via s3fs-fuse is considerably reduced as time goes on.

* s3fuse
    * basho_bench files 
        * https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_load_64k
        * https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_load_64k_with_low_concurrency
        * https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_r8w2_64k
        * https://github.com/leo-project/notes/tree/master/leofs_clients/survey/fuse/20140304/tests/s3fuse_r8w2_64k_with_low_concurrency
    *  examinations
        * Setting concurrency in a basho_bench config file low improve load throughput  


