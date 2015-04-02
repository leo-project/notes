### How to use LeoFS on FreeBSD with NFS

* Install ports(http://www.freebsd.org/doc/ja/books/handbook/ports-using.html)

* Install sudo at first

    ```sh
      # exec as root
      cd /usr/ports/security/sudo
      make clean
      make install

      # visudo to grant sudo rigth to a user
      visudo
    ```
  
  After that, we can use "sudo *" to execute commands which need the root right
  
* Install basic commands such as bash, vim and git by ports

 same as installing sudo
  
* Install erlang

  ```sh
   cd /usr/ports/lang/erlang
   sudo make install
  ```

* Install dependent libs such as cmake, check by ports

* Install LeoFS

 same as other xnixes

* Start dependent services
  ```sh
    sudo vi /etc/rc.conf 

    ## append below line to rc.conf to allow executing rpcbind
    rpcbind_enable="YES"
    
    ## append below line to rc.conf to allow executing NFS client
    nfs_client_enable="YES"

  ```
  
  ```sh
    sudo vi /etc/rc.d/rpcbind
    
    ## append below line to rpcbind to allow LeoFS to connect 
    command_args="-i -L"
  ```

  ```sh
    ## start rpcbind
    sudo service rpcbind start
  ```

* Deploy LeoFS with NFS

 same as other xnixes
  
* Open ports used by NFS processes as need
 
 - `111` used by rpcbind
 - `2049` nfsd by leo_gateway
 - `22050` mountd by leo_gateway

10. Connect LeoFS with NFS from a NFS client which is able to disable `lock` option

   ```sh
     # nolock must be passed
     sudo mount -t nfs -o nolock ec2-54-95-29-118.ap-northeast-1.compute.amazaws.com:/bbb /mnt/foo
   ```
  
