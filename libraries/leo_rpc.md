# Leo_RPC Users Reference

## Leo_RPC Function List

* [`start/0`](#start0)
* [`async_call/4`](#async_call4)
* [`call/4,5,6`](#call456)
* [``](#)
* [``](#)
* [``](#)

## Leo_RPC Function Reference

### `start/0`

```Erlang
leo_rpc:start() -> ok | {error, any()}.
```

#### Explanation

Launch leo-rpc

#### Types

- - -

### `async_call/4`

```Erlang
async_call(Node, Mod, Method, Args) -> pid().
```

#### Explanation
Implements call streams with promises, a type of RPC which does not suspend the caller until the result is finished.
Instead, a key is returned which can be used at a later stage to collect the value.
The key can be viewed as a promise to deliver the answer.

#### Types

* `Node` = `atom()`
* `Mod` = `module()`
* `Method` = `atom()`
* `Args` = `[any()]`

- - -

### `call/4,5,6`

```Erlang
leo_rpc:call(Node, Mod, Method, Args) -> any() | {badrpc, any()}
leo_rpc:call(Node, Mod, Method, Args, Timeout) -> any() | {badrpc, any()}
leo_rpc:call(From, Node, Mod, Method, Args, Timeout) -> any() | {badrpc, any()}
```

#### Explanation

Evaluates apply(Module, Function, Args) on the `Node` node and returns the result or `{badrpc, Reason}` if the call fails.

#### Types

* `Node` = `atom()`
* `Mod` = `module()`
* `Method` = `atom()`
* `Args` = `[any()]`
* `Timeout` = `pos_integer()`
* `From` = `pid()`

- - -

### `multicall/4,5`

```Erlang
multicall(Nodes, Mod, Method, Args) -> any() | {badrpc, any()}.
multicall(Nodes, Mod, Method, Args, Timeout) -> any() | {badrpc, any()}.
```

#### Explanation

A multicall is an RPC which is sent concurrently from one client to multiple servers.
This is useful for collecting some information from a set of nodes.

#### Types

* `Node` = `atom()`
* `Mod` = `module()`
* `Method` = `atom()`
* `Args` = `[any()]`
* `Timeout` = `pos_integer()`

- - -

### `nb_yield/1,2`

```Erlang
nb_yield(Key) -> {value, any()} | timeout.
nb_yield(Key, Timeout) -> {value, any()} | timeout.
```

#### Explanation

This is able to call non-blocking.
It returns the tuple {value, Val} when the computation has finished, or timeout when Timeout milliseconds has elapsed.

#### Types

* `Key` = `pid()`
* `Timeout` = `pos_integer()`

- - -

```Erlang
cast(Node, Module, Method, Args) -> true.
```

#### Explanation

No response is delivered and the calling process is not suspended until the evaluation is complete, as is the case with call/4,5.

#### Types

* `Node` = `atom()`
* `Mod` = `module()`
* `Method` = `atom()`
* `Args` = `[any()]`

- - -

```Erlang
ping(Node) -> pong|pang.
```

#### Explanation

Tries to set up a connection to Node.
Returns pang if it fails, or pong if it is successful.

#### Types

* `Node` = `atom()`

- - -

```Erlang
status() -> {ok, list(#rpc_info{})} | {error, any()}.
```

#### Explanation

Retrieve status of active connections.

#### Types

- - -

```Erlang
node() -> 'nonode@nohost' | atom().
```

#### Explanation

Returns the name of the local node. If the node is not alive, nonode@nohost is returned instead.

#### Types

- - -

```Erlang
nodes() -> [atom()]
```

#### Explanation

Returns a list of all connected nodes in the system, excluding the local node.

#### Types

- - -

```Erlang
port() -> integer().
```

#### Explanation

Returns the port number of the local node.

#### Types

- - -

