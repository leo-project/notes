Currently after restarting a storage node, 
you need to issue the resume command with leofs-adm script manually like this.

```bash
    leofs-adm resume storage_0@127.0.0.1
```

We're planing to provide LeoFS's autonomic-operation like `auto-compaction`, `auto-rebalance` and others with LeoFS v1.2.
