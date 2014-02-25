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
| diff     | N/A       | N/A    |
| find     | N/A       | N/A    |
| chgrp    | N/A       | N/A    |
| chmod    | N/A       | N/A    |
| chown    | N/A       | N/A    |
| cp       | yes       | yes    |
| ls       | N/A       | N/A    |
| ln       | N/A       | N/A    |
| mkdir    | N/A       | N/A    |
| mv       | N/A       | N/A    |
| rm       | N/A       | N/A    |
| rmdir    | N/A       | N/A    |
| stat     | N/A       | N/A    |
| touch    | N/A       | N/A    |

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
