# Description: Redis Commands

### APPEND Command
* If key already exists and is a string, this command appends the value at the end of the string. 
* If key does not exist it is created and set as an empty string, so APPEND will be similar to SET in this case.
* Return value
    - Integer reply: the length of the string after the append operation.
```shell
EXISTS key1                     # 0

APPEND key1 "Hello"             # 5
GET key1                        # "Hello"

APPEND key1 " World"            # 11
GET key1                        # "Hello World"
```

### DECR Command
* Decrements the number stored at key by one. 
* If the key does not exist, it is set to 0 before performing the operation. 
* An error is returned if the key contains a value of the wrong type or contains a string that can not be represented as 
  integer. 
* This operation is limited to 64 bit signed integers.
* Return value
    - Integer reply: the value of key after the decrement
```shell
SET key1 "10"                   # OK
DECR key1                       # 9 

DECR key2                       # -1. Since key2 does not exist, it is set to 0 and then incremented.
```

### DEL Command
* Removes the specified keys. A key is ignored if it does not exist.
* Time complexity
    - Time complexity is O(1) when removing a single key that holds a string value.
    - Time complexity is O(N) where N is the number of keys that will be removed. When a key to remove holds a value 
      other than a string, the individual complexity for this key is O(M) where M is the number of elements in the list, 
      set, sorted set or hash. 
* Return value
    - Integer reply: The number of keys that were removed.
```shell
SET key1 "1"
SET key2 "2"

DEL key1 key2 key3              # 2. Since key3 does not exists.
```

### ECHO Command
* Returns the message.
```shell
ECHO "Hello World"          # "Hello World"
```

### EXISTS Command
* Returns if key exists.
* Since Redis 3.0.3 it is possible to specify multiple keys instead of a single one. 
    - In such a case, it returns the total number of keys existing. 
    - If the same existing key is mentioned in the arguments multiple times, it will be counted multiple times.
* Return value
    - Integer reply 1 if the key exists.
    - Integer reply 0 if the key does not exist.
    - Integer reply N if N of keys specified exists. 
```shell
SET key1 "1"
SET key2 "1"

EXISTS key1                     # 1.
EXISTS key1 key2 nosuchkey      # 2. Since key3 does not exists.
EXISTS key1 key1 key1           # 3. Each argument is counted separately.
```

### EXPIRE Command
* Set a timeout on key. 
* After the timeout has expired, the key will automatically be deleted. 
* A key with an associated timeout is often said to be volatile in Redis terminology.
* The timeout will only be cleared by commands that delete or overwrite the contents of the key, including DEL, SET, 
  GETSET and all the *STORE commands.
* This means that all the operations that conceptually alter the value stored at the key without replacing it with a new 
  one will leave the timeout untouched. For instance, incrementing the value of a key with INCR, pushing a new value 
  into a list with LPUSH, or altering the field value of a hash with HSET are all operations that will leave the timeout 
  untouched.
* The timeout can also be cleared, turning the key back into a persistent key, using the PERSIST command.
* If a key is renamed with RENAME, the associated time to live is transferred to the new key name.
* Return value
    - Integer reply 1 if the timeout was set.
    - Integer reply 0 if key does not exist.
```shell
SET key1 1                      # OK

EXPIRE key1 10                  # 1
TTL key1

SET key1 "Hello"                # OK
TTL key1                        # -1. Expire is reset since the value was set.       
```

### FLUSHALL Command
* Delete all the keys of all the existing databases, not just the currently selected one. This command never fails.
* The time-complexity for this operation is O(N), N being the number of keys in all existing databases.
* FLUSHALL ASYNC:
    - Applicable to Redis 4.0.0 or greater.
    - Redis is now able to delete keys in the background in a different thread without blocking the server. An ASYNC 
      option was added to FLUSHALL and FLUSHDB in order to let the entire dataset or a single database to be freed 
      asynchronously.
* Return value: Simple string reply.
```shell
FLUSHALL                        # OK. Deletes all the keys of all the databases.
FLUSHALL ASYNC                  # OK. Delete keys asynchronously. Applicable to Redis 4.0.0 or greater. 
```

### GET Command
* Get the value of key. 
* If the key does not exist the special value nil is returned. 
* An error is returned if the value stored at key is not a string, because GET only handles string values.
* Return value: Bulk string reply: the value of key, or nil when key does not exist.
```shell
GET key1                        # "Hello!!!".
GET key20                       # (nil).
```

### INCR Command
* Increments the number stored at key by one. 
* If the key does not exist, it is set to 0 before performing the operation. 
* An error is returned if the key contains a value of the wrong type or contains a string that can not be represented as 
  integer. This operation is limited to 64 bit signed integers.
* This is a string operation because Redis does not have a dedicated integer type. The string stored at the key is 
  interpreted as a base-10 64 bit signed integer to execute the operation.
