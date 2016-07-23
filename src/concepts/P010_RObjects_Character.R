# Description: Character Objects in R

# Character Objects
# 1. Character is entered using either matching double (") or single (’) quotes, but are printed using double quotes
#    (or sometimes without quotes).
# 2. Character use C-style escape sequences, using \ as the escape character. See ?Quotes for a full list. Some common
#    examples are as below
#    +--------------------------------------------------------------------------+
#    | Escape Sequence      Character                                           |
#    +--------------------------------------------------------------------------+
#    | \n                   Newline                                             |
#    | \"                   ASCII Apostrophe (")                                |
#    | \'                   ASCII Apostrophe (')                                |
#    | \`                   ASCII Grave Accent / Backtick (`)                   |
#    | \\                   backslash (\)                                       |
#    | \t                   Tab                                                 |
#    | \b                   Backspace                                           |
#    | \nnn                 Character with given octal code (1, 2 or 3 digits)  |
#    | \xnn	                Character with given hex code (1 or 2 hex digits)   |
#    | \unnnn	            Unicode character with given code (1--4 hex digits) |
#    | \Unnnnnnnn           Unicode character with given code (1--8 hex digits) |
#    +--------------------------------------------------------------------------+

# Create character vectors using the c() function.
x <- c("India", "China", "Russia")      # Using double quotes
y <- c('One', 'Two', 'Three')           # Using single quotes
z <- c('Red', "Green", 'Blue')          # Double quotes and single quotes can be combined
print(x)

# Concatenate character vectors using the c() function.
y <- c(x, y)
print(y)

# Concatenate character vectors using the paste() function.
# 1. The paste() function takes an arbitrary number of arguments and concatenates them one by one into character 
#    strings. Any numbers given among the arguments are coerced into character strings in the evident way, that is, 
#    in the same way they would be if they were printed. 
# 2. The arguments are by default separated in the result by a single blank character, but this can be changed by the
#    named argument, sep=string, which changes it to string, possibly empty.
# 3. The recycling of short lists takes place; thus c("X", "Y") is repeated 5 times to match the sequence 1:10
x <- paste(c("X","Y"), 1:10, sep="") # Same as c("X1", "Y2", "X3", "Y4", "X5", "Y6", "X7", "Y8", "X9", "Y10")

# TODO
# 1. None
