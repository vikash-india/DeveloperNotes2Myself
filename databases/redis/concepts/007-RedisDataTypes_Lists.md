# Description: Redis Lists

### Redis Lists
* Redis Lists are simply lists of strings, sorted by insertion order. 
* It is possible to add elements to a Redis List pushing new elements on the head (on the left) or on the tail 
  (on the right) of the list.
* A new list is created when one of the operations is performed against an empty key. Similarly the key is removed from 
  the key space if a list operation will empty the list. 
* The max length of a list is 2^32 - 1 (4294967295) elements. It is more than 4 billion of elements per list.
* The Redis Lists support constant time insertion and deletion of elements near the head and tail, even with many 
  millions of inserted items. 
* Accessing elements is very fast near the extremes of the list but is slow if you try accessing the middle of a very 
  big list, as it is an O(N) operation.
* Redis List as a Queue: Use commands LPUSH, LPOP, RPUSH, and RPOP.

### Commands Related to Redis Lists
* LINDEX    : Returns the element at an index.
* LINSERT   : Inserts value in the list stored at key either before or after the reference value pivot.
* LLEN      : Returns the length of the list stored at key.
* LPOP      : Pop from the BEGINNING of the list.
* LPUSH     : Push at the BEGINNING of the list.
* LPUSHX    : Push at the BEGINNING of the list if list exists.
* LRANGE    : Returns the specified elements of the list stored at key.
* LSET      : Sets the list element at index to value.
* RPOP      : Pop from the END of the list.
* RPUSH     : Push at the END of the list.
* RPUSHS    : Push at the END of the list if list exists.
