Title
=====
[s3fuse](https://code.google.com/p/s3fuse/) performance test

Purpose
=======
* How many objects can LeoFS store in a directory with reasonable `list_bucket` latency in practice?
* Does the number of total objects stored in LeoFS affect the performance of `list_bucket`?
* Does the number of concurrent requests to LeoFS affect the performance of `list_bucket`?
* Does the number of mount points to LeoFS affect the performance of `list_bucket`?

How to test
===========
Measure the time of `ls` command against a directory storing a specific amount of files with the `time` command.

* Conditions
    * the number of mount points(hereafter called `M`)
    * the number of concurrent requests per a mount point(hereafter called `C`)
    * the number of total objects stored in LeoFS(hereafter called `T`)
    * the number of objects in the target(ls) directory(hereafter called `O`)

Results
=======
* M=1, C=1

| T | O | latency(avg.) |
| -------- | --------- | ------ | -------- |
| 100,000 | 1000 | real 0m3.657s, user 0m0.021s, sys 0m0.113s |
| 500,000 | 1000 | real 0m4.645s, user 0m0.015s, sys 0m0.083s |
| 1,000,000 | 1000 | real 0m4.567s, user 0m0.033s, sys 0m0.081s |
| 100,000 | 5000 | real 0m24.053s, user 0m0.043s, sys 0m0.252s |
| 500,000 | 5000 | real 0m24.976s, user 0m0.064s, sys 0m0.199s |
| 1,000,000 | 5000 | real 0m21.571s, user 0m0.054s, sys 0m0.272s |
| 100,000 | 10000 | real 1m1.716s, user 0m0.102s, sys 0m0.477s |
| 500,000 | 10000 | real 1m1.440s, user 0m0.109s, sys 0m0.369s |
| 1,000,000 | 10000 | real 1m3.282s, user 0m0.086s, sys 0m0.412s |

* M=1, C=2

| T | O | latency(avg.) |
| -------- | --------- | ------ | -------- |
| 1,000,000 | 1000 | real 0m7.001s, user 0m0.012s, sys 0m0.050s |
| 1,000,000 | 5000 | real 0m35.630s, user 0m0.057s, sys 0m0.261s |
| 1,000,000 | 10000 | real 1m43.352s, user 0m0.115s, sys 0m0.429s |

* M=1, C=3

| T | O | latency(avg.) |
| -------- | --------- | ------ | -------- |
| 1,000,000 | 1000 | real 0m8.712s, user 0m0.009s, sys 0m0.040s |
| 1,000,000 | 5000 | real 0m50.149s, user 0m0.059s, sys 0m0.221s |
| 1,000,000 | 10000 | real 2m25.574s, user 0m0.105s, sys 0m0.407s |

* M=2, C=1

| T | O | latency(avg.) |
| -------- | --------- | ------ | -------- |
| 1,000,000 | 1000 | real 0m4.781s, user 0m0.012s, sys 0m0.055s |
| 1,000,000 | 5000 | real 0m26.575s, user 0m0.065s, sys 0m0.305s |
| 1,000,000 | 10000 | real 1m21.628s, user 0m0.140s, sys 0m0.528s |

* M=3, C=1

| T | O | latency(avg.) |
| -------- | --------- | ------ | -------- |
| 1,000,000 | 1000 | real 0m4.411s, user 0m0.015s, sys 0m0.043s |
| 1,000,000 | 5000 | real 0m27.183s, user 0m0.068s, sys 0m0.248s |
| 1,000,000 | 10000 | real 1m26.885s, user 0m0.139s, sys 0m0.467s |

Conclution
==========
* `s3fuse` achieved the impressive result compared to `s3fs-fuse`. This means `s3fuse` will be replaced where `s3fs-fuse` have been used.
* We recommend limiting `O` under 1,000 in production for now.
* `T` have almost no effect to `ls` performance.
* The result of `M`, `C` means when accessing to LeoFS via s3fuse in parallel, Increasing M lead to boost performance.
