# Description: Redis String

### Redis Strings
* Strings are the most basic kind of Redis value. 
* Redis Strings are binary safe, this means that a Redis string can contain any kind of data, for instance a JPEG image 
  or a serialized Ruby object.
* A String value can be at max 512 Megabytes in length.
* A few application of Redis String
    - Use Strings as atomic counters using commands in the INCR family: INCR, DECR, INCRBY.
    - Append to strings with the APPEND command.
    - Use Strings as a random access vectors with GETRANGE and SETRANGE.
    - Encode a lot of data in little space, or create a Redis backed Bloom Filter using GETBIT and SETBIT.

### Commands Related to Redis Strings
* SET: Set a single string.
* GET: Retrieve the value of a string.
* MSET: Set a single string using a single command.

### TODO
* None
