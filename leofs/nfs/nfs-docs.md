## Getting Started

### Configuration
 1. Modify `leo_gateway.conf`
   - Set `http.handler` to `nfs`
   - Set `large_object.chunked_obj_len` to `1048576`

```erlang
   ## Gateway’s HTTP API to use: [s3 | rest | embed | nfs]
   http.handler = nfs
   ## Length of a chunked object
   large_object.chunked_obj_len = 1048576
```

### Start LeoFS as NFS Server with other dependent programs

 1. [Start LeoFS as usual](http://leo-project.net/leofs/docs/admin_guide_1.html)

 2. Start rpcbind
  ```shell
   $ sudo service rpcbind start
  ```

 3. Create a bucket for NFS
  ```shell
   $ telnet 127.0.0.1 10010
   > add-bucket test 05236
  ```

 4. Create a mount point and Mount
  ```shell
   $ sudo mkdir /mnt/leofs
   $ sudo mount -t nfs -o nolock localhost:/test /mnt/leofs
  ```

Now you can operate the bucket test in LeoFS as a filesystem via `/mnt/leofs`.

### Confirm that NFS works

  1. Insert a file
  ```shell
   $ touch /mnt/leofs/newfile
   $ ls -al /mnt/leofs

   drwxrwxrwx  0 root root 4096  7月 31 10:09 2014 .
   drwxr-xr-x. 6 root root 4096  7月 11 12:38 2014 ..
   -rw-rw-rw-  0 root root    0  7月 31 10:25 2014 newfile
  ```

  2. Modify a file
  ```shell
   $ echo "hello world" > /mnt/leofs/newfile
   $ cat /mnt/leofs/newfile
   
   hello world
  ```

  3. Copy a file
  ```shell
   $ cp /mnt/leofs/newfile /mnt/leofs/newfile.copy
   $ ls -al /mnt/leofs

   drwxrwxrwx  0 root root 4096  7月 31 10:09 2014 .
   drwxr-xr-x. 6 root root 4096  7月 11 12:38 2014 ..
   -rw-rw-rw-  0 root root   12  7月 31 10:29 2014 newfile
   -rw-rw-rw-  0 root root   12  7月 31 10:31 2014 newfile.copy
  ```

  4. Diff files
  ```shell
   $ diff /mnt/leofs/newfile /mnt/leofs/newfile.copy
  ```

  5. Remove a file
  ```shell
   $ rm /mnt/leofs/newfile
   $ ls -al /mnt/leofs

   drwxrwxrwx  0 root root 4096  7月 31 10:09 2014 .
   drwxr-xr-x. 6 root root 4096  7月 11 12:38 2014 ..
   -rw-rw-rw-  0 root root   12  7月 31 10:31 2014 newfile.copy
  ```

  6. Create a directory
  ```shell
   $ mkdir -p /mnt/leofs/1/2/3
   $ ls -alR /mnt/leofs/1

   /mnt/leofs/1:
   drwxrwxrwx 0 root root 4096  7月 31 19:37 2014 .
   drwxrwxrwx 0 root root 4096  7月 31 10:09 2014 ..
   drwxrwxrwx 0 root root 4096  7月 31 10:37 2014 2

   /mnt/leofs/1/2:
   drwxrwxrwx 0 root root 4096  7月 31 19:37 2014 .
   drwxrwxrwx 0 root root 4096  7月 31 19:37 2014 ..
   drwxrwxrwx 0 root root 4096  7月 31 10:37 2014 3

   /mnt/leofs/1/2/3:
   drwxrwxrwx 0 root root 4096  7月 31 19:37 2014 .
   drwxrwxrwx 0 root root 4096  7月 31 19:37 2014 ..
  ```

  7. Create a very large file
  ```shell
   # Create a 50M file
   $ dd if=/dev/urandom of=/mnt/leofs/1/2/3/largefile bs=1048576 count=50
   $ ls -alR /mnt/leofs/1

   drwxrwxrwx 0 root root     4096  7月 31 19:42 2014 .
   drwxrwxrwx 0 root root     4096  7月 31 19:42 2014 ..
   -rw-rw-rw- 0 root root 52428800  7月 31 10:42 2014 largefile
  ```

  8. Remove files recursively
  ```shell
   $ rm -rf /mnt/leofs/1/
   $ ls -al /mnt/leofs

   drwxrwxrwx  0 root root 4096  7月 31 10:09 2014 .
   drwxr-xr-x. 6 root root 4096  7月 11 12:38 2014 ..
   -rw-rw-rw-  0 root root   12  7月 31 10:31 2014 leofs.copy
  ```

And other basic file operations also should work except controlling owners/permissions.

## Configuration 
You can change the port number the NFS/Mount server use and the number of acceptor processes at `leo_gateway.conf`.

|Property|Description|
|--------|-----------|
|nfs.port|Port number the NFS server use|
|nfs.num_of_acceptors| The number of acceptor processes listening for NFS server connection|
|mount.port|Port number the Mount server use|
|mount.num_of_acceptors| The number of acceptor processes listening for Mount server connection|

## Limits
Since LeoFS NFS implementation is still Alpha status, there are some limitations.
Details are described at [LeoFS Limits](http://leo-project.net/leofs/docs/faq_2.html)

