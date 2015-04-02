## Answer 1
Actually, there is no login status in LeoFS, but the number of listening tcp connections is limited by leo_manger.conf (default: console.acceptors.cui = 3).
So while using default settings, 3 connections can be connected to a manager in parallel.

## Answer 2
Since LeoFS v1.1.0, LeoFS have the more powerful alternative option [leofs-adm](https://github.com/leo-project/leofs/blob/master/leofs-adm) command.
This command have not only same functionalities with the existing telnet way but also do NOT keep an tcp connection established for long time(connect only when issueing a command).
So you do not need to worry about the number of tcp connections.
