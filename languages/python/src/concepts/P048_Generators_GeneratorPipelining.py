# Description: Generator Pipelining

# Note
# 1. Multiple generators can be chained together.
# 2. Write Here

# Without Generators
def process(num):
    # Step 1: Filter out odd numbers
    if num % 2 != 0:
        return

    # Step 2: Multiply by 3
    num = num * 3

    # Step 3: Print the result
    num = 'The Number: %s' % num

    return num

# Call the above code
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for num in nums:
    print(process(num))

# With Generators
def even_filter(nums):
    for num in nums:
        if num % 2 == 0:
            yield num

def multiply_by_three(nums):
    for num in nums:
        yield num * 3

def convert_to_string(nums):
    for num in nums:
        yield 'The Number: %s' % num

# Call the above code
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
pipeline = convert_to_string(multiply_by_three(even_filter(nums)))
for num in pipeline:
    print(num)
