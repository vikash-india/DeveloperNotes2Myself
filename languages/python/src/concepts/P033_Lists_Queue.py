# Description: List as a Queue

# Queue creation
queue = [1, 2, 3]
print("Queue: %s" % queue)

# Enqueue: Add to the queue
queue.append(4)
queue.append(5)
print("Post Enqueue: %s" % queue)

# Dequeue: Retrieve from a queue
item = queue.pop(0)
print("Item dequeued: %s" % item)
print("Post Dequeue: %s" % queue)

# Peek
print("Peek: %s" % queue[0])

# Queue using collections.deque
# 1. It is also possible to use a list as a queue like above but lists are not efficient for this purpose.
# 2. While appends and pops from the end of list are fast, doing inserts or pops from the beginning of a list is slow
#    because all of the other elements have to be shifted by one.
# 3. The collections.deque was designed to have fast appends and pops from both ends.
from collections import deque
print('-' * 40, 'Using collections.dequeue')

# Queue creation
queue = deque(["A", "B", "C"])
print("Queue: %s" % queue)

# Enqueue: Add to the queue
queue.append("D")                   # queue.appendleft("D") adds at the beginning of queue.
queue.append("E")
print("Post Enqueue: %s" % queue)

# Dequeue: Retrieve from a queue
item = queue.popleft()              # queue.pop() removes from the LAST
print("Item dequeued: %s" % item)
print("Post Dequeue: %s" % queue)
