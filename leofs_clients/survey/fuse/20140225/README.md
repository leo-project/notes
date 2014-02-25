Title
=====
Survey s3 products using fuse

Products
=======
* [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse)
* [s3fuse](https://code.google.com/p/s3fuse/)

Available commands
==================
| Commands | s3fs-fuse | s3fuse |
| -------- | --------- | ------ |
| diff     | N/A       | OK     |
| find     | N/A       | OK     |
| chgrp    | N/A       | N/A    |
| chmod    | N/A       | N/A    |
| chown    | N/A       | N/A    |
| cp       | N/A       | OK     |
| ls       | N/A       | OK     |
| ln       | N/A       | N/A    |
| mkdir    | N/A       | OK     |
| mv       | N/A       | OK     |
| rm       | N/A       | OK     |
| rmdir    | N/A       | NG     |
| stat     | N/A       | OK     |
| touch    | N/A       | OK     |

Problems to be solved
=====================
* [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse)
    * Lots of HEAD requests will be invoked after invoking a list_bucket request.
    * Unnecessary list_bucket requests may be invoked.
    * The cache data structure is not efficient(array with no index).
    * Unnecessary global locks will occur when accessing to cache datas.
    * UrlEncode logic is not efficient.
    * Reading a response body logic is not efficient due to invoking lots of mallocs
    * And there are lots of inefficient codes everywhere.

* [s3fuse](https://code.google.com/p/s3fuse/)
    * N/A

* [leofs](https://github.com/leo-project/leofs/)
    * Peformance degradation when invoking a ls command at a directory which have lots of sub directories AND lots of files

Example.

```
    /mnt/s3/0
    ├── 0
    │   └── lots of files
    ├── 1
    │   └── ...
    └── 2
        └── ....
```

```
    # The below command take a very long time due to searching all child files(directories)
    ls /mnt/s3/0
```

