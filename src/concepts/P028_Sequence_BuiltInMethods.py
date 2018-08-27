# Description: Sequence Built-in Methods

# Sequence Methods
word = 'Hello'

print(len(word[1:3]))       # 2
print(ord('A'))             # 65
print(chr(65))              # A
print(str(65))              # 65

# Looping Sequence
# 1. The position index and corresponding value can be retrieved at the same time using the enumerate() function.
for i, v in enumerate(['tic', 'tac', 'toe']):
    print(i, v)

# Looping Multiple Sequences
# 1. To loop over two or more sequences at the same time, the entries can be paired with the zip() function.
questions = ['name', 'quest', 'favorite color']
answers = ['lancelot', 'the holy grail', 'blue']
for q, a in zip(questions, answers):
    print('What is your {0}?  It is {1}.'.format(q, a))

# Looping in Reverse Order
for i in reversed(range(1, 10, 2)):
    print(i)

# Looping in sorted order
basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
for fruit in sorted(set(basket)):
    print(fruit)
