# leo_pod function doc
## Leo_Pod Function List

* [`start_link/6`](#start_link6)
* [`stop/1`](#stop1)
* [`checkout/1`](#checkout1)
* [`checkin/1`](#checkin1)
* [`checkin_async/1`](#checkin_async1)
* [`status/1`](#status1)

## Leo_Pod Function Reference

### `start_link/6`

#### Usage

```Erlang
leo_pod:start_link(PodName, PodSize, MaxOverflow, WorkerMod, WorkerArgs, InitFun) -> {'ok',pid()}.
```

#### Explanation

Initialize a worker pool.

#### Types

* `PodName` = `atom()`
* `PodSize` = `non_neg_integer()`
* `MaxOverFlow` = `non_neg_integer()`
  * `PodSize + MaxOverFlow` is the max number of workers in the pool.
* `WorkerMod` = `module()`
* `WorkerArgs` = `[any()]`
* `InitFun` = `fun((any()) -> any())`

- - -

### stop/1

#### Usage
 
```Erlang
leo_pod:stop(PodName) -> 'true' | 'not_started'.
```

#### Explanation

Stop the worker pool.

#### Types

* `PodName` = `atom()`

- - -
 
```Erlang
leo_pod:checkout(PodName) -> {ok, pid()}.
```

**Explanation:**

Checkout a worker from the worker pool.

**Types:**

* `PodName` = `atom()`

- - -

```Erlang
leo_pod:checkin(PodName, Worker) -> ok.
```

**Explanation:**

Checkin the worker into the worker pool.

**Types:**

* `PodName` = `atom()`
* `Worker` = `pid()`

- - -

```Erlang
leo_pod:checkin_async(PodName, Worker) -> ok.
```

**Explanation:**

Checkin the worker into the worker pool assynchronously.

**Types:**

* `PodName` = `atom()`
* `Worker` = `pid()`

- - -

```Erlang
leo_pod:status(PodName) -> {ok, {non_neg_integer(),
                                 non_neg_integer(),
                                 non_neg_integer()}}.
```

**Explanation:**

Get the status of the worker pool.
It returns the tuple of the numbers of working_processes, waiting processes, and room of overflow.

**Types:**

* `PodName` = `atom()`

- - -
