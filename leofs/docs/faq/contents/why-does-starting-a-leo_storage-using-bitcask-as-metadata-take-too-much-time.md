Q. Why does starting a leo_storage using bitcask as metadata take too much time?

A. When starting a leo_storage with bitcask, 
Since leo_storage always call the `bitcask:merge` operation, Starting process may take too much time if leo_storage stored lots of objects.
We recommend users to replace bitcask with leveldb by using [this tool](https://github.com/leo-project/leofs_utils/tree/develop/tools/b2l).
