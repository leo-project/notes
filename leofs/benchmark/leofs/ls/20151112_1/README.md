# LeoFS ls-command benchmark
## Environment
* AWS EC2 C3.2XLarge 8-Core
* Memory: 16GB
* LeoFS: v1.2.16 / v1.4.0-pre.3
* Erlang: 17.5
* LeoFS Cluster: Manager x 2, Gateway x 1, Storage x 4
* Client: s3cmd v1.1

## Result
![leofs-ls-command-benchmark](leofs-ls-command-benchmark.jpg)

### 1Dir
#### LeoFS v1.4-pre.3 (dev)
##### 500
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.203s
user	0m0.155s
sys	0m0.012s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.199s
user	0m0.135s
sys	0m0.028s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.207s
user	0m0.154s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.204s
user	0m0.154s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.201s
user	0m0.140s
sys	0m0.024s
```

##### 1000
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.408s
user	0m0.262s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.397s
user	0m0.275s
sys	0m0.004s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.402s
user	0m0.265s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.399s
user	0m0.270s
sys	0m0.012s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.419s
user	0m0.273s
sys	0m0.016s
```

##### 2000
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.819s
user	0m0.492s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.781s
user	0m0.486s
sys	0m0.028s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.802s
user	0m0.482s
sys	0m0.028s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.784s
user	0m0.490s
sys	0m0.020s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.738s
user	0m0.501s
sys	0m0.020s
```

##### 5000
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m1.964s
user	0m1.167s
sys	0m0.020s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m2.040s
user	0m1.164s
sys	0m0.040s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m2.012s
user	0m1.180s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m2.055s
user	0m1.179s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m1.969s
user	0m1.159s
sys	0m0.028s
```

##### 10000
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m4.513s
user	0m2.338s
sys	0m0.052s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m4.700s
user	0m2.347s
sys	0m0.048s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m4.606s
user	0m2.363s
sys	0m0.032s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m4.643s
user	0m2.348s
sys	0m0.044s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m4.625s
user	0m2.407s
sys	0m0.056s
```


#### LeoFS v1.2.16
##### 500
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.438s
user	0m0.159s
sys	0m0.008s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.442s
user	0m0.156s
sys	0m0.008s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.439s
user	0m0.157s
sys	0m0.008s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.441s
user	0m0.149s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m0.446s
user	0m0.152s
sys	0m0.019s
```

##### 1000
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m1.351s
user	0m0.262s
sys	0m0.020s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m1.340s
user	0m0.269s
sys	0m0.009s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m1.352s
user	0m0.269s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m1.341s
user	0m0.270s
sys	0m0.008s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m1.356s
user	0m0.253s
```

##### 2000
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m2.759s
user	0m0.484s
sys	0m0.028s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m2.775s
user	0m0.487s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m2.747s
user	0m0.489s
sys	0m0.016s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m2.758s
user	0m0.491s
sys	0m0.012s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m2.777s
user	0m0.499s
sys	0m0.020s
```

##### 5000
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m8.324s
user	0m1.203s
sys	0m0.032s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m8.355s
user	0m1.199s
sys	0m0.008s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m8.405s
user	0m1.172s
sys	0m0.036s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m8.434s
user	0m1.183s
sys	0m0.036s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m8.441s
user	0m1.181s
sys	0m0.052s
$
```

##### 10000
```bash
$ time s3cmd ls s3://test/1/ > /dev/null
real	0m24.634s
user	0m2.366s
sys	0m0.028s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m24.641s
user	0m2.339s
sys	0m0.064s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m24.622s
user	0m2.361s
sys	0m0.048s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m24.673s
user	0m2.322s
sys	0m0.064s

$ time s3cmd ls s3://test/1/ > /dev/null
real	0m24.549s
user	0m2.321s
sys	0m0.052s

$ time s3cmd ls s3://test/1/ > /dev/null

