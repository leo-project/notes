# Leo_Pod Function Reference

```Erlang
leo_pod:start_link(PodName, PodSize, MaxOverflow, WorkerMod, WorkerArgs, InitFun) -> {'ok',pid()}.
```

**Explanation:**

Initialize a worker pool.

**Types:**

 * `PodName` = `atom()`
 * `PodSize` = `non_neg_integer()`
 * `MaxOverFlow` = `non_neg_integer()`
 * `WorkerMod` = `module()`
 * `WorkerArgs` = `[any()]`
 * `InitFun` = `fun((any()) -> any())`

- - -
 
```Erlang
stop(PodName) -> 'true' | 'not_started'.
```

**Explanation:**

Stop the worker pool.

**Types:**

 * `PodName` = `atom()`

- - -
 
```Erlang

```

**Explanation:**



**Types:**

 * 
