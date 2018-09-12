# Description: A Python Program to Use Redis as a Queue

import redis

# Create Redis connection
r = redis.Redis("localhost")

# Clear Redis
r.flushall()

# Push to the tail of the queue
r.rpush("queue", "one")
r.rpush("queue", "two")
r.rpush("queue", "three")
r.rpush("queue", "four")

# Push to the head of the queue
r.lpush("queue", "1")
r.lpush("queue", "2")
r.lpush("queue", "3")
r.lpush("queue", "4")

# All content of the queue
queue = r.lrange("queue", 0, -1)
print "Queue:", queue

# Length of the queue
queue_length = r.llen("queue")
print "Queue Length:", queue_length

# Pop from the head of the queue
queue_head_element = r.lpop("queue")
print "Queue Head Element:", queue_head_element

# Pop from the tail of the queue
queue_tail_element = r.rpop("queue")
print "Queue Tail Element:", queue_tail_element
