Title
=====
Survey 0 byte issue on [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse)

Issue detail
============
Sometime, over 5MB data which is separated to chunk data become 0 byte on s3fs-fuse with leofs.

Purpose
=======
Find reason of this issue.

How to test
===========
* Preparation
  * Use "-f" option when mount leofs with s3fs-fuse to show operation.
  * Enable access log on leofs gateway.
  * Use mounted directory as backend storage of owncloud.

* LeoFS cluster information
    * Server: CentOS 6.4
    * LeoFS : 1.0.0-pre1
    * s3fs-fuse: 1.76(https://github.com/s3fs-fuse/s3fs-fuse)
    * fuse:   2.9.3
    * consistency: N:2, R:1, D:1, W:1
    * # of servers: G:1, S:4

Results outputs
===============
* [s3fs.log](./s3fs.log)
* [leofs_gateway_access.log](./leofs_gateway_access.log)


How to resolve
==============
This issue fixed by this [post](https://github.com/leo-project/leofs/issues/136).
The commit is included in LeoFS 1.0.0-pre3.
