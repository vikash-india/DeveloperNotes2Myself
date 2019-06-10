# Description: String Slicing in Python

word = "uncopyrightable"

sentence_one = "All languages had their birth, their apogee and decline."
sentence_two = "I speak three languages, Hindi, Body and Python."
sentence_three = "It is time for dead languages to be quiet."

#  Non-Slice Notation: Indexing Single Element
print(word[0])          # 'u'. Indices are 0 based. Outputs the character at position 0.
print(word[2])          # 'c'. Index are 0 based. Outputs the character at position 2 starting with 0.
print(word[-2])         # 'l'. Negative Index are counted from the end of the string. Outputs the character at position
                        # 2 from the end of the string.

# Slice Notation using Positive Indices: Includes lower bounds but excludes upper bound
print(word[2:6])        # copy. Outputs from index 2 (includes 2) to index 5 (excludes 6).
print(word[2:])         # copyrightable. Outputs from index 2 till the end. An omitted second index defaults to the
                        # size of the string being sliced.
print(word[:6])         # uncopy. Outputs from beginning to index 5. An omitted first index defaults to zero.
print(word[:])          # uncopyrightable. Outputs from beginning to end. Same as the string.

# Slice Notation Negative Indices: Position from the end of the string
print(word[:-1])        # uncopyrightabl. Outputs from beginning to 1 position before end. -1 means 1 position from end.
print(word[-5:])        # table. Outputs from 5 position from the end to the end of the string.
print(word[-9:-4])      # 'right'. The position 9 to position 4 from the end of the string.

# Degenerate slice indices are handled gracefully:
# 1. An index that is too large is replaced by the string size.
# 2. An index that is too small is replaced by 0.
# 3. An upper bound smaller than the lower bound returns an empty string.
print(word[2:500])      # copyrightable. 500 is replaced by the string size.
print(word[-200:500])   # uncopyrightable. -200 is replaced by 0 and 500 by string size.
print(word[100:105])    # ''. 100 and 105 are replaced by string size and returns an empty string.
print(word[800:500])    # ''. An upper bound smaller than the lower bound returns an empty string.
print(word[-500:-700])  # ''. An upper bound smaller than the lower bound returns an empty string.
print(word[-0:6])       # 'uncopy'. -0 is replaced by 0 since -0 is same as 0.

# A few other usage
print(word[:5] + word[5:])  #uncopyrightable. string[:i] + string[i:] is equal to the string itself.
