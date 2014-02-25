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
| diff     | OK        | OK     |
| find     | OK        | OK     |
| chgrp    | N/A       | N/A    |
| chmod    | N/A       | N/A    |
| chown    | N/A       | N/A    |
| cp       | OK        | OK     |
| ls       | OK        | OK     |
| ln       | N/A       | N/A    |
| mkdir    | OK        | OK     |
| mv       | OK        | OK     |
| rm       | OK        | OK     |
| rmdir    | OK        | NG     |
| stat     | OK        | OK     |
| touch    | OK        | OK     |

- "stat" show modify time but do not access time and change time are always 1970-01-01 09:00:00.000000000 +0900

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
    * rmdir always do not work regardless of existing childs

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

