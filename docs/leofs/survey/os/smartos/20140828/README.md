### How to use NFS of LeoFS on SmartOS

* Confirm service of rpc
```
# svcs -a | grep rpc
ex)
disabled       Apr_11   svc:/network/rpc/keyserv:default
disabled       Apr_11   svc:/network/rpc/gss:default
disabled       Apr_11   svc:/network/rpc/rex:default
disabled       Aug_18   svc:/network/rpc/bind:default
```
<br />
* If 'rpcbind' isn't enable, it have to change to enable.
```
# svcadm enable svc:/network/rpc/bind:default
# svcs -a | grep rpc
ex)
disabled       Apr_11   svc:/network/rpc/keyserv:default
disabled       Apr_11   svc:/network/rpc/gss:default
disabled       Apr_11   svc:/network/rpc/rex:default
online         Aug_18   svc:/network/rpc/bind:default
```
<br />
* Accept from local and outside network
```
# svccfg -s svc:/network/rpc/bind setprop config/local_only = false
```
<br />
* Reload setting
```
# svcadm refresh svc:/network/rpc/bind
```
<br />
* Mount (From another Linux machine)
```
# mount -t nfs -o nolock {leo_gateway}:/{bucket_name}  {target mount directory}
```

