# Description: And and All Functions in Python

### Any Function
* Any function returns true if any of the items is True. It returns False if empty or all items are false.
* The general syntax is `any(list of iterables)`
* It short circuit the execution i.e. stop the execution as soon as the result is known.
* Any can be thought of as a sequence of OR operations on the provided iterables.
* Any returns False for empty iterables.

### All Function
* All function returns true if all of the items are True (or if the iterable is empty). 
* The general syntax is `all(list of iterables)`.
* All can be thought of as a sequence of AND operations on the provided iterables. 
* All function also short circuits the execution i.e. stop the execution as soon as the result is known.
* All returns True for empty iterables.

### All and Any Boolean Table
```
+-----------------------------------------+---------+---------+
|                                         |   any   |   all   |
+-----------------------------------------+---------+---------+
| All Truthy values                       |  True   |  True   |
+-----------------------------------------+---------+---------+
| All Falsy values                        |  False  |  False  |
+-----------------------------------------+---------+---------+
| One Truthy value (all others are Falsy) |  True   |  False  |
+-----------------------------------------+---------+---------+
| One Falsy value (all others are Truthy) |  True   |  False  |
+-----------------------------------------+---------+---------+
| Empty Iterable                          |  False  |  True   |
+-----------------------------------------+---------+---------+
```
