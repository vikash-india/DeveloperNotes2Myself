# Description: Filter Vowels and Consonants Using Vowels

# Note
# 1. If a function is already define, use it over a list using a map function.

# List of alphabets
alphabets = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
             'v', 'w', 'x', 'y', 'z']

# Function to filter vowels
def filter_vowels(alphabet):
    vowels = ['a', 'e', 'i', 'o', 'u']

    if (alphabet in vowels):
        return True
    else:
        return False

# Function to filter consonants
def filter_consonants(alphabet):
    vowels = ['a', 'e', 'i', 'o', 'u']

    if (alphabet not in vowels):
        return True
    else:
        return False

# Filter Vowels
filtered_vowels = filter(filter_vowels, alphabets)
print(filtered_vowels)
print(list(filtered_vowels))

# Filter Consonants
filtered_consonants = filter(filter_consonants, alphabets)
print(filtered_consonants)
print(list(filtered_consonants))

# Note: One can iterate over the returned object only once.
print('The filtered vowels are:')
for vowel in filtered_vowels:
    print(vowel)
