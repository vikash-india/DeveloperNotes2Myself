# Description: Examples of Conditional Comprehensions

# Note
# 1. Conditional comprehensions can create a list with complex rules.

menu = [
    ["eggs", "boil"],
    ["eggs", "spam"],
    ["eggs", "sandwich", "spam"],
    ["eggs", "cheese", "sandwich"],
    ["cheese", "spam", "pizza"],
    ["cheese", "mushroom", "pizza"],
]

# Example 1: Code Without Using List Comprehension
for meal in menu:
    if "spam" not in meal:
        print(meal)

# Example 1: Code Using List Comprehension
simple_meal = [meal for meal in menu if "spam" not in meal]
print(simple_meal)

# Example 2: Code Without Using List Comprehension
print()
for meal in menu:
    if ("mushroom" in meal or "pizza" in meal) and not ("eggs" in meal and "spam" in meal):
        print(meal)

# Example 2: Code Using List Comprehension
complex_meal = [meal for meal in menu if
                ("mushroom" in meal or "pizza" in meal) and not ("eggs" in meal and "spam" in meal)]
print(complex_meal)