* Redis stores integers in their integer representation, so for string values that actually hold an integer, there is no 
  overhead for storing the string representation of the integer.
* Return value 
    - Integer reply: the value of key after the increment.
```shell
SET key1 "10"                   # OK
INCR key1                       # 11 

DECR key2                       # 1. Since key2 does not exist, it is set to 0 and then decremented.
```

### LINDEX Command
* Returns the element at index index in the list stored at key. 
* The index is zero-based, so 0 means the first element, 1 the second element and so on. 
* Negative indices can be used to designate elements starting at the tail of the list. Here, -1 means the last element, 
  -2 means the penultimate and so forth.
* When the value at key is not a list, an error is returned.
* Return value
    - Bulk string reply: the requested element, or nil when index is out of range.
```shell
LPUSH list "World"              # 1
LPUSH list "Hello"              # 2

LINDEX list 0                   # "Hello"
LINDEX list -1                  # "World"
LINDEX list 3                   # (nil)
```

### LINSERT Command
* Inserts value in the list stored at key either before or after the reference value pivot.
* When key does not exist, it is considered an empty list and no operation is performed.
* An error is returned when key exists but does not hold a list value.
* Return value
    - Integer reply: the length of the list after the insert operation, or -1 when the value pivot was not found.
```shell
RPUSH list "Hello"              # 1
RPUSH list "World"              # 2

LINSERT list BEFORE "World" "1" # 3

LRANGE list 0 -1                # "Hello", "There", "World"
```

### LLEN Command
* Returns the length of the list stored at key. 
* If key does not exist, it is interpreted as an empty list and 0 is returned. 
* An error is returned when the value stored at key is not a list.
* Return value
    - Integer reply: the length of the list at key.
```shell
LPUSH list "World"              # 1
LPUSH list "Hello"              # 2

LLEN list                       # 2
```

### LPOP Command
* Removes and returns the first element of the list stored at key.
* Return value
    - Bulk string reply: the value of the first element, or nil when key does not exist.
```shell
RPUSH list "one"                # 1
RPUSH list "two"                # 2
RPUSH list "three"              # 3

LPOP list                       # "one"
```

### LPUSH Command
* Insert all the specified values at the head of the list stored at key. 
* If key does not exist, it is created as empty list before performing the push operations. 
* When key holds a value that is not a list, an error is returned.
* It is possible to push multiple elements using a single command call just specifying multiple arguments at the end of 
  the command. Elements are inserted one after the other to the head of the list, from the leftmost element to the 
  rightmost element. So for instance the command LPUSH mylist a b c will result into a list containing c as first 
  element, b as second element and a as third element.
* Return value
    - Integer reply: the length of the list after the push operations.
```shell
LPUSH list 00                   # 1. The length of the list after the lpush command.
LPUSH list 11 22 33             # 4. The length of the list after the lpush command.

LRANGE list 0 -1                # Show all elements of the list. 
```

### LPUSHX Command
* Inserts value at the head of the list stored at key, only if key already exists and holds a list. 
* In contrary to LPUSH, no operation will be performed when key does not yet exist.
* Return value
    - Integer reply: the length of the list after the push operation.
```shell
LPUSH list "World"              # 1

LPUSHX list "Hello"             # 2
LPUSHX otherlist "Hello"        # 0

LRANGE list 0 -1                # "Hello", "World"
LRANGE otherlist 0 -1           # (empty list or set)
```

### LRANGE Command
* Returns the specified elements of the list stored at key. 
* The offsets start and stop are zero-based indexes, with 0 being the first element of the list (the head of the list), 
  1 being the next element and so on.
* These offsets can also be negative numbers indicating offsets starting at the end of the list. For example, -1 is the 
  last element of the list, -2 the penultimate, and so on.
```shell
RPUSH list "one"                # 1
RPUSH list "two"                # 2
RPUSH list "three"              # 3

LRANGE list 0 0                 # "one"
LRANGE list -3 2                # "one", "two", "three"
LRANGE list -100 100            # "one", "two", "three"
LRANGE list 5 10                # (empty list or set)
```

### LSET Command
* Sets the list element at index to value. 
* An error is returned for out of range indexes.
* Return value
    - Simple string reply
```shell
LPUSH list "one"                # 1
LPUSH list "two"                # 2
LPUSH list "three"              # 3
LPUSH list "four"               # 4
LPUSH list "five"               # 5

LSET list 0 "four"              # OK
LSET list -2 "five"             # OK

LRANGE mylist 0 -1              # "four", "five", "three"
```

### MSET Command
* Sets the given keys to their respective values. 
* MSET replaces existing values with new values, just as regular SET. 
* Use MSETNX if you don't want to overwrite existing values.
* MSET is atomic, so all given keys are set at once. It is not possible for clients to see that some of the keys were 
  updated while others are unchanged.