real	0m24.430s
user	0m2.388s
sys	0m0.044s
```

### 50Dirs
#### Directories
```bash
$ s3cmd ls s3://test/
                       DIR   s3://test/1/
                       DIR   s3://test/10/
                       DIR   s3://test/11/
                       DIR   s3://test/12/
                       DIR   s3://test/13/
                       DIR   s3://test/14/
                       DIR   s3://test/15/
                       DIR   s3://test/16/
                       DIR   s3://test/17/
                       DIR   s3://test/18/
                       DIR   s3://test/19/
                       DIR   s3://test/2/
                       DIR   s3://test/20/
                       DIR   s3://test/21/
                       DIR   s3://test/22/
                       DIR   s3://test/23/
                       DIR   s3://test/24/
                       DIR   s3://test/25/
                       DIR   s3://test/26/
                       DIR   s3://test/27/
                       DIR   s3://test/28/
                       DIR   s3://test/29/
                       DIR   s3://test/3/
                       DIR   s3://test/30/
                       DIR   s3://test/31/
                       DIR   s3://test/32/
                       DIR   s3://test/33/
                       DIR   s3://test/34/
                       DIR   s3://test/35/
                       DIR   s3://test/36/
                       DIR   s3://test/37/
                       DIR   s3://test/38/
                       DIR   s3://test/39/
                       DIR   s3://test/4/
                       DIR   s3://test/40/
                       DIR   s3://test/41/
                       DIR   s3://test/42/
                       DIR   s3://test/43/
                       DIR   s3://test/44/
                       DIR   s3://test/45/
                       DIR   s3://test/46/
                       DIR   s3://test/47/
                       DIR   s3://test/48/
                       DIR   s3://test/49/
                       DIR   s3://test/5/
                       DIR   s3://test/50/
                       DIR   s3://test/6/
                       DIR   s3://test/7/
                       DIR   s3://test/8/
                       DIR   s3://test/9/
```

#### LeoFS v1.4.0-pre.3
##### 500
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.203s
user	0m0.140s
sys	0m0.024s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.205s
user	0m0.134s
sys	0m0.031s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.204s
user	0m0.150s
sys	0m0.017s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.200s
user	0m0.157s
sys	0m0.008s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.198s
user	0m0.148s
sys	0m0.016s
```

##### 1000
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.380s
user	0m0.269s
sys	0m0.008s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.397s
user	0m0.267s
sys	0m0.016s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.396s
user	0m0.252s
sys	0m0.031s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.388s
user	0m0.268s
sys	0m0.012s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.380s
user	0m0.261s
sys	0m0.016s
```

##### 2000
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.744s
user	0m0.495s
sys	0m0.008s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.749s
user	0m0.496s
sys	0m0.012s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.779s
user	0m0.499s
sys	0m0.016s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.804s
user	0m0.495s
sys	0m0.028s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.766s
user	0m0.492s
sys	0m0.028s
```

##### 5000
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.053s
user	0m1.182s
sys	0m0.028s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m1.993s
user	0m1.152s
sys	0m0.028s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.007s
user	0m1.154s
sys	0m0.032s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.026s
user	0m1.157s
sys	0m0.044s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.051s
user	0m1.162s
sys	0m0.020s
```

##### 10000
```bash
 time s3cmd ls s3://test/50/ > /dev/null
real	0m4.592s
user	0m2.331s
sys	0m0.060s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m4.886s
user	0m2.349s
sys	0m0.048s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m4.695s
user	0m2.364s
sys	0m0.032s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m4.553s
user	0m2.342s
sys	0m0.024s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m4.581s
user	0m2.323s
sys	0m0.052s
```

#### v1.2.16
##### 500
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.438s
user	0m0.150s
sys	0m0.020s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.453s
user	0m0.159s
sys	0m0.020s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.450s
user	0m0.168s
sys	0m0.008s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.464s
user	0m0.149s
sys	0m0.024s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m0.450s
user	0m0.164s
sys	0m0.008s
```

##### 1000
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m1.359s
user	0m0.270s
sys	0m0.012s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m1.350s
user	0m0.257s
sys	0m0.024s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m1.348s
user	0m0.270s
sys	0m0.012s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m1.379s
user	0m0.272s
sys	0m0.012s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m1.358s
user	0m0.256s
sys	0m0.024s
```

##### 2000
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.869s
user	0m0.492s
sys	0m0.024s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.843s
user	0m0.462s
sys	0m0.040s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.836s
user	0m0.492s
sys	0m0.016s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.788s
user	0m0.491s
sys	0m0.016s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m2.773s
user	0m0.470s
sys	0m0.040s
```

##### 5000
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m8.593s
user	0m1.186s
sys	0m0.024s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m8.547s
user	0m1.169s
sys	0m0.044s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m8.556s
user	0m1.175s
sys	0m0.024s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m8.507s
user	0m1.193s
sys	0m0.008s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m8.386s
user	0m1.157s
sys	0m0.041s
```

##### 10000
```bash
$ time s3cmd ls s3://test/50/ > /dev/null
real	0m25.003s
user	0m2.342s
sys	0m0.052s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m24.970s
user	0m2.351s
sys	0m0.056s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m25.096s
user	0m2.330s
sys	0m0.044s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m24.827s
user	0m2.356s
sys	0m0.032s

$ time s3cmd ls s3://test/50/ > /dev/null
real	0m24.535s
user	0m2.328s
sys	0m0.044s
```