## Overview

[LeoFS](http://leo-project.net/leofs/) is a highly scalable, fault-tolerant [object storage](http://en.wikipedia.org/wiki/Object_storage) for the Web.

LeoFS provides *high cost performance ratio*. It allows you to build LeoFS clusters using commodity hardware on top of the Linux operating system. LeoFS will provide very good performance even on commodity hardware. LeoFS will require a smaller cluster than other storage to achieve the same performance. LeoFS is also very easy to setup and to operate.

LeoFS provides *high reliability* thanks to its great design on top of the [Erlang/OTP](http://www.erlang.org/) capabilities. Erlang/OTP is known for being used in production systems for years with a solid nine nines (99.9999999%) availability, and LeoFS is no exception. A LeoFS system will stay up regardless of software errors or hardware failures happening inside the cluster.

LeoFS provides *high scalability*. Adding and removing nodes is simple and quick, allowing you to react swiftly when your needs change. A LeoFS cluster can be thought as elastic storage that you can stretch as much and as often as you need.


## Role of each compoent

LeoFS consists of 3 components - ``Storage``, ``Gateway`` and ``Manager`` which depend on Erlang.

``Gateway`` handles http-request and http-response from any clients when using REST-API OR S3-API. Also, ``Gateway`` is already built in the object-cache mechanism (memory cache and disc cache).

``Storage`` handles GET, PUT and DELETE objects as well as metadata, Also ``Storage`` has replicator, recoverer and queueing mechanism for keep running and keep consistency.

``Manager`` always monitors Leo Gateway(s) and Leo Storage(s). Main monitoring status are node-status and checksum of  RING - logical routing-table for keep availability and consistency.
