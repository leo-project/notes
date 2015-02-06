## Answer 
In this case, you have faced with [this issue](https://github.com/basho/eleveldb/issues/120).
You can avoid this issue by setting -smp enable in leo_storage.conf as follows:

```ini
erlang.smp = enable
```
