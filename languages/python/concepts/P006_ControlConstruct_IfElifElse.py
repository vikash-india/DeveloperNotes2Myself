# Description: Control Structure if-elif-else

# Note
# 1. elif is optional
# 2. else is optional
number = 2
if number < 0:
    print('%d is Negative!' % (number))
elif number == 0:
    print('%d is Zero!' % (number))
elif number > 0:
    print('%d is Positive!' % (number))
else:
    print('%s is not a number' % (number))