* Return value
    - Simple string reply: always OK since MSET can't fail.
```shell
MSET key1 1 key2 2              # OK

GET key1                        # "1"
GET key2                        # "2"
```

### PERSIST Command
* Remove the existing timeout on key, turning the key from volatile (a key with an expire set) to persistent (a key that 
  will never expire as no timeout is associated).
* Return value
    - Integer reply 1 if the timeout was removed.
    - Integer reply 0 if key does not exist or does not have an associated timeout.
```shell
SET key1 1                      # OK
EXPIRE key1 100                 # 1
TTL key1                        # 98

PERSIST key1                    # 1
TTL key1                        # -1
```

### PING Command
* This command is often used to test if a connection is still alive, or to measure latency.
```shell
PING                        # PONG. Returns PONG if no argument is provided
PING "Hello World"          # "Hello World". Returns a copy of the argument as a bulk if provided.
```

### RENAME Command
* Renames key to newkey. 
* It returns an error when key does not exist. 
* If newkey already exists it is overwritten, when this happens RENAME executes an implicit DEL operation, so if the 
  deleted key contains a very big value it may cause high latency even if RENAME itself is usually a constant-time 
  operation.
* Return value
    - Simple string reply
```shell
SET key1 1                      # OK

RENAME key1 newkey              # OK
GET newkey                      # "1"
```

### RPOP Command
* Removes and returns the last element of the list stored at key.
* Return value
    - Bulk string reply: the value of the last element, or nil when key does not exist.
```shell
RPUSH list "one"                # 1
RPUSH list "two"                # 2
RPUSH list "three"              # 3

RPOP list                       # "three"
```

### RPUSH Command
* Insert all the specified values at the tail of the list stored at key. 
* If key does not exist, it is created as empty list before performing the push operation. 
* When key holds a value that is not a list, an error is returned.
* It is possible to push multiple elements using a single command call just specifying multiple arguments at the end of 
  the command. Elements are inserted one after the other to the tail of the list, from the leftmost element to the 
  rightmost element. So for instance the command RPUSH mylist a b c will result into a list containing a as first 
  element, b as second element and c as third element.
* Return value
    - Integer reply: the length of the list after the push operation.
```shell
RPUSH list 00                   # 1. The length of the list after the rpush command.
RPUSH list 11 22 33             # 4. The length of the list after the rpush command.

LRANGE list 0 -1                # Show all elements of the list. 
```

### RPUSHX Command
* Inserts value at the tail of the list stored at key, only if key already exists and holds a list. 
* In contrary to RPUSH, no operation will be performed when key does not yet exist.
* Return value
    - Integer reply: the length of the list after the push operation.
```shell
RPUSH list "Hello"              # 1

RPUSHX list "World              # 2
RPUSHX otherlist "World"        # 0

LRANGE list 0 -1                # "Hello", "World"
LRANGE myotherlist 0 -1         # (empty list or set)
```

### SET Command
* Set key to hold the string value. 
* If key already holds a value, it is overwritten, regardless of its type. 
* Any previous time to live associated with the key is discarded on successful SET operation.
* Set Command Options
    - EX seconds: Set the specified expire time, in seconds.
    - PX milliseconds: Set the specified expire time, in milliseconds.
    - NX: Only set the key if it does not already exist.
    - XX: Only set the key if it already exist.
* Since the SET command options can replace SETNX, SETEX, PSETEX, these commands might get deprecated in future.
* Set Return value
    - Simple string reply: OK if SET was executed correctly. 
    - Null reply: a Null Bulk Reply is returned if the SET operation was not performed because the user specified the 
      NX or XX option but the condition was not met.
```shell
SET key1 "Hello"                # OK. Set key1 to "Hello".
SET key2 "World"                # OK. Set key2 to "World".

SET key1 "Hello!!!"             # OK. Overwrites key1 to "Hello!!!" even if key1 exists.
SET key2 "WORLD" NX             # (nil). Set key2 to "WORLD" only if it does not exist.
SET key2 "Redis" XX             # OK. Use XX to only set the key if it already exist.

SET key3 "Redis" EX 60          # OK. Set TTL or expiry to 60 seconds.
SET key3 "Redis" EX 60 NX       # OK. Use EX and NX options together.

SET server:name "someserver"    # Keys can have colon (:) 
SET server:port "8080"          # Keys can have colon (:)
```

### TTL Command
* Returns the remaining time to live of a key that has a timeout. This introspection capability allows a Redis client to 
  check how many seconds a given key will continue to be part of the dataset.
* Return Value
    - Integer reply TTL in seconds.
    - Integer reply -2 if the key does not exist.
    - Integer reply -1 if the key exists but has no associated expire.
```shell
SET key1 1                      # OK
EXPIRE key1 100                 # 1

TTL key1                        # 97
```

### TODO
* None
