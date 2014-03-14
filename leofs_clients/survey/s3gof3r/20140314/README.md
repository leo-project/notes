Title
=====
[s3gof3r](https://github.com/rlmcpherson/s3gof3r/) performance test

Purpose
=======
* Confirm [this issue](https://github.com/leo-project/leofs/issues/154) have been fixed.
* Confirm the performances with a combination of some performance factors like `-c`, `-s`.

How to test
===========
Confirm the result of `gof3r` command

* Conditions
    * the size of a test file
    * `-c` option passed to gof3r
    * `-s` option passed to gof3r( this must be the same value with large_object.chunked_obj_len within the leo_gateway.conf

* How to make a test file
    * `dd` with `/dev/urandom` like this `dd if=/dev/urandom of=5G.dat bs=1048576 count=5000`

* LeoFS cluster information
    * Server: CentOS 6.4
    * LeoFS : develop(2014/3/14)
    * s3gof3r: master(https://github.com/rlmcpherson/s3gof3r/) fetched at 4th March 2014
    * consistency: N:3, R:1, D:1, W:2
    * # of servers: G:1, S:5

Results
=======
* put

| file size | -c | -s | time |
| -------- | --------- | ------ | -------- |
| 5G | 1 | 5242880 | 1m24 | 
| 5G | 2 | 5242880 | 51sec | 
| 5G | 4 | 5242880 | 46sec | 
| 5G | 8 | 5242880 | 46sec | 

* get

| file size | -c | -s | time |
| -------- | --------- | ------ | -------- |
| 5G | 1 | 5242880 | 40sec | 
| 5G | 2 | 5242880 | 40sec | 
| 5G | 4 | 5242880 | 42sec | 
| 5G | 8 | 5242880 | 39sec | 


Conclution
==========
* [this issue](https://github.com/leo-project/leofs/issues/154) have been fixed.
* Write operations seem to scale as `-c` increases at a certain point
* Read operations seem not to scale regardless of `-c` value
* Rest of contents to be filled next week...
