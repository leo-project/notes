Title
=====
Survey s3 products using fuse

Products
=======
* [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse)
* [s3fuse](https://code.google.com/p/s3fuse/)
* [s3backer](https://code.google.com/p/s3backer)

Available commands
==================
| Commands | s3fs-fuse | s3fuse | s3backer |
| -------- | --------- | ------ | -------- |
| diff     | OK        | OK     | OK       |
| find     | OK        | OK     | OK       |
| chgrp    | N/A       | N/A    | OK       |
| chmod    | N/A       | N/A    | OK       |
| chown    | N/A       | N/A    | OK       |
| cp       | OK        | OK     | OK       |
| ls       | OK        | OK     | OK       |
| ln       | N/A       | N/A    | OK       |
| mkdir    | OK        | OK     | OK       |
| mv       | OK        | OK     | OK       |
| rm       | OK        | OK     | OK       |
| rmdir    | OK        | NG     | OK       |
| stat     | OK        | OK     | OK       |
| touch    | OK        | OK     | OK       |

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

* [s3backer](https://code.google.com/p/s3backer)
    * s3backer creates 4k files for each used block, creating that many files can bring leofs to a halt.

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

Concerns of leofs with owncloud
===============================
[s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse) or [aws-sdk-php](https://github.com/aws/aws-sdk-php) is required to use [leofs](https://github.com/leo-project/leofs/) under [owncloud](https://owncloud.org/).

* s3fs-fuse
  * Mount request of s3fs-fuse will timeout under lots of files in leofs.

* aws-sdk-php
  * To separate data on each users, the number of buckets will be same as the number of users, then buckets will increase dramatically.
  * Some S3 API are not supported by LeoFS now, so some patches will be required.
    * [getBucketAcl](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_getBucketAcl)
    * [waitUntilBucketExists](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_waitUntilBucketExists)
