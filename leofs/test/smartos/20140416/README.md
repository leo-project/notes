## Overview

@TODO

## Installation
### Install SmartOS

#### The environments

* Server Machine(Host)

| Item                 | Value                         |
|:---------------------|------------------------------:|
| OS                   |        SmartOS(13.4.1/base64) |
| CPU                  | Intel Xeon X5650(2.67GHz) * 2 |
| Memory               |                          96GB |
| HDD                  |                         270GB |

* Guests

| Item                 | Value                         |
|:---------------------|------------------------------:|
| OS                   |        SmartOS(13.4.1/base64) |
| Memory               |                           8GB |
| HDD                  |                          20GB |




```
*** SmartOS Install

* Environment
  - Create user
  - Set permission
  - Network configuration(/etc/resolv.conf)

* Install packages by pkgin
# cd /
# curl -k http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2013Q3-x86_64.tar.gz | gzcat | tar -xf -
# pkg_admin rebuild
# pkgin -y up
# pkgin in gmake scmgit-base gcc47 binutils pkg_alternatives autoconf cmake check automake flex

* Compile
$ mkdir -p ~/src
$ cd ~/src
```

### Install Erlang-related libs/environments

* Install libatomic

```
$ wget http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-7.2d.tar.gz
$ tar xzvf libatomic_ops-7.2d.tar.gz
$ cd libatomic_ops-7.2d
$ ./configure --prefix=/opt/local
$ make
$ sudo make install
```

* Install Erlang R16B03-1

```
$ wget http://www.erlang.org/download/otp_src_R16B03-1.tar.gz
$ tar xvfz otp_src_R16B03-1.tar.gz
$ cd otp_src_R16B03-1
$ ./configure --prefix=/opt/local/erlang/R16B03-1 \
              --enable-smp-support \
              --enable-m64-build \
              --disable-halfword-emulator \
              --enable-kernel-poll \
              --without-javac \
              --disable-native-libs \
              --disable-hipe \
              --disable-sctp \
              --enable-threads \
              --with-libatomic_ops=/opt/local
$ make
$ sudo make install
```

### Install LeoFS v1.0.0

```
- LeoFS
$ cd ~/
$ git clone https://github.com/leo-project/leofs.git
$ cd leofs
$ git checkout 1.0.0
$ make
$ make release
```

## Case-1: TEST LeoFS
### Configuration

| Item                 | Value       |
|:---------------------|------------:|
| inserted total files |           0 |
| # of replicas        |           3 |
| # of storage nodes   |           6 |
| # of gateway nodes   |           1 |

### LeoFS-related environments

| Item                 | Value       |
|:---------------------|------------:|
| Erlang               |    R16B03-1 |
| LeoFS's version      |       1.0.0 |

### Operation and Expectation result


| No| Operation                                                       | Expectation result            |
|:--|:----------------------------------------------------------------|:------------------------------|
| 1 | Launch Managee,Storage and Gateway                              | Success                       |
| 2 | Confirm disc-status of a storage-node with the ``du`` command   | Value of all items are ``0``  |
| 3 | Suspend ``storage_0``                                           | Success                       |
| 4 | Stop ``storage_0`` with the ``leo_storage`` shell               | Success                       |
| 5 | Restart ``storage_0`` with the ``leo_storage`` shell            | Success                       |
| 6 | Resume ``storage_0``                                            | Success                       |
| 8 | Reconfirm disc-status of a storage-node with the ``du`` command | Value of all items are ``0``  |


### Log


