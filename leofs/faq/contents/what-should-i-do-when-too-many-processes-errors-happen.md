Q. What should I do when `Too many processes` errors happen?

A. LeoFS usually try to keep the number of erlang processes as minimum as possible, but there are some exceptions when doing something asynchronously.

 - Replicating an object to the non-primary assigned nodes
 - Retrying to replicate an object when the previous attempt failed

Given that LeoFS suffered from very high load AND there are some nodes downed for some reason,
The number of erlang processes gradually have increased and might have reached [the sysmte limit](http://erlang.org/doc/man/erl.html#+P).
We recommend users to set an appropriate value which depends on your workload to +P option.
Also if +P option does NOT work for you, there are some possibilities that some external system resources like disk, network equipments have broken,
Please check out the dmesg/syslog on your sysmtem.
