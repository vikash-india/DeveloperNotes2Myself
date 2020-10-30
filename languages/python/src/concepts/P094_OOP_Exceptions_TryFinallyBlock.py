# Description: Try-Finally Block

"""
### Note
* The try statement in Python can have an optional finally clause.
* The final clause is executed no matter what, and is generally used to release external resources.
* Use finally block to clean up the resource once used, whether it was successful or not.
"""

try:
    file = open("test.txt", encoding='utf-8')

    # Perform file operations and other operations
    pass
finally:
    file.close()