```
* LeoFS operation
-- Main status --
[System config]
                System version : 1.0.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : bf519cce
                Prev ring hash : bf519cce
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-------------------------------+--------------+----------------+----------------+----------------------------
 type  |             node              |    state     |  current ring  |   prev ring    |          updated at
-------+-------------------------------+--------------+----------------+----------------+----------------------------
  S    | storage_0@XXX.XXX.XXX.42      | running      | bf519cce       | bf519cce       | 2014-04-14 06:47:04 +0000
  S    | storage_1@XXX.XXX.XXX.43      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_2@XXX.XXX.XXX.44      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_3@XXX.XXX.XXX.45      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_4@XXX.XXX.XXX.46      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_5@XXX.XXX.XXX.47      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  G    | gateway_0@XXX.XXX.XXX.48      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:41 +0000

-- du Status --
du storage_0@XXX.XXX.XXX.42
 active number of objects: 0
  total number of objects: 0
   active size of objects: 0
    total size of objects: 0
     ratio of active size: 0%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__



== Suspend and stop ==
$ telnet {LEOFS_MANAGER} 10010
  suspend storage_0@XXX.XXX.XXX.42
  OK
  quit
$ {LEOFS_HOME}/leo_storage/bin/leo_storage stop
ok

-- Main status --
[System config]
                System version : 1.0.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : bf519cce
                Prev ring hash : bf519cce
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-------------------------------+--------------+----------------+----------------+----------------------------
 type  |             node              |    state     |  current ring  |   prev ring    |          updated at
-------+-------------------------------+--------------+----------------+----------------+----------------------------
  S    | storage_0@XXX.XXX.XXX.42      | suspend      | bf519cce       | bf519cce       | 2014-04-14 06:47:04 +0000
  S    | storage_1@XXX.XXX.XXX.43      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_2@XXX.XXX.XXX.44      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_3@XXX.XXX.XXX.45      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_4@XXX.XXX.XXX.46      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_5@XXX.XXX.XXX.47      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  G    | gateway_0@XXX.XXX.XXX.48      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:41 +0000


-- du status --
du storage_1@XXX.XXX.XXX.42
[ERROR] nodedown

== Startup storage ==
$ {LEOFS_HOME}/leo_storage/bin/leo_storage start

-- Main status --
[System config]
                System version : 1.0.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : bf519cce
                Prev ring hash : bf519cce
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-------------------------------+--------------+----------------+----------------+----------------------------
 type  |             node              |    state     |  current ring  |   prev ring    |          updated at
-------+-------------------------------+--------------+----------------+----------------+----------------------------
  S    | storage_0@XXX.XXX.XXX.42      | restarted    |                |                | 2014-04-16 06:58:52 +0000
  S    | storage_1@XXX.XXX.XXX.43      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_2@XXX.XXX.XXX.44      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_3@XXX.XXX.XXX.45      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_4@XXX.XXX.XXX.46      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_5@XXX.XXX.XXX.47      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  G    | gateway_0@XXX.XXX.XXX.48      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:41 +0000

-- du status --
du  storage_0@XXX.XXX.XXX.42
 active number of objects: 0
  total number of objects: 0
   active size of objects: 0
    total size of objects: 0
     ratio of active size: 0%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__

== kill -9 ==
$ kill -9 {PROCESS_ID}

-- Main status --
[System config]
                System version : 1.0.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : bf519cce
                Prev ring hash : bf519cce
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-------------------------------+--------------+----------------+----------------+----------------------------
 type  |             node              |    state     |  current ring  |   prev ring    |          updated at
-------+-------------------------------+--------------+----------------+----------------+----------------------------
  S    | storage_0@XXX.XXX.XXX.42      | stop         |                |                | 2014-04-16 07:01:09 +0000
  S    | storage_1@XXX.XXX.XXX.43      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_2@XXX.XXX.XXX.44      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_3@XXX.XXX.XXX.45      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_4@XXX.XXX.XXX.46      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_5@XXX.XXX.XXX.47      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  G    | gateway_0@XXX.XXX.XXX.48      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:41 +0000

-- du status --
du storage_0@XXX.XXX.XXX.42
[ERROR] nodedown

== Startup storage ==
$ {LEOFS_HOME}/leo_storage/bin/leo_storage start

-- Main status --
[System config]
                System version : 1.0.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : bf519cce
                Prev ring hash : bf519cce
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-------------------------------+--------------+----------------+----------------+----------------------------
 type  |             node              |    state     |  current ring  |   prev ring    |          updated at
-------+-------------------------------+--------------+----------------+----------------+----------------------------
  S    | storage_0@XXX.XXX.XXX.42      | restarted    | bf519cce       | bf519cce       | 2014-04-16 07:03:35 +0000
  S    | storage_1@XXX.XXX.XXX.43      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_2@XXX.XXX.XXX.44      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_3@XXX.XXX.XXX.45      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_4@XXX.XXX.XXX.46      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_5@XXX.XXX.XXX.47      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  G    | gateway_0@XXX.XXX.XXX.48      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:41 +0000

-- du status --
du storage_0@XXX.XXX.XXX.42
 active number of objects: 0
  total number of objects: 0
   active size of objects: 0
    total size of objects: 0
     ratio of active size: 0%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__


-- Main status --
[System config]
                System version : 1.0.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : bf519cce
                Prev ring hash : bf519cce
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-------------------------------+--------------+----------------+----------------+----------------------------
 type  |             node              |    state     |  current ring  |   prev ring    |          updated at
-------+-------------------------------+--------------+----------------+----------------+----------------------------
  S    | storage_0@XXX.XXX.XXX.42      | running      | bf519cce       | bf519cce       | 2014-04-16 07:03:35 +0000
  S    | storage_1@XXX.XXX.XXX.43      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_2@XXX.XXX.XXX.44      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_3@XXX.XXX.XXX.45      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_4@XXX.XXX.XXX.46      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  S    | storage_5@XXX.XXX.XXX.47      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:15 +0000
  G    | gateway_0@XXX.XXX.XXX.48      | running      | bf519cce       | bf519cce       | 2014-04-11 09:09:41 +0000

-- du status --
du storage_0@XXX.XXX.XXX.42
 active number of objects: 0
  total number of objects: 0
   active size of objects: 0
    total size of objects: 0
     ratio of active size: 0%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__


== vmadm result ==
# vmadm list
UUID                                  TYPE  RAM      STATE             ALIAS
26fe9a69-9e2c-47d3-949d-20845ca520e7  OS    8192     running           smartos8
5c1ea8fe-2160-4e3b-8d91-588a035140fc  OS    8192     running           smartos4
7b97c7e8-6b8e-4f72-9138-9fdbcb6eec16  OS    8192     running           smartos2
c7221459-8390-44ed-8ca9-23b96878cebe  OS    8192     running           smartos3
d05f15b5-771d-4714-972e-f21ddde8b54c  OS    8192     running           smartos6
edc75fd9-93c5-4fd0-844e-2c9e98b5df0c  OS    8192     running           smartos5
fa3a0cda-d09c-450a-b8e6-854e64e08a1a  OS    8192     running           smartos7
fb779bf9-272b-40b6-b2b2-629d8b433b92  OS    8192     running           smartos1


```