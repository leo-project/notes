## Answer 
In this case, you have faced with [this issue](https://github.com/basho/eleveldb/issues/120).
You need to set ``-smp enable`` in your leo_storage configuration - *leo_storage.conf* as follows:


```ini
## leo_storage.conf
erlang.smp = enable
```

See also:
* [Erlang - erl_nif](http://www.erlang.org/doc/man/erl_nif.html#enif_send)
* [LeoFS documentation - leo_storage configuration](http://leo-project.net/leofs/docs/configuration/configuration_2.html)
* [leo_storage - leo_storage.conf](https://github.com/leo-project/leo_storage/blob/develop/priv/leo_storage.conf)
